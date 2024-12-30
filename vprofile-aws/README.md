# Prerequisites
#![vprofile](https://github.com/user-attachments/assets/56a2805c-f751-4fcd-9a97-a2bd185fe94d)

# General Explanation:
in the userdata file you can find and use the shell commands when you setup the instances so the deployment is easier
make sure you create the right security groups 
after everything is up use mvn to build and package your code and launch the app instance, in it you will config the service of tomcat



- JDK 11 
- Maven 3 
- MySQL 8

# Technologies 
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- Tomcat
- MySQL
- Memcached
- Rabbitmq
- ElasticSearch
# Database
Here,we used Mysql DB 
sql dump file:
- /src/main/resources/db_backup.sql
- db_backup.sql file is a mysql dump file.we have to import this dump to mysql db server
- > mysql -u <user_name> -p accounts < db_backup.sql


