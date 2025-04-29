package models;

import java.time.LocalDate;

public class Emprunt {
    private String numEmprunt;
    private String numEtudiant;
    private String codeLivre;
    private LocalDate dateEmprunt;
    private LocalDate dateRetourPrevue;
    private LocalDate dateRetourEffective;
    private String status;

    // constructor to quickly add a book loan
    public Emprunt(String numEmprunt, String numEtudiant, String codeLivre, LocalDate dateEmprunt, LocalDate dateRetourPrevue, LocalDate dateRetourEffective, String status) {
        this.numEmprunt = numEmprunt;
        this.numEtudiant = numEtudiant;
        this.codeLivre = codeLivre;
        this.dateEmprunt = dateEmprunt;
        this.dateRetourPrevue = dateRetourPrevue;
        this.dateRetourEffective = dateRetourEffective;
        this.status = status;
    }

    // getters & setters
    public String getNumEmprunt() {
        return numEmprunt;
    }
    public void setNumEmprunt(String numEmprunt) {
        this.numEmprunt = numEmprunt;
    }

    public String getNumEtudiant() {
        return numEtudiant;
    }
    public void setNumEtudiant(String numEtudiant) {
        this.numEtudiant = numEtudiant;
    }

    public String getCodeLivre() {
        return codeLivre;
    }
    public void setCodeLivre(String codeLivre) {
        this.codeLivre = codeLivre;
    }

    public LocalDate getDateEmprunt() {
        return dateEmprunt;
    }
    public void setDateEmprunt(LocalDate dateEmprunt) {
        this.dateEmprunt = dateEmprunt;
    }

    public LocalDate getDateRetourPrevue() {
        return dateRetourPrevue;
    }
    public void setDateRetourPrevue(LocalDate dateRetourPrevue) {
        this.dateRetourPrevue = dateRetourPrevue;
    }

    public LocalDate getDateRetourEffective() {
        return dateRetourEffective;
    }
    public void setDateRetourEffective(LocalDate dateRetourEffective) {
        this.dateRetourEffective = dateRetourEffective;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
