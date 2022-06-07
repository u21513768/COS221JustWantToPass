This is a step by step on how to intall the swimmer_db_3.sql dump on your installation of MariaDB.

0: Move the swimmer_db_3.sql to the current directory.
1: Open your MySQL Client terminal
2: Create a mock database with the command: "CREATE DATABASE swimmer_db";
3: Close the MySQL Client terminal
4: Open the MariaDB command prompt
5: Navigate to the MariaDB bin folder (using the command cd...), Each device will have their own path
6: Type in: "mysqldump -u root -p swimmer_db < swimmer_db.sql" and press enter
7: Now you should have the database installed on your device.