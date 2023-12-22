# Social Media Project

Acest proiect reprezintă o aplicație simplă de social media cu funcționalități de adăugare de utilizatori, postări, comentarii, aprecieri și urmăritori.

## Structura Bazei de Date

### Tabele

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
