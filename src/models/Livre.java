package models;

package models;

public class Livre {
    private String codeLivre;
    private String titre;
    private String auteur;
    private String categorie;
    private int anneePublication;
    private int quantiteDisponible;

    // constructor to quickly add a book
    public Livre(int codeLivre, String titre, String auteur, String categorie, int anneePublication, int quantiteDisponible) {
        this.codeLivre = codeLivre;
        this.titre = titre;
        this.auteur = auteur;
        this.categorie = categorie;
        this.anneePublication = anneePublication;
        this.quantiteDisponible = quantiteDisponible;
    }

    // getters & setters
    public String getCodeLivre() {
        return codeLivre;
    }
    public void setCodeLivre(int codeLivre) {
        this.codeLivre = codeLivre;
    }

    public String getTitre() {
        return titre;
    }
    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getAuteur() {
        return auteur;
    }
    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public String getCategorie() {
        return categorie;
    }
    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public int getAnneePublication() {
        return anneePublication;
    }
    public void setAnneePublication(int anneePublication) {
        this.anneePublication = anneePublication;
    }

    public int getQuantiteDisponible() {
        return quantiteDisponible;
    }
    public void setQuantiteDisponible(int quantiteDisponible) {
        this.quantiteDisponible = quantiteDisponible;
    }
}
