<%@ page import="com.example.case_study_03.Model.entity.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.case_study_03.repository.MovieRepository" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/20/2023
  Time: 4:08 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <a href="../movie/updateMovie.jsp"> update movie</a>
</head>
<body>


<%--<% Movie movie = (Movie) request.getAttribute("movie");%>--%>

<%
    String movieIdParam = request.getParameter("id");
    if (movieIdParam != null && !movieIdParam.isEmpty()) {
        int movieId = Integer.parseInt(movieIdParam);

        MovieRepository movieRepository = new MovieRepository();
        Movie movie = movieRepository.selectMovie(movieId);

        if (movie != null) {
%>

<h5 class="modal-title" id="ModalLabel"> cập nhật thông tin </h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
</button>

<form method="post" action="/movie?action=update">

        <input type="hidden" class="form-control" id="id" name="id"
               value="<%= movie.getId()%>" required>



    <div class="form-group">
        <label for="title">Tiêu đề</label>
        <input type="text" class="form-control" id="title" name="title"
               value="<%= movie.getTitle()%>" placeholder="nhập tiêu đề" required>
    </div>

    <div class="form-group">
        <label for="english_title">Tiêu đề tiếng anh</label>
        <input type="text" class="form-control" id="english_title"
               name="english_title" value="<% movie.getEnglishTitle();%>" placeholder="Hello ghost" required>
    </div>

    <div class="form-group">
        <label for="genre">Thể loại</label>
        <input type="text" class="form-control" id="genre" name="genre"
               value="<%= movie.getGenre()%>" placeholder="nhập thể loại" required>
    </div>

    <div class="form-group">
        <label for="releaseYear">Năm</label>
        <input type="number" class="form-control" id="releaseYear"
               value="<%= movie.getReleaseYear()%>" name="releaseYear" placeholder="Năm" required>
    </div>

    <div class="form-group">
        <label for="rating">Xếp hạng</label>
        <input type="number" class="form-control" id="rating"
               name="rating" value="<%= movie.getRating()%>" placeholder="8.5" step="0.1" min="1" max="10" required>
    </div>

    <div class="form-group">
        <label for="img">Ảnh phim</label>
        <input type="text" class="form-control" id="img" name="img"
               value="<%= movie.getImg()%>"  placeholder="URL" required>
    </div>

    <button type=" button" class="btn btn-secondary" data-dismiss="modal">trở về</button>

    <button type="submit" class="btn btn-primary">cập nhật</button>
</form>

<%
    }
%>
<%
    }
%>
<script>
    // Lấy phần tử thông báo
    var successAlert = document.getElementById('successAlert');
    // var errorAlert = document.getElementById('errorAlert');

    // Ẩn phần tử thông báo sau 5 giây
    setTimeout(function () {
        if (successAlert) {
            successAlert.style.display = 'none';
        }
        // if (errorAlert) {
        //     errorAlert.style.display = 'none';
        // }
    }, 5000);

    function redirectToUpdateMovie(movieId) {
        console.log(movieId);
        window.location.href = "../movie/action=updateMovie&id=" + movieId;
    }


</script>

</body>
</html>
