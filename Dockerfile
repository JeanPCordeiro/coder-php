FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root
ARG DEBIAN_FRONTEND=noninteractive 

# Install APT Utils
RUN apt update -y && \
    apt install -y apt-utils  && \
    apt install -y locales

# Install PHP & MySQL
RUN apt install -y mysql-client  && \    
    apt install -y software-properties-common && \ 
    add-apt-repository -y ppa:ondrej/php && \ 
    apt update -y && \
    apt install -y php8.1  && \
    apt install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Set back to coder user
USER coder
