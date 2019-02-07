version: '2'

services:
  db:
    container_name:  database
    image: mariadb  # Pull mysql image from Docker Hub
    ports:  # Set up ports exposed for other containers to connect to
      - "3306:3306"
    volumes:
      - ./dep/mysql:/docker-entrypoint-initdb.d
    environment:  # Set up mysql database name and password
      MYSQL_ROOT_PASSWORD: wordpress
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
  wordpress:
    image: wordpress
    container_name: wordpress 
    depends_on:
      - db
    ports:
      - "80:80"
    volumes: # Mount relative path source folder on host to absolute path destination folder on docker container
      - ./theme:/var/www/html/wp-content/themes/theme_name
      - ./dep/plugins:/var/www/html/wp-content/plugins
      - ./dep/uploads:/var/www/html/wp-content/uploads
    links: 
      - db
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: wordpress
  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin
    depends_on: 
      - db
    restart: always
    ports:
      - "8080:80"
    environment:
     - PMA_ARBITRARY=1
