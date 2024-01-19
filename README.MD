
# Social Media Project

This project represents a simple social media application with functionalities for adding users, posts, comments, likes, and followers. It was developed using MySQL Workbench and includes CRUD operations for data management. Methods for Create (CREATE), Read (READ), Update (UPDATE), and Delete (DELETE) have been applied to the main entities such as Users, Posts, Comments, Likes, and Followers.

I use: DML, or Data Manipulation Language, is another subset of SQL (Structured Query Language) that focuses on manipulating and processing data stored in a database. DML statements are used to retrieve, insert, update, and delete data within database tables. Some common DML statements include:Select,insert,update,delete.
DQL, or Data Query Language, is a subset of SQL (Structured Query Language) that specifically focuses on the retrieval of data from a database. DQL consists primarily of the SELECT statement, which is used to query and retrieve data from one or more tables. The main purpose of DQL is to allow users to specify the data they want to retrieve and the conditions for retrieval.
DL, or Data Definition Language, is a subset of SQL (Structured Query Language) that is used to define and manage the structure of a database. DDL statements are responsible for defining, altering, and deleting database objects such as tables, indexes, and views. Some common DDL statements include:



Here you can see the code [SqlFile](https://github.com/legendadr/MySQL-Project/blob/main/MySqlProjectFile.sql)

## Database Structure

### Tables

![Database Structure](https://github.com/legendadr/MySQL-Project/blob/main/designBazaDeDateSocialMedia.png)

1. **Users:**
   - `UserID` (primary key, auto-increment)
   - `Username` (username)
   - `Email` (email address)
   - `PasswordUser` (password)
   - `DateOfBirth` (date of birth)

2. **Posts:**
   - `PostID` (primary key, auto-increment)
   - `UserID` (foreign key referencing Users)
   - `TextOfPosts` (post text)
   - `PostDate` (post date)

3. **Comments:**
   - `CommentID` (primary key, auto-increment)
   - `PostID` (foreign key referencing Posts)
   - `UserID` (foreign key referencing Users)
   - `CommentText` (comment text)
   - `CommentDate` (comment date)

4. **Likes:**
   - `LikeID` (primary key, auto-increment)
   - `PostID` (foreign key referencing Posts)
   - `UserID` (foreign key referencing Users)
   - `LikeCount` (number of likes, default value 1)

5. **Followers:**
   - `FollowerID` (primary key, auto-increment)
   - `UserID` (foreign key referencing Users)
   - `FollowerUserID` (foreign key referencing Users)

## User table data:

![User data](https://github.com/legendadr/MySQL-Project/blob/main/User%20Table%20Data.png)

Each row in the table represents a user, and the columns represent different attributes or properties of a user (e.g., UserID, Username, Email, PasswordUser, DateOfBirth). This data allows simulating the behavior of the social media application and testing various functionalities. This sample data can be used for testing queries.

![User data](https://github.com/legendadr/MySQL-Project/blob/main/insert%20into%20table.png)

## Posts table data:

![User data](https://github.com/legendadr/MySQL-Project/blob/main/table%20posts.png)


## SQL Example Commands

The project includes SQL commands for creating databases, tables, and examples of data insertion.



