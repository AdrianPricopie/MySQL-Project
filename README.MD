# Database Project for Social Media 

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.
This project represents a simple social media application with functionalities for adding users, posts, comments, likes, and followers. It was developed using MySQL Workbench and includes CRUD operations for data management. Methods for Create (CREATE), Read (READ), Update (UPDATE), and Delete (DELETE) have been applied to the main entities such as Users, Posts, Comments, Likes, and Followers.

Tools used: MySQL Workbench.You can find the code [**here**](https://github.com/legendadr/MySQL-Project/blob/main/MySqlProjectFile.sql).



You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
The tables are connected in the following way:


## Database Structure

![DesignDataBases](https://github.com/AdrianPricopie/MySQL-Project/blob/main/DataBases_Structure.png)

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

#### 5. User_Followers
   - `FollowerID` (primary key, auto-increment)
   - `FollowerUserID` (foreign key referencing Users)
   - `User_Followers_id` (foreign key referencing Users)


**Primary Key**: A primary key is a column or set of columns that can serve as a unique identifier for each row in a table. It ensures that each row in the table is uniquely identified. In the 'Social Media' database, each table has an 'ID' column defined as the primary key at the time of table creation. This 'ID' is accompanied by the AUTO_INCREMENT attribute, which automatically generates a unique integer each time a new row is inserted into the table.

**Foreign Key**: A foreign key is a potential identifier that helps establish a connection with other tables. It always contains values that already exist as primary keys in the parent table. In the 'Social Media' database, foreign keys are utilized to establish relationships between tables, linking data based on the primary key of another table.


## Database Queries

### DDL (Data Definition Language)

The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)
```sql
# Create Database and use;
CREATE DATABASE SocialMedia;
USE socialmedia;

# Create table Users in SocialMedia database;
CREATE TABLE Users(
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(32) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PasswordUser VARCHAR(32) NOT NULL,
    PasswordByUSER INT,
    DateOfBirth DATE
);
```
In the example above, I created the "users" table, which includes the following columns:
- **User ID**, which is unique, is of type INT (integer), representing whole numbers.
- **Username** has the data type VARCHAR(32), a string of up to 32 characters, and it cannot be left empty.
- **Email** has the data type VARCHAR(255), a string of up to 255 characters. The UNIQUE constraint enforces that values in a column or a combination of columns must be unique across the entire dataset of the table.
- **Password** is of type VARCHAR(125), a string of up to 125 characters.
- **DateOfBirth** is of type DATE, storing only dates in the format year/month/day.


### DML (Data Manipulation Language)

In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.

Below you can find all the insert instructions that were created in the scope of this project:

```sql
insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values('AndreiIonut','Andrei.Ionut@yahoo.com','AndreiIon123','2001-02-01');
```

this is an example where I add multiple row in the same time
```sql
insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values ('BogdanPisica','BogdanPisica.MiauMiau@yahoo.com','PisicaBogdan','2010-02-01'),
('LegendAdr','Andrei.Margarint@yahoo.com','AndreiMargarint12','2000-12-01'),
('EduardGrigoras','Eduard.Grigoras77@yahoo.com','GrigorasIon123','1991-06-12'),
('Andrada','Andrada_Filosov@yahoo.com','AndradaMiauMiau','2011-03-19'),
('IoanaBaboi12','Baboi.Ionica@yahoo.com','Baboi@Ionica','2003-06-21');

INSERT INTO Posts (UserID, TextOfPosts, PostDate)
VALUES (1, 'Prima mea postare!', '2023-01-15');

-- Adăugare mai multe postări pentru diferiți utilizatori
INSERT INTO Posts (UserID, TextOfPosts, PostDate)
VALUES
  (2, 'Călătorind prin munți', '2023-01-16'),
  (3, 'Experiență în dezvoltarea software', '2023-01-17'),
  (4, 'Explorând lumea animalelor', '2023-01-18'),
  (5, 'Zi de naștere fericită!', '2023-01-19');

INSERT INTO Comments (PostID, UserID, CommentText, CommentDate)
VALUES (1, 2, 'Felicitări pentru prima postare!', '2023-01-20');

-- Adăugare mai multe comentarii pentru diferite postări și utilizatori
INSERT INTO Comments (PostID, UserID, CommentText, CommentDate)
VALUES
  (1, 3, 'Interesant!', '2023-01-21'),
  (2, 4, 'Excelentă priveliște!', '2023-01-22'),
  (3, 5, 'Impresionantă experiență!', '2023-01-23'),
  (4, 1, 'La mulți ani!', '2023-01-24');

INSERT INTO Likes (PostID, UserID )
VALUES (1, 2);

-- Adăugare mai multe like-uri pentru diferite postări și utilizatori
INSERT INTO Likes (PostID, UserID)
VALUES
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 1);


-- Utilizatorul cu ID-ul 1 este urmărit de utilizatorul cu ID-ul 2
INSERT INTO Followers (UserID, FollowerUserID)
VALUES (1, 2);

-- Utilizatorul cu ID-ul 3 este urmărit de utilizatorul cu ID-ul 1
INSERT INTO Followers (UserID, FollowerUserID)
VALUES (3, 1);

-- Utilizatorul cu ID-ul 2 este urmărit de utilizatorul cu ID-ul 4
INSERT INTO Followers (UserID, FollowerUserID)
VALUES (2, 4);

```
After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

```sql
#modificam username ul id ul 7

update Users
set Username='PetrisorIonut77'
where UserID=7;

#Stergem utilizatorul cu id ul 7
delete from Users
where UserID=7;

#Selectez ultimele postari pentru fiecare utilizator
SELECT Users.UserID, Users.Username, MAX(Posts.PostDate) AS LatestPostDate
FROM Users
LEFT JOIN Posts ON Users.UserID = Posts.UserID
GROUP BY Users.UserID, Users.Username;

-- modificam username ul pentru utilizatorul cu id ul 5

Update Users
SET Username= 'ioanaBaboi7'
WHERE UserID=5;

-- modificam textul postari cu id ul 2

Update Posts
Set TextofPosts='Calatorind prin Apuseni'
Where PostID=2;

-- modificam comentariul cu id ul 3
Update comments
set commentText='Experinta impresionanta!'
Where commentID=3;

-- modificam utilizatorul care urmareste utilizatorul cu id ul 3
Update followers 
set followerUserID= 5
Where UserID=3;

-- modificam data de nastere pentru utilizatorul cu id ul 1
Update Users
set DateofBirth='1995-05-15'
Where userID=1;
```

After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:


```sql
-- Ștergeți toate postările utilizatorilor născuți după anul 2000
DELETE FROM Posts
WHERE UserID IN (SELECT UserID FROM Users WHERE DateOfBirth > '2000-01-01');

-- Ștergeți toate urmările pentru utilizatorul cu ID-ul 2
DELETE FROM Followers
WHERE FollowerUserID = 2;
```


### DQL (Data Query Language)

In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:


```sql
-- Utilizarea HAVING pentru a filtra rezultatele în funcție de numărul minim de like-uri
SELECT Posts.PostID, TextOfPosts, COUNT(Likes.LikeID) AS LikeCount
FROM Posts
LEFT JOIN Likes ON Posts.PostID = Likes.PostID
GROUP BY Posts.PostID, TextOfPosts
HAVING LikeCount >= 2;

-- Utilizarea GROUP BY și COUNT pentru a număra câte postări are fiecare utilizator
SELECT Users.UserID, Users.Username, COUNT(Posts.PostID) AS NumarPostari
FROM Users
LEFT JOIN Posts ON Users.UserID = Posts.UserID
GROUP BY Users.UserID, Users.Username;

-- INNER JOIN pentru a obține postările și utilizatorii corespunzători
SELECT Posts.PostID, TextOfPosts, Users.Username
FROM Posts
INNER JOIN Users ON Posts.UserID = Users.UserID;


-- selectam postarea cu cele mai multe like uri
SELECT Posts.PostID, COUNT(Likes.LikeID) AS LikeCount
FROM Posts
LEFT JOIN Likes ON Posts.PostID = Likes.PostID
where Likes.PostId is not null
GROUP BY Posts.PostID
ORDER BY LikeCount DESC
LIMIT 1;

-- care a fost cea mai populara postare in 2023

select Posts.PostID,Posts.TextOfPosts,Count(likes.LikeCount) AS likeCount
from posts
left join likes on Posts.PostID = likes.PostID
WHERE year(Posts.Postdate) = 2023
group by Posts.PostID,Posts.TextOfPosts
Order by likeCount desc
limit 1;

-- cate comentarii au fost facute la nivel de posts

select Posts.PostID,count(comments.CommentID) as commentCount
from posts
left join comments on Posts.PostID = Comments.PostID
group by posts.PostID;

-- care utilizator nu are nici  un comentariu

select users.UserID,users.Username
from users
left join comments on users.UserID = comments.UserID
Where comments.CommentID is null;

-- care utilizator nu are nici o postare

select users.UserID,users.Username
from  users
left join posts on users.UserID = posts.PostID
where posts.postID is null;

-- selectam cati followers sunt per fiecare utilizator

select userID ,count(user_followers.FollowerUserID) as NumarFollowers
from user_followers
group by UserID;

-- Cautăm toate postările care conțin cuvântul "pisică"

SELECT * FROM Posts
WHERE TextOfPosts LIKE '%pisică%';

-- Selectăm toți utilizatorii, postările și comentariile aferente
SELECT  Users.Username, Posts.TextOfPosts, Comments.CommentText
FROM Users
LEFT JOIN Posts ON Users.UserID = Posts.UserID
LEFT JOIN Comments ON Posts.PostID = Comments.PostID
Where Posts.TextOfPosts is not null and Comments.CommentText is not null;

#Selectez ultimele postari pentru fiecare utilizator
SELECT Users.UserID, Users.Username, MAX(Posts.PostDate) AS LatestPostDate
FROM Users
LEFT JOIN Posts ON Users.UserID = Posts.UserID
GROUP BY Users.UserID, Users.Username;


#Afisam tabela users
select * from users ;

#Afișăm comentariile și utilizatorii care le-au făcut pentru postarea cu ID-ul 1
SELECT Comments.CommentID, CommentText, Users.Username
FROM Comments
INNER JOIN Users ON Comments.UserID = Users.UserID
WHERE Comments.PostID = 1;

#Adaugam un utilizator nou in tablea users
insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values('Petrisor','Petrisor.Ionut@yahoo.com','PetrisorIon123','2002-02-01');

-- Vizualizarea rezultatelor
SELECT * FROM Followers;

#Afișăm utilizatorii ale căror nume de utilizator încep cu litera 'A'
SELECT * FROM Users
WHERE Username LIKE 'A%';

#Afișăm utilizatorii ale căror nume de utilizator se termină cu litera 's'
SELECT * FROM Users
WHERE Username LIKE '%s';

#Afisam toate datele pentru usernameul Andrada
select * from Users where Username='Andrada';

#Afisam toate datele pentru utilizatorul cu ID ul 5
select * from Users where UserID='5';

#Afisati toate commentarile care contin textul Interesant!

select * from comments where CommentText like  '%Interesant!%'; 

#Afisam toate zilele de nastere ale utilizatorilor de pe platforma;

select dateOfBirth from Users;

#Afisam toate zilele de nastere ale utilizatorilor dupa anul 2000-01-01

select dateofbirth ,username from Users where dateofBirth > '2000-01-01';

#Afisam toate zilele de nastere ale utilizatorilor dupa anul 2005
    
select dateofbirth,username from Users where extract(year from dateofBirth)>2005;

#Afisam toate zilele de nastere ale utilizatorilor in functie de  luna a 2 a;

SELECT DateOfBirth
FROM Users
WHERE EXTRACT(MONTH FROM DateOfBirth) = 6;

#Afisam toate zilele de nastere ale utilizatorilor in functie de prima zi a luni
SELECT DateOfBirth
FROM Users
WHERE EXTRACT(DAY FROM DateOfBirth) = 1;

#Afisam postarile  utilizatorului cu id=1  intre datele 2023-01-17 si 2023-01-18

select * from posts where UserID = 1 and PostDate between '2023-01-17' and '2023-01-18';

#Afisăm toți utilizatorii urmăriți de utilizatorul cu ID-ul 2
SELECT * FROM Followers WHERE FollowerUserID = 2;


#Afișăm comentariile și utilizatorii care le-au făcut pentru postarea cu ID-ul 1
SELECT Comments.CommentID, CommentText, Users.Username
FROM Comments
INNER JOIN Users ON Comments.UserID = Users.UserID
WHERE Comments.PostID = 1;

#Adaugam un utilizator nou in tablea users
insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values('Petrisor','Petrisor.Ionut@yahoo.com','PetrisorIon123','2002-02-01');
```
## Conclusions:

This database project for a social media application has been a comprehensive and practical application of SQL knowledge gained throughout the Software Testing course. The following key points summarize the work and lessons learned:

**SQL Application:** The project provided hands-on experience in applying SQL concepts, including data definition, manipulation, and querying. Creating tables, establishing relationships, and performing CRUD operations enhanced the understanding of SQL in a real-world context.

**Database Design and Relationships:** Designing the database schema and establishing relationships between tables were crucial aspects of the project. The clear representation of one-to-many and many-to-one relationships laid a strong foundation for effective data management.

**Tools Proficiency:** Working with MySQL Workbench showcased proficiency in using database management tools. The ability to translate conceptual designs into executable SQL code was developed and honed during the project.

**Realistic Data Scenarios:** The inclusion of realistic data scenarios during testing demonstrated the importance of testing in a manner that reflects actual usage patterns. This contributed to the identification of potential issues and ensured the robustness of the database.

**Querying Strategies:** The project involved creating diverse querying scenarios, covering a range of use cases. This helped in developing effective querying strategies and understanding how to retrieve specific information from a complex database structure.

**Testing Considerations:** While testing was briefly mentioned, further emphasis on testing methodologies and strategies could enhance the project's overall quality. Testing is a critical aspect of software development, and a more detailed approach could be beneficial.

*In conclusion*, this database project has been a valuable opportunity to apply theoretical knowledge to a practical scenario, reinforcing SQL concepts and skills. It serves as a foundation for further exploration and improvement in database design and management. The experience gained from this project contributes to a broader understanding of software development and database administration.


