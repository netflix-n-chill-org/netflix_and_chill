<%@ page import="com.example.case_study_03.Model.entity.Movie" %>
<%@page import="com.example.case_study_03.Model.dao.impl.MovieDAO" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/19/2023
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.case_study_03.Model.entity.Movie" %>
<%@ page import="com.example.case_study_03.Model.dao.impl.MovieDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="../assets/main.css">
    <link rel="stylesheet" href="../assets/base.css">
    <link rel="stylesheet" href="../assets/fount/fontawesome-free-6.5.1-web/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <a href="../movie/showMovie.jsp"> show movie</a>
</head>
<body>

<%  Movie movie = (Movie) request.getAttribute("movie");%>
<div class="showCard">
    <%--    <img src="<%= (movie != null) ? movie.getImg() : "" %>" alt="Movie Image">--%>


    <div class="card-body">
        <h3>Title: <%= movie.getTitle() %>
        </h3>
        <p>English Title: <%= movie.getEnglishTitle() %>
        </p>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">
            <p>Genre: <%= movie.getGenre() %>
            </p>
        </li>

        <li class="list-group-item">
            <p>Release Year: <%= movie.getReleaseYear() %>
            </p>
        </li>

        <li class="list-group-item">
            <p>Rating: <%= movie.getRating() %>
            </p>
        </li>

    </ul>
    <div class="card-body">
        <button id="goBackButton" onclick="closeUpdateMovie()">trở về</button>

        <% int idMovie = movie.getId();%>
        <button type="button" class="btn" data-toggle="modal" data-target="#showAllMovies" onclick="redirectToUpdateMovie(<%=idMovie%>)">
            <span class="select-input__sub">cập nhật sản phẩm</span>
            <i class="fa-solid fa-right-to-bracket"></i>
        </button>
    </div>
</div>
<script>
    document.getElementById("goBackButton").addEventListener("click", function () {
        window.history.back();
    });

    document.getElementById("updateProductButton").addEventListener("click", function () {
    });

    function redirectToUpdateMovie(movieId) {
        window.location.href = "../movie/updateMovie.jsp?id=" + movieId;
    }

    document.getElementById("goBackButton").addEventListener("click", function () {
        window.history.back();
    });

    document.getElementById("updateProductButton").addEventListener("click", function () {
    });
</script>
</body>
</html>
