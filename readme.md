npm -v
3.10.10

node -v
v6.17.1

//dodanie obszaru roboczego

> devtools > zrodlo > Obszar roboczy > folder projektu

1. Map your custom domain name to localhost in HOSTS file.
   Where to usually find the hosts file:

Unix (Linux,Mac): /etc/hosts.
Windows: C:\Windows\System32\drivers\etc\hosts
Open hosts file and add below line.

127.0.0.1 www.name.loc
127.0.0.1 name.loc

2. C:\xampp\apache\conf\extra\httpd-vhosts
   Add below content to httpd-vhosts.conf

<VirtualHost \*>
ServerName www.name.loc
ServerAlias name.loc
DocumentRoot "C:/xampp/htdocs/name"

</VirtualHost>

If you have port for your localhost, then add it as <VirtualHost \*:80>

Restart apache,Now you can access http://example.com in your browser.

3. If you want to access https://example.com
   Add below line to httpd-vhosts.conf

<VirtualHost \*:443>
DocumentRoot "C:/xampp/htdocs/example"
ServerName www.example.com
SSLEngine on
SSLCertificateFile "conf/ssl.crt/server.crt"
SSLCertificateKeyFile "conf/ssl.key/server.key"
<Directory "C:/xampp/htdocs/example">
AllowOverride All
Order allow,deny
Allow from all
</Directory>
</VirtualHost>

4. TIP:
   This happened with me as well. And I resolved it. In my case, it was happening because of the SSL module. So, turning it off got me out of the trouble. Just Open the httpd.conf file and comment the SSL include code by adding # to the front of the code as given below.

# Secure (SSL/TLS) connections

# Include conf/extra/httpd-ssl.conf

aby zbudować projekt:
nvm use 6
gulp live

function replaceURL() {
var currentURL = window.location.href;
var targetURL = 'https://pracownicy.mkfresh.pl/client-new.php?register';

    if (currentURL === targetURL) {
        let newURL = currentURL + '&wholesaler=true';
        window.locaction.href = newURL;
    }

}

app_shop.run(
replaceURL(),
'all',
'.client-new_page',
true,
)

pracownicy.mkfresh.pl/client-new.php?register&wholesaler=true
tutaj jest inny kod: tzn baza ta sama ale noindex i dodany element do href z powyższego kodu
