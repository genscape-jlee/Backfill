if [ -f /etc/nginx/fastcgi.conf ] && cmp -s /etc/defaults/etc/nginx/fastcgi.conf /etc/nginx/fastcgi.conf
then
    rm /etc/nginx/fastcgi.conf
fi

if [ -f /etc/nginx/fastcgi_params ] && cmp -s /etc/defaults/etc/nginx/fastcgi_params /etc/nginx/fastcgi_params
then
    rm /etc/nginx/fastcgi_params
fi

if [ -f /etc/nginx/koi-utf ] && cmp -s /etc/defaults/etc/nginx/koi-utf /etc/nginx/koi-utf
then
    rm /etc/nginx/koi-utf
fi

if [ -f /etc/nginx/koi-win ] && cmp -s /etc/defaults/etc/nginx/koi-win /etc/nginx/koi-win
then
    rm /etc/nginx/koi-win
fi

if [ -f /etc/nginx/mime.types ] && cmp -s /etc/defaults/etc/nginx/mime.types /etc/nginx/mime.types
then
    rm /etc/nginx/mime.types
fi

if [ -f /etc/nginx/nginx.conf ] && cmp -s /etc/defaults/etc/nginx/nginx.conf /etc/nginx/nginx.conf
then
    rm /etc/nginx/nginx.conf
fi

if [ -f /etc/nginx/scgi_params ] && cmp -s /etc/defaults/etc/nginx/scgi_params /etc/nginx/scgi_params
then
    rm /etc/nginx/scgi_params
fi

if [ -f /etc/nginx/uwsgi_params ] && cmp -s /etc/defaults/etc/nginx/uwsgi_params /etc/nginx/uwsgi_params
then
    rm /etc/nginx/uwsgi_params
fi

if [ -f /etc/nginx/win-utf ] && cmp -s /etc/defaults/etc/nginx/win-utf /etc/nginx/win-utf
then
    rm /etc/nginx/win-utf
fi

