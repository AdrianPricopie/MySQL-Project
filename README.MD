
# Social Media Project

This project represents a simple social media application with functionalities for adding users, posts, comments, likes, and followers. It was developed using MySQL Workbench and includes CRUD operations for data management. Methods for Create (CREATE), Read (READ), Update (UPDATE), and Delete (DELETE) have been applied to the main entities such as Users, Posts, Comments, Likes, and Followers.

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

## SQL Example Commands

The project includes SQL commands for creating databases, tables, and examples of data insertion.



