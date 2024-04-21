#!/bin/bash

# Update your Linux system
sudo apt update -y

# Install Apache web server
sudo apt install apache2 -y

# Add the PHP ondrej repository
sudo add-apt-repository ppa:ondrej/php --yes

# Update your repository again
sudo apt update -y

# Install PHP 8.2
sudo apt install php8.2 -y

# Install some PHP dependencies needed for Laravel
sudo apt install php8.2-curl php8.2-dom php8.2-mbstring php8.2-xml php8.2-mysql zip unzip -y

# Enable rewrite
sudo a2enmod rewrite

# Restart Apache server
sudo systemctl restart apache2

# Change directory to the bin directory
cd /usr/bin

# Install Composer globally
sudo curl -sS https://getcomposer.org/installer | sudo php -q

# Move the content of the default composer.phar
sudo mv composer.phar composer

# Change directory to /var/www directory so we can clone the Laravel repo there
cd /var/www/

# Clone the Laravel repository
sudo git clone https://github.com/laravel/laravel.git

# Change ownership of the Laravel directory
sudo chown -R $USER:$USER /var/www/laravel

# Change directory to the Laravel directory
cd laravel/

# Install Composer autoloader
composer install --optimize-autoloader --no-dev --no-interaction
composer update --no-interaction

# Copy the content of the default .env file to .env
sudo cp .env.example .env

# Change ownership of storage and bootstrap/cache directories
sudo chown -R www-data storage
sudo chown -R www-data bootstrap/cache

# Change directory back to home
cd

# Create a new Apache virtual host file
cd /etc/apache2/sites-available/
sudo touch latest.conf

# Populate the latest.conf file with Apache virtual host configuration
sudo tee /etc/apache2/sites-available/latest.conf > /dev/null <<EOF
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/laravel/public

    <Directory /var/www/laravel>
        AllowOverride All
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/laravel-error.log
    CustomLog \${APACHE_LOG_DIR}/laravel-access.log combined
</VirtualHost>
EOF

# Enable the new virtual host
sudo a2ensite latest.conf

# Disable the default virtual host
sudo a2dissite 000-default.conf

# Restart Apache server
sudo systemctl restart apache2

# Install MySQL server and client
sudo apt install mysql-server -y
sudo apt install mysql-client -y

# Start the MySQL service
sudo systemctl start mysql

# Create a MySQL database and user
sudo mysql -uroot -e "CREATE DATABASE King;"
sudo mysql -uroot -e "CREATE USER 'kingsley'@'localhost' IDENTIFIED BY 'manafa20';"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON King.* TO 'kingsley'@'localhost';"

# Update .env file with MySQL database settings
sudo sed -i "23 s/^#//g" /var/www/laravel/.env
sudo sed -i "24 s/^#//g" /var/www/laravel/.env
sudo sed -i "25 s/^#//g" /var/www/laravel/.env
sudo sed -i "26 s/^#//g" /var/www/laravel/.env
sudo sed -i "27 s/^#//g" /var/www/laravel/.env
sudo sed -i '22 s/=sqlite/=mysql/' /var/www/laravel/.env
sudo sed -i '23 s/=127.0.0.1/=localhost/' /var/www/laravel/.env
sudo sed -i '24 s/=3306/=3306/' /var/www/laravel/.env
sudo sed -i '25 s/=laravel/=King/' /var/www/laravel/.env
sudo sed -i '26 s/=root/=kingsley/' /var/www/laravel/.env
sudo sed -i '27 s/=/=manafa20/' /var/www/laravel/.env

# Generate Laravel application key
sudo php artisan key:generate

# Create symbolic link for storage directory
sudo php artisan storage:link

# Run database migrations
sudo php artisan migrate

# Seed the database (if you have seeders)
sudo php artisan db:seed

# Restart Apache server
sudo systemctl restart apache2

