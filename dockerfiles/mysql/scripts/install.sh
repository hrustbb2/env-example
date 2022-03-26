#!/usr/bin/env bash

apt update
apt install supervisor -y
apt install nano

echo "max_connections         = 100" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "connect_timeout         = 5" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "wait_timeout            = 600" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "max_allowed_packet      = 16M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "thread_cache_size       = 128" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "sort_buffer_size        = 4M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "bulk_insert_buffer_size = 16M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "tmp_table_size          = 32M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "max_heap_table_size     = 32M" >> /etc/mysql/mysql.conf.d/mysqld.cnf

echo "key_buffer_size         = 128M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "table_open_cache        = 400" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "myisam_sort_buffer_size = 512M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "concurrent_insert       = 2" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "read_buffer_size        = 2M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "read_rnd_buffer_size    = 1M" >> /etc/mysql/mysql.conf.d/mysqld.cnf

echo "query_cache_limit       = 128M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "query_cache_size        = 256M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "query_cache_type        = ON" >> /etc/mysql/mysql.conf.d/mysqld.cnf

echo "innodb_buffer_pool_size = 1G" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "innodb_log_buffer_size  = 8M" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "innodb_file_per_table   = 1" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "innodb_open_files       = 400" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "innodb_io_capacity      = 400" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "innodb_flush_method     = O_DIRECT" >> /etc/mysql/mysql.conf.d/mysqld.cnf

# echo "performance_schema      = ON" >> /etc/mysql/mysql.conf.d/mysqld.cnf
# echo "show_compatibility_56   = ON" >> /etc/mysql/mysql.conf.d/mysqld.cnf
# echo "sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" >> /etc/mysql/mysql.conf.d/mysqld.cnf