FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root
ARG DEBIAN_FRONTEND=noninteractive 

# Install PHP
RUN apt-get update -y && \
    apt-get install -y locales  && \
    apt-get install -y php  && \
    apt-get install -y apt-utils  && \
    apt-get install -y php-cli php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Set back to coder user
USER coder
