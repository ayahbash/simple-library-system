package models;

public class Etudiant {
    private String numEtudiant;
    private String nom;
    private String prenom;
    private String email;
    private String telephone;

    // constructor to quickly add a new student
    public Etudiant(String numEtudiant, String nom, String prenom, String email, String telephone) {
        this.numEtudiant = numEtudiant;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.telephone = telephone;
    }

    // getters & setters to update easily later
    public String getNumEtudiant() {
        return numEtudiant;
    }
    public void setNumEtudiant(String numEtudiant) {
        this.numEtudiant = numEtudiant;
    }

    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
