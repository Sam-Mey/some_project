-- 创建一个编码为 utf8mb4_unicode_ci 的数据库，数据库名称 sspanel 
MariaDB [(none)]> CREATE DATABASE sspanel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建一个本地数据库用户，并限制该用户的权限至只能操作新创建的这个数据库，使用 sspanel 作为用户名，使用 sspanel-password 作为这个用户的密码
MariaDB [(none)]> CREATE USER 'sspanel'@'localhost';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON sspanel.* TO 'sspanel'@'localhost' IDENTIFIED BY 'sspanel-password';
MariaDB [(none)]> FLUSH PRIVILEGES;
