
# Database Project for Social Media 

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.
This project represents a simple social media application with functionalities for adding users, posts, comments, likes, and followers. It was developed using MySQL Workbench and includes CRUD operations for data management. Methods for Create (CREATE), Read (READ), Update (UPDATE), and Delete (DELETE) have been applied to the main entities such as Users, Posts, Comments, Likes, and Followers.

Tools used: MySQL Workbench.You can find the code [**here**](https://github.com/legendadr/MySQL-Project/blob/main/MySqlProjectFile.sql).



You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
The tables are connected in the following way:


## Database Structure

![DesignDataBases](https://github.com/legendadr/MySQL-Project/blob/main/design%20baza%20de%20date%20noua.png)

### Table Relationships:

**One-to-Many:**

- Table Users (One) - Table Posts (Many): A user can have multiple posts, but each post belongs to a single user.
- Table Users (One) - Table Comments (Many): A user can post multiple comments, but each comment is associated with a single user.
- Table Users (One) - Table Likes (Many): A user can give multiple likes, but each like is associated with a single user.

**Many-to-One:**

- Table Posts (Many) - Table Users (One): Multiple posts can be associated with a single user.
- Table Comments (Many) - Table Posts (One): Multiple comments can be associated with a single post.
- Table Likes (Many) - Table Posts (One): Multiple likes can be associated with a single post.
- Table User_Followers (Many) - Table Users (One): Multiple followers can be associated with a single user.

### Tables

#### 1. Users
   - `UserID` (primary key, auto-increment)
   - `Username` (username)
   - `Email` (email address)
   - `PasswordUser` (password)
   - `DateOfBirth` (date of birth)

#### 2. Posts
   - `PostID` (primary key, auto-increment)
   - `UserID` (foreign key referencing Users)
   - `TextOfPosts` (post text)
   - `PostDate` (post date)

#### 3. Comments
   - `CommentID` (primary key, auto-increment)
   - `PostID` (foreign key referencing Posts)
   - `UserID` (foreign key referencing Users)
   - `CommentText` (comment text)
   - `CommentDate` (comment date)

#### 4. Likes
   - `LikeID` (primary key, auto-increment)
   - `PostID` (foreign key referencing Posts)
   - `UserID` (foreign key referencing Users)
   - `LikeCount` (number of likes, default value 1)

#### 5. User_Followers
   - `FollowerID` (primary key, auto-increment)
   - `UserID` (foreign key referencing Users)
   - `FollowerUserID` (foreign key referencing Users)


**Primary Key**: A primary key is a column or set of columns that can serve as a unique identifier for each row in a table. It ensures that each row in the table is uniquely identified. In the 'Social Media' database, each table has an 'ID' column defined as the primary key at the time of table creation. This 'ID' is accompanied by the AUTO_INCREMENT attribute, which automatically generates a unique integer each time a new row is inserted into the table.

**Foreign Key**: A foreign key is a potential identifier that helps establish a connection with other tables. It always contains values that already exist as primary keys in the parent table. In the 'Social Media' database, foreign keys are utilized to establish relationships between tables, linking data based on the primary key of another table.


## Database Queries

DDL (Data Definition Language)
The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

![DesignDataBases](https://github.com/legendadr/MySQL-Project/blob/main/create%20databases%20and%20use.png)

![User data](https://github.com/legendadr/MySQL-Project/blob/main/table3.png)

In the example above, I created the "users" table, which includes the following columns:
- **User ID**, which is unique, is of type INT (integer), representing whole numbers.
- **Username** has the data type VARCHAR(32), a string of up to 32 characters, and it cannot be left empty.
- **Email** has the data type VARCHAR(255), a string of up to 255 characters. The UNIQUE constraint enforces that values in a column or a combination of columns must be unique across the entire dataset of the table.
- **Password** is of type VARCHAR(125), a string of up to 125 characters.
- **DateOfBirth** is of type DATE, storing only dates in the format year/month/day.


DML (Data Manipulation Language)
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.

Below you can find all the insert instructions that were created in the scope of this project:

![User data](https://github.com/legendadr/MySQL-Project/blob/main/inset%231.png)

this is an example where I add multiple row in the same time
![Insert into table](https://github.com/legendadr/MySQL-Project/blob/main/insert%20into%20table.png)

![Insert into table](https://github.com/legendadr/MySQL-Project/blob/main/insert%233.png)

![Insert into table](https://github.com/legendadr/MySQL-Project/blob/main/insert%234.png)

After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:
![Insert into table](https://github.com/legendadr/MySQL-Project/blob/main/update.png)


## Tables Data:

- **User table data**

![User data](https://github.com/legendadr/MySQL-Project/blob/main/User%20Table%20Data.png)

Each row in the table represents a user, and the columns represent different attributes or properties of a user (e.g., UserID, Username, Email, PasswordUser, DateOfBirth). This data allows simulating the behavior of the social media application and testing various functionalities. This sample data can be used for testing queries.

For creating this table, I used **DML - Data Manipulation Language.** From the DML subset, instructions such as INSERT, UPDATE, DELETE are part of it. With these instructions, we can insert one or more rows into a previously created table.

This is an example:

![Insert into table](https://github.com/legendadr/MySQL-Project/blob/main/insert%20into%20table.png)

- **post table data**

  ![Posts table data](https://github.com/legendadr/MySQL-Project/blob/main/table%20posts.png) 

- **like table data**

  ![Like table data](https://github.com/legendadr/MySQL-Project/blob/main/table%20like.png) 

- **followers table data**

  ![Followers table data](https://github.com/legendadr/MySQL-Project/blob/main/table%20followers.png)



## SQL Example Commands

The project includes SQL commands for creating databases, tables, and examples of data insertion.



