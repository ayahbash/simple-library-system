-- Etudiant table
CREATE TABLE Etudiant (
    Num_Etudiant VARCHAR2(20) PRIMARY KEY,
    Nom VARCHAR2(50) NOT NULL,
    Prenom VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    Telephone VARCHAR2(20)
);

-- Livre table
CREATE TABLE Livre (
    Code_Livre VARCHAR2(20) PRIMARY KEY,
    Titre VARCHAR2(100) NOT NULL,
    Auteur VARCHAR2(100) NOT NULL,
    Categorie VARCHAR2(50),
    Annee_Publication NUMBER(4),
    Quantite_Disponible NUMBER DEFAULT 0
);

-- Emprunt table
CREATE TABLE Emprunt (
    Num_Emprunt VARCHAR2(20) PRIMARY KEY,
    Num_Etudiant VARCHAR2(20) NOT NULL,
    Code_Livre VARCHAR2(20) NOT NULL,
    Date_Emprunt DATE NOT NULL,
    Date_Retour_Prevue DATE NOT NULL,
    Date_Retour_Effective DATE,
    Statut VARCHAR2(20) CHECK (Statut IN ('En cours', 'Rendu', 'En retard')),

    CONSTRAINT fk_etudiant FOREIGN KEY (Num_Etudiant) REFERENCES Etudiant(Num_Etudiant),
    CONSTRAINT fk_livre FOREIGN KEY (Code_Livre) REFERENCES Livre(Code_Livre)
);

-- Insert sample students
INSERT INTO Etudiant VALUES ('ETD01', 'Sekkoum', 'Serine', 'Ser.sekkou@email.com', '0549716947');
INSERT INTO Etudiant VALUES ('ETD02', 'Aya', 'Ammiche', 'aya.a.pika@email.com', '0788913555');
INSERT INTO Etudiant VALUES ('ETD03', 'Asma', 'Houache', 'wizard.asma@email.com', '0652200411');

-- Insert sample books
INSERT INTO Livre VALUES ('LIV01', 'In the Shade of the Quran','Sayyid Qutb', 'Islamic Studies', 1979, 5);
INSERT INTO Livre VALUES ('LIV02', 'The Question of Culture', 'Malek Bennabi', 'Sociology', 2003, 3);
INSERT INTO Livre VALUES ('LIV03', 'A wise mans mistake is worth a thousand', 'Majdi Kamel', 'Politics', 2009, 2);
INSERT INTO Livre VALUES ('LIV04', 'Al-Muqaddimah', 'Ibn khaldoun', 'Philosophy', 1377, 1);

-- Insert sample loans
INSERT INTO Emprunt VALUES ('EMP001', 'ETD01', 'LIV01', TO_DATE('01-03-2025', 'DD-MM-YYYY'),
                            TO_DATE('15-03-2025', 'DD-MM-YYYY'), NULL, 'En cours');
INSERT INTO Emprunt VALUES ('EMP002', 'ETD02', 'LIV02', TO_DATE('05-03-2025', 'DD-MM-YYYY'),
                           TO_DATE('19-03-2025', 'DD-MM-YYYY'), TO_DATE('18-03-2025', 'DD-MM-YYYY'), 'Rendu');
INSERT INTO Emprunt VALUES ('EMP003', 'ETD03', 'LIV03', TO_DATE('10-03-2025', 'DD-MM-YYYY'),
                           TO_DATE('24-03-2025', 'DD-MM-YYYY'), NULL, 'En retard');

----- CRUD Management - create / read / update / delete operations

---- Book Management
-- Add a new book
INSERT INTO Livre VALUES (:code, :titre, :auteur, :categorie, :annee, :quantite);

-- Update a book
UPDATE Livre
SET Titre = :titre, Auteur = :auteur, Categorie = :categorie,
    Annee_Publication = :annee, Quantite_Disponible = :quantite
WHERE Code_Livre = :code;

-- Delete a book
DELETE FROM Livre WHERE Code_Livre = :code;

-- Search books
SELECT * FROM Livre
WHERE Titre LIKE '%' || :searchTerm || '%'
   OR Auteur LIKE '%' || :searchTerm || '%'
   OR Categorie LIKE '%' || :searchTerm || '%';

-- List all books
SELECT * FROM Livre ORDER BY Titre;

---- Student Management
-- Add a new student
INSERT INTO Etudiant VALUES (:num, :nom, :prenom, :email, :telephone);

-- Update a student
UPDATE Etudiant
SET Nom = :nom, Prenom = :prenom, Email = :email, Telephone = :telephone
WHERE Num_Etudiant = :num;

-- Delete a student
DELETE FROM Etudiant WHERE Num_Etudiant = :num;

-- List all students
SELECT * FROM Etudiant ORDER BY Nom, Prenom;

-----Loan Management
-- Register a new loan
INSERT INTO Emprunt VALUES (:numEmprunt, :numEtudiant, :codeLivre,
                           :dateEmprunt, :dateRetourPrevue, NULL, 'En cours');

-- Update book quantity when loan is created
UPDATE Livre
SET Quantite_Disponible = Quantite_Disponible - 1
WHERE Code_Livre = :codeLivre;

-- Register a return
UPDATE Emprunt
SET Date_Retour_Effective = :dateRetour,
    Statut = CASE
        WHEN :dateRetour <= Date_Retour_Prevue THEN 'Rendu'
        ELSE 'En retard'
    END
WHERE Num_Emprunt = :numEmprunt;

-- Update book quantity when returned
UPDATE Livre
SET Quantite_Disponible = Quantite_Disponible + 1
WHERE Code_Livre = (SELECT Code_Livre FROM Emprunt WHERE Num_Emprunt = :numEmprunt);

-- List active loans
SELECT e.Num_Emprunt, et.Nom, et.Prenom, l.Titre, e.Date_Emprunt, e.Date_Retour_Prevue
FROM Emprunt e
JOIN Etudiant et ON e.Num_Etudiant = et.Num_Etudiant
JOIN Livre l ON e.Code_Livre = l.Code_Livre
WHERE e.Statut = 'En cours' OR e.Statut = 'En retard'
ORDER BY e.Date_Retour_Prevue;

-- Check for overdue loans
SELECT e.Num_Emprunt, et.Nom, et.Prenom, l.Titre, e.Date_Emprunt, e.Date_Retour_Prevue
FROM Emprunt e
JOIN Etudiant et ON e.Num_Etudiant = et.Num_Etudiant
JOIN Livre l ON e.Code_Livre = l.Code_Livre
WHERE e.Statut = 'En cours' AND e.Date_Retour_Prevue < SYSDATE;