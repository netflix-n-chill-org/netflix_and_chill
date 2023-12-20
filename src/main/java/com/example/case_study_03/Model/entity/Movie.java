package com.example.case_study_03.Model.entity;

public class Movie {
    private int id;
    private String title;
    private String englishTitle;
    private String genre;
    private int releaseYear;
    private float rating;
    private String img;
    public Movie() {

    }

    public Movie(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public Movie(String title, String genre, int releaseYear, float rating) {
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
    }


    public Movie(String title, String genre, int releaseYear, float rating, String englishTitle) {
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
        this.englishTitle = englishTitle;
    }

    public Movie(int id, String title, String genre,int releaseYear,  float rating,String englishTitle) {
        this.id = id;
        this.title = title;
        this.englishTitle = englishTitle;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
    }

    public Movie(String title, String englishTitle, String genre, int releaseYear, float rating, String img) {
        this.title = title;
        this.englishTitle = englishTitle;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
        this.img = img;

    }

    public Movie(int id, String title, String englishTitle, String genre, int releaseYear, float rating, String img) {
        this.id = id;
        this.title = title;
        this.englishTitle = englishTitle;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getEnglishTitle() {
        return englishTitle;
    }

    public void setEnglishTitle(String englishTitle) {
        englishTitle = englishTitle;
    }
}
