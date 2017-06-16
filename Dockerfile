FROM x4j5/silverstripe-lamp
MAINTAINER Simon Winter

# Update php timezone & add missing /var/www/public
RUN apt-get update \
  && apt-get install -y php5-sqlite \
  && apt-get install -y php5-imagick \
  && cp /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.tmp \
  && sed '$ d' /etc/php5/apache2/php.ini.tmp > /etc/php5/apache2/php.ini \
  && rm -f /etc/php5/apache2/php.ini.tmp \
  && echo "date.timezone = Pacific/Auckland" >> /etc/php5/apache2/php.ini \
  && if ! [ -d /var/www/public ]; then mkdir /var/www/public; fi \
  && apache2ctl restart
