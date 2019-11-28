FROM php:7.3

# Install packages
RUN apt-get update -y && apt-get install -y openssl zip unzip git libzip-dev curl libsqlite3-dev libpng-dev

# Setup php
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_sqlite mbstring gd zip json exif pcntl

# This is a composer plugin that downloads packages in parallel to speed up the installation process.
RUN composer global require hirak/prestissimo

# Install node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Copy prject files
WORKDIR /app
COPY . /app

# Install dependancies
RUN composer install


# Expose the basic artisan server on port 8000
CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000
