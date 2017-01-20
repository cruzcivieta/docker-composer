FROM php:5.5.36-cli

MAINTAINER Daniel Cruz <daniel.cruz.civieta@gmail.com>

RUN useradd user -d /home/user -s /bin/bash && cp -r /etc/skel /home/user && chown user.user -R /home/user && echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get update && \
	apt-get install -y zip unzip curl git && \
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php --install-dir=/usr/bin --filename=composer && \
	php -r "unlink('composer-setup.php');"

USER user
