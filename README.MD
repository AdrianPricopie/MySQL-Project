
# Social Media Project

This project represents a simple social media application with functionalities for adding users, posts, comments, likes, and followers. It was developed using MySQL Workbench and includes CRUD operations for data management. Methods for Create (CREATE), Read (READ), Update (UPDATE), and Delete (DELETE) have been applied to the main entities such as Users, Posts, Comments, Likes, and Followers.

You can find the code [**here**](https://github.com/legendadr/MySQL-Project/blob/main/MySqlProjectFile.sql).


To create tables in SQL, I utilized **DDL (Data Definition Language),** a subset of SQL dedicated to defining and overseeing the structure of a database. DDL statements play a crucial role in creating, altering, and deleting database objects, including tables, indexes, and views.

This is an example:


  ![User data](https://github.com/legendadr/MySQL-Project/blob/main/table3.png)

In the example above, I created the "users" table, which includes the following columns:
- **User ID**, which is unique, is of type INT (integer), representing whole numbers.
- **Username** has the data type VARCHAR(32), a string of up to 32 characters, and it cannot be left empty.
- **Email** has the data type VARCHAR(255), a string of up to 255 characters. The UNIQUE constraint enforces that values in a column or a combination of columns must be unique across the entire dataset of the table.
- **Password** is of type VARCHAR(125), a string of up to 125 characters.
- **DateOfBirth** is of type DATE, storing only dates in the format year/month/day.




## Database Structure

 ![DesignDataBases](https://github.com/legendadr/MySQL-Project/blob/main/designDataBases.png)


### Table Relationships:

**One-to-Many:**

- Table Users (One) - Table Posts (Many): A user can have multiple posts, but each post belongs to a single user.
- Table Users (One) - Table Comments (Many): A user can post multiple comments, but each comment is associated with a single user.
- Table Users (One) - Table Likes (Many): A user can give multiple likes, but each like is associated with a single user.

**Many-to-One:**

- Table Posts (Many) - Table Users (One): Multiple posts can be associated with a single user.
- Table Comments (Many) - Table Posts (One): Multiple comments can be associated with a single post.
- Table Likes (Many) - Table Posts (One): Multiple likes can be associated with a single post.
- Table Followers (Many) - Table Users (One): Multiple followers can be associated with a single user.

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

#### 5. Followers
   - `FollowerID` (primary key, auto-increment)
   - `UserID` (foreign key referencing Users)
   - `FollowerUserID` (foreign key referencing Users)


## Tables Data:

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



