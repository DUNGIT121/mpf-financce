FROM php:8.2-fpm

WORKDIR /var/www
RUN apt update && apt install -y \
    git \
    curl \
    npm\
    libpng-dev \
    libonig-dev \
    libxml2-dev\
    libzip-dev \
    zip

RUN docker-php-ext-install mysqli pdo pdo_mysql zip

RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN mkdir -p /home/$user/.composer



