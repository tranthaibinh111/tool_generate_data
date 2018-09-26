# tool_generate_data
Tool generate data SQL Server 2016 and CockroachDB v2.0.5

Ngôn ngữ sử dụng python 2.7

Cài đặt tool như sau:
1) pip install -r ../requirements/base.txt

2) Khởi tạo database:
    CREATE DATABASE advanced_sql;

3) Khởi tạo table:
    ../SQL/01_author.sql
    ../SQL/01_publisher.sql
    ../SQL/01_book.sql
    ../SQL/01_author_book.sql

4) Vào ../utils/databases/__init__.py:
   - Nếu generate cho SQL Server 2016:
        # database = SQLServer()
   - Nếu generate cho CockroachDB v2.0.5:
        # database = Cockroach()

5) Run commandline:
    python __main__.py
