#Create Database and use;
create database SocialMedia;
use socialmedia;

#Create table Users in SocialMedia databases;
Create table Users(
UserID int primary key auto_increment,
Username varchar(32) not null,
Email varchar(255)  unique not null,
PasswordUser varchar(32) not null,
PasswordByUSER INT,
DateOfBirth date 
);
#stergem coloana
alter table Users
drop PasswordByUSER;

desc Users;

#modificarea tipului unei coloane
alter table Users
modify PasswordUser varchar(32);

Create table PostS(
PostID int primary key auto_increment,
UserID int,
TextOfPosts text,
PostDate date,
foreign key (UserID) references Users(UserID)
);
#Redenumim numele unei tablele
rename table PostS to Posts;

desc Posts;


Create table Comments (
CommentID int primary key not null auto_increment,
PostID int,
UserID int,
CommentText text,
CommentDate Date,
foreign key(PostID) references posts(PostID),
foreign key(UserID) references Users(UserID)
);

desc comments;
Create table likes(
LikeID int primary key auto_increment,
PostID int,
UserID int,
LikeCount int default 1,
FOREIGN KEY (PostID) REFERENCES Posts(PostID),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

#Afisam structura tabelei likes
desc likes;

CREATE TABLE User_Followers (
    User_Followers_ID INT PRIMARY KEY auto_increment,
    UserID INT,
    FollowerUserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (FollowerUserID) REFERENCES Users(UserID)
);

desc followers;

insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values('AndreiIonut','Andrei.Ionut@yahoo.com','AndreiIon123','2001-02-01');

select * from Users;
insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values ('BogdanPisica','BogdanPisica.MiauMiau@yahoo.com','PisicaBogdan','2010-02-01'),
('LegendAdr','Andrei.Margarint@yahoo.com','AndreiMargarint12','2000-12-01'),
('EduardGrigoras','Eduard.Grigoras77@yahoo.com','GrigorasIon123','1991-06-12'),
('Andrada','Andrada_Filosov@yahoo.com','AndradaMiauMiau','2011-03-19'),
('IoanaBaboi12','Baboi.Ionica@yahoo.com','Baboi@Ionica','2003-06-21');

desc Posts;

-- Adăugare postare pentru utilizatorul cu ID-ul 1
INSERT INTO Posts (UserID, TextOfPosts, PostDate)
VALUES (1, 'Prima mea postare!', '2023-01-15');

-- Adăugare mai multe postări pentru diferiți utilizatori
INSERT INTO Posts (UserID, TextOfPosts, PostDate)
VALUES
  (2, 'Călătorind prin munți', '2023-01-16'),
  (3, 'Experiență în dezvoltarea software', '2023-01-17'),
  (4, 'Explorând lumea animalelor', '2023-01-18'),
  (5, 'Zi de naștere fericită!', '2023-01-19');

-- Vizualizarea rezultatelor
SELECT * FROM Posts;

-- Adăugare comentariu pentru postarea cu ID-ul 1 de la utilizatorul cu ID-ul 2
INSERT INTO Comments (PostID, UserID, CommentText, CommentDate)
VALUES (1, 2, 'Felicitări pentru prima postare!', '2023-01-20');

-- Adăugare mai multe comentarii pentru diferite postări și utilizatori
INSERT INTO Comments (PostID, UserID, CommentText, CommentDate)
VALUES
  (1, 3, 'Interesant!', '2023-01-21'),
  (2, 4, 'Excelentă priveliște!', '2023-01-22'),
  (3, 5, 'Impresionantă experiență!', '2023-01-23'),
  (4, 1, 'La mulți ani!', '2023-01-24');

-- Vizualizarea rezultatelor
SELECT * FROM Comments;

-- Adăugare like pentru postarea cu ID-ul 1 de la utilizatorul cu ID-ul 2
INSERT INTO Likes (PostID, UserID, LikeCount)
VALUES (1, 2, 1);

-- Adăugare mai multe like-uri pentru diferite postări și utilizatori
INSERT INTO Likes (PostID, UserID, LikeCount)
VALUES
  (1, 3, 1),
  (2, 4, 1),
  (3, 5, 1),
  (4, 1, 1);

-- Vizualizarea rezultatelor
SELECT * FROM Likes;

-- Utilizatorul cu ID-ul 1 este urmărit de utilizatorul cu ID-ul 2
INSERT INTO Followers (UserID, FollowerUserID)
VALUES (1, 2);

-- Utilizatorul cu ID-ul 3 este urmărit de utilizatorul cu ID-ul 1
INSERT INTO Followers (UserID, FollowerUserID)
VALUES (3, 1);

-- Utilizatorul cu ID-ul 2 este urmărit de utilizatorul cu ID-ul 4
INSERT INTO Followers (UserID, FollowerUserID)
VALUES (2, 4);

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

select * from comments where CommentText = 'Interesant!'; 

#Afisam toate zilele de nastere ale utilizatorilor de pe platforma;

select dateOfBirth from Users;

#Afisam toate zilele de nastere ale utilizatorilor dupa anul 2000-01-01

select dateofbirth ,username from Users where dateofBirth > '2000-01-01';

#Afisam postarile  utilizatorului cu id=1  intre datele 2023-01-17 si 2023-01-18

select * from posts where UserID = 1 and PostDate between '2023-01-17' and '2023-01-18';

#Afisăm toți utilizatorii urmăriți de utilizatorul cu ID-ul 2
SELECT * FROM Followers WHERE FollowerUserID = 2;

#Afisăm toate postările care au primit like-uri, împreună cu numărul total de like-uri pentru fiecare postare
SELECT Posts.PostID, TextOfPosts, COUNT(Likes.LikeID) AS LikeCount
FROM Posts
LEFT JOIN Likes ON Posts.PostID = Likes.PostID
GROUP BY Posts.PostID, TextOfPosts;

#Afisăm toate postările care au primit cel puțin 2 like-uri
SELECT Posts.PostID, TextOfPosts, COUNT(Likes.LikeID) AS LikeCount
FROM Posts
LEFT JOIN Likes ON Posts.PostID = Likes.PostID
GROUP BY Posts.PostID, TextOfPosts
HAVING LikeCount >= 2;

#Realizăm o îmbinare a fiecărui utilizator cu toate postările (toate combinațiile posibile)
SELECT Users.UserID, Users.Username, Posts.PostID, Posts.TextOfPosts
FROM Users
CROSS JOIN Posts;

#Afișăm comentariile și utilizatorii care le-au făcut pentru postarea cu ID-ul 1
SELECT Comments.CommentID, CommentText, Users.Username
FROM Comments
INNER JOIN Users ON Comments.UserID = Users.UserID
WHERE Comments.PostID = 1;

#Adaugam un utilizator nou in tablea users
insert into Users(Username,Email,PasswordUser,DateOfBirth)
Values('Petrisor','Petrisor.Ionut@yahoo.com','PetrisorIon123','2002-02-01');

#Afisam tabela users
select * from users ;

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

-- Adaugă încă 5 like-uri pentru postarea cu ID-ul 1
UPDATE Likes
SET LikeCount = LikeCount + 5
WHERE PostID = 1;

-- Afișează media like-urilor pentru toate postările
SELECT AVG(LikeCount) AS AvgLikes
FROM Likes;

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
-- modificam numarul de like uri pentru postarea cu id ul 1
Update likes
set likeCount=10
Where PostID=1;

-- modificam utilizatorul care urmareste utilizatorul cu id ul 3
Update followers 
set followerUserID= 5
Where UserID=3;

-- modificam data de nastere pentru utilizatorul cu id ul 1
Update Users
set DateofBirth='1995-05-15'
Where userID=1;

-- Ștergeți toate postările utilizatorilor născuți după anul 2000
DELETE FROM Posts
WHERE UserID IN (SELECT UserID FROM Users WHERE DateOfBirth > '2000-01-01');

-- Ștergeți toate urmările pentru utilizatorul cu ID-ul 2
DELETE FROM Followers
WHERE FollowerUserID = 2;


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







