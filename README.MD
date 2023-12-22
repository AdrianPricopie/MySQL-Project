# Social Media Project

Acest proiect reprezintă o aplicație simplă de social media cu funcționalități de adăugare de utilizatori, postări, comentarii, aprecieri și urmăritori.
A fost dezvoltat folosind MySQL Workbench și include operațiile CRUD pentru gestionarea datelor. S-au aplicat metode de adăugare (CREATE), citire (READ), actualizare (UPDATE) și ștergere (DELETE) pentru entitățile principale, precum Users, Posts, Comments, Likes și Followers.
[SqlFile](https://github.com/legendadr/MySQL-Project/blob/main/MySqlProjectFile.sql)
## Structura Bazei de Date

### Tabele

  ![Daily report](https://github.com/legendadr/MySQL-Project/blob/main/designBazaDeDateSocialMedia.png)

1. **Users:**
   - `UserID` (cheie primară, auto-incrementare)
   - `Username` (nume de utilizator)
   - `Email` (adresă de email)
   - `PasswordUser` (parolă)
   - `DateOfBirth` (dată de naștere)

2. **Posts:**
   - `PostID` (cheie primară, auto-incrementare)
   - `UserID` (cheie externă către Users)
   - `TextOfPosts` (textul postării)
   - `PostDate` (dată postare)

3. **Comments:**
   - `CommentID` (cheie primară, auto-incrementare)
   - `PostID` (cheie externă către Posts)
   - `UserID` (cheie externă către Users)
   - `CommentText` (textul comentariului)
   - `CommentDate` (dată comentariu)

4. **Likes:**
   - `LikeID` (cheie primară, auto-incrementare)
   - `PostID` (cheie externă către Posts)
   - `UserID` (cheie externă către Users)
   - `LikeCount` (numărul de aprecieri, cu valoare implicită 1)

5. **Followers:**
   - `FollowerID` (cheie primară, auto-incrementare)
   - `UserID` (cheie externă către Users)
   - `FollowerUserID` (cheie externă către Users)

## Comenzi SQL Exemplificative

Proiectul include comenzi SQL de creare a bazelor de date, tabelelor și exemple de adăugare de date.

### Exemplu de Utilizare


1. Clonați proiectul:

   ```bash
   git clone https://github.com/username/social-media-project.git

2. Deschideți fișierul SQL în MySQL Workbench și executați comenzile pentru a crea baza de date și tabelele.

3. Adăugați date de exemplu folosind comenzile de inserare (INSERT) pentru a popula tabelele.

4. Realizați interogări folosind limbajul SQL pentru a obține informații despre utilizatori, postări, comentarii, etc.
