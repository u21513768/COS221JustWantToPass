This is a step by step on how to intall the swimmer_db_3.sql dump on your installation of MariaDB.

0: Move the swimmer_db_FINAL.sql to the desired directory.
1: Open the MariaDB command prompt
2: Login to MariaDB using "mariadb -u root -p"
3: Enter your password to gain access.
4: Create a swimmer_db database with the command: "CREATE DATABASE swimmer_db;"
5: Exit MariaDB with "exit;"
6: Navigate to the directory containing the swimmer_db_FINAL.sql file using the cd command.
7: Type in: "mysql -u root -p swimmer_db < swimmer_db_FINAL.sql" and press enter
8: Enter your password.
9: Log back in to MariaDB using steps 2-3. 
10: Type the command "use swimmer_db;"
11: Now you should have the database installed on your device.