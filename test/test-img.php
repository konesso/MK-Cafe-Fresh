<?php

function optimize($filePath) 
{
    /**
     * Compress image
     */
    $imagick        = new Imagick();

    $rawImage = file_get_contents($filePath);

    $imagick->readImageBlob($rawImage);
    $imagick->stripImage();

    // Define image
    $width      = $imagick->getImageWidth();
    $height     = $imagick->getImageHeight();

    // Compress image
    $imagick->setImageCompressionQuality(85);

    $image_types = getimagesize($filePath);

    // Get thumbnail image
    $imagick->thumbnailImage($width, $height);

    // Set image as based its own type
    if ($image_types[2] === IMAGETYPE_JPEG)
    {
        $imagick->setImageFormat('jpeg');

        $imagick->setSamplingFactors(array('2x2', '1x1', '1x1'));

        $profiles = $imagick->getImageProfiles("icc", true);

        $imagick->stripImage();

        if(!empty($profiles)) {
            $imagick->profileImage('icc', $profiles['icc']);
        }

        $imagick->setInterlaceScheme(Imagick::INTERLACE_JPEG);
        $imagick->setColorspace(Imagick::COLORSPACE_SRGB);
    }
    else if ($image_types[2] === IMAGETYPE_PNG) 
    {
        $imagick->setImageFormat('png');
    }
    else if ($image_types[2] === IMAGETYPE_GIF) 
    {
        $imagick->setImageFormat('gif');
    }

    // Get image raw data
    $rawData = $imagick->getImageBlob();

    // Destroy image from memory
    $imagick->destroy();

    return $rawData;
}
function thumbGenerator($dir,$tmpName,$fileType,$size){
    $saveFileType = "jpg";
    $imagePath = $dir.$tmpName.".".$fileType;
    $image = new Imagick();
    $image->readimage($imagePath);
    if($fileType == "psd"){
        $image->setIteratorIndex(0);
    }
	$image->setImageBackgroundColor('white');
	/* Simplify this code section below
    $dimensions = $image->getImageGeometry();
    $width = $dimensions['width'];
    $height = $dimensions['height'];
	*/      
    list($width,$height) = $image->getImageGeometry();  // <--- new code
	/* Use $size for the pixel width/height instead and remove the code below*/
    if($size == "large"){
        $maxWidth = 720;
        $maxHeight =720;
    }
    if($size == "small"){
        $maxWidth = 250;
        $maxHeight =333;
    }

	$image->setImageCompressionQuality(85);
	
    if($height > $width){
        //Portrait
        if($height > $size) 
            $image->thumbnailImage(0, $size);
            $dimensions = $image->getImageGeometry();
            if($width > $size){  // <--- use the previously created $width variable
                $image->thumbnailImage($size, 0);
            }
	/* Don't need this duplicate code.

    }elseif($height < $width){
        //Landscape
        $image->thumbnailImage($maxWidth, 0);
	*/
    }else{
        // square or landscape
        $image->thumbnailImage($maxWidth, 0);
    }
	
	$image->setImageFormat('jpeg');

	$image->setSamplingFactors(array('2x2', '1x1', '1x1'));

	$profiles = $image->getImageProfiles("icc", true);

	$image->stripImage();

	if(!empty($profiles)) {
		$image->profileImage('icc', $profiles['icc']);
	}

	$image->setInterlaceScheme(Imagick::INTERLACE_JPEG);
	$image->setColorspace(Imagick::COLORSPACE_SRGB);
		
	/*  DRY - do not repeat yourself - Simplify it and use the pixel width in the image name
    if($size == "large"){
        $image->writeImage($dir . $tmpName."-lg.".$saveFileType);
    }
    if($size == "small"){
        $image->writeImage($dir . $tmpName."-sm.".$saveFileType);;
    }
	*/
	$image->writeImage($dir . $tmpName."-".$size.".".$saveFileType);;
}
function backgroundMasking()
{
    //Load the image
    $imagick = new \Imagick(realpath('images/chair.jpeg'));
 
    $backgroundColor = "rgb(255, 255, 255)";
    $fuzzFactor = 0.1;
 
    // Create a copy of the image, and paint all the pixels that
    // are the background color to be transparent
    $outlineImagick = clone $imagick;
    $outlineImagick->transparentPaintImage(
        $backgroundColor, 0, $fuzzFactor * \Imagick::getQuantum(), false
    );
     
    // Copy the input image
    $mask = clone $imagick;
    // Deactivate the alpha channel if the image has one, as later in the process
    // we want the mask alpha to be copied from the colour channel to the src
    // alpha channel. If the mask image has an alpha channel, it would be copied
    // from that instead of from the colour channel.
    $mask->setImageAlphaChannel(\Imagick::ALPHACHANNEL_DEACTIVATE);
    //Convert to gray scale to make life simpler
    $mask->transformImageColorSpace(\Imagick::COLORSPACE_GRAY);
 
    // DstOut does a "cookie-cutter" it leaves the shape remaining after the
    // outlineImagick image, is cut out of the mask.
    $mask->compositeImage(
        $outlineImagick,
        \Imagick::COMPOSITE_DSTOUT,
        0, 0
    );
     
    // The mask is now black where the objects are in the image and white
    // where the background is.
    // Negate the image, to have white where the objects are and black for
    // the background
    $mask->negateImage(false);
 
    $fillPixelHoles = false;
     
    if ($fillPixelHoles == true) {
        // If your image has pixel sized holes in it, you will want to fill them
        // in. This will however also make any acute corners in the image not be
        // transparent.
         
        // Fill holes - any black pixel that is surrounded by white will become
        // white
        $mask->blurimage(2, 1);
        $mask->whiteThresholdImage("rgb(10, 10, 10)");
 
        // Thinning - because the previous step made the outline thicker, we
        // attempt to make it thinner by an equivalent amount.
        $mask->blurimage(2, 1);
        $mask->blackThresholdImage("rgb(255, 255, 255)");
    }
 
    //Soften the edge of the mask to prevent jaggies on the outline.
    $mask->blurimage(2, 2);
 
    // We want the mask to go from full opaque to fully transparent quite quickly to
    // avoid having too many semi-transparent pixels. sigmoidalContrastImage does this
    // for us. Values to use were determined empirically.
    $contrast = 15;
    $midpoint = 0.7 * \Imagick::getQuantum();
    $mask->sigmoidalContrastImage(true, $contrast, $midpoint);
 
    // Copy the mask into the opacity channel of the original image.
    // You are probably done here if you just want the background removed.
    $imagick->compositeimage(
        $mask,
        \Imagick::COMPOSITE_COPYOPACITY,
        0, 0
    );
 
    // To show that the background has been removed (which is difficult to see
    // against a plain white webpage) we paste the image over a checkboard
    // so that the edges can be seen.
     
    // Create the check canvas
    $canvas = new \Imagick();
    $canvas->newPseudoImage(
        $imagick->getImageWidth(),
        $imagick->getImageHeight(),
        "pattern:checkerboard"
    );
 
    // Copy the image with the background removed over it.
    $canvas->compositeimage($imagick, \Imagick::COMPOSITE_OVER, 0, 0);
     
	$canvas->trimImage(0);
	
    //Output the final image
    $canvas->setImageFormat('png');
    header("Content-Type: image/png");
    echo $canvas->getImageBlob();
}


$dir = 'test-psd/';
$images = glob($dir."*.{psd,jpg,png,gif}", GLOB_BRACE);

foreach($images as $k => $image){
	$path_parts = pathinfo($image);
	
	
	$im = new Imagick($image);

	/* Trim the image. */
	$im->trimImage(0);
	
	if(!file_exists('final')) mkdir('final');
	$im->writeImage("final/". $path_parts['filename'].'.'.$path_parts['extension']);
	
	
	/* Ouput the image */
	
	var_dump($path_parts['dirname'].'/', $path_parts['filename'] , $path_parts['extension'],  "small");
	//thumbGenerator($path_parts['dirname'].'/', $path_parts['filename'] , $path_parts['extension'],  "small");
}

//
?>
