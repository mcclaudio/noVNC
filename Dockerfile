# docker build -t ilantv-novnc .
# docker run --name ilantv-novnc-app -p 8010:80 ilantv-novnc  
# http://127.0.0.1:8010/vnc.html?host=tv1.ilantv.smartsight.it&path=vnc&autoconnect=true&reconnect=true&show_dot=true&view_only=false&shared=true&resize=scale&encrypt=true&show_dot=true

FROM nginx:1.21-alpine 
COPY ./app /usr/share/nginx/html/app
COPY ./core /usr/share/nginx/html/core
COPY ./vendor /usr/share/nginx/html/vendor
COPY ./vnc.html /usr/share/nginx/html/vnc.html
COPY ./vnc_custom.html /usr/share/nginx/html/vnc_custom.html

COPY ./nginx-default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]