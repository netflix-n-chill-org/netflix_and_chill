<%@ page import="com.example.case_study_03.Model.entity.Movie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/16/2023
  Time: 3:36 PM
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
    <title>movie</title>
    <h2>
        <a href="movie/movie.jsp"></a>
    </h2>


</head>
<body>
<div class="app">
    <header class="header">
        <div class="grid"></div>
    </header>

    <!-- Header with search -->
    <div class="header-with-search">
        <div class="header__logo">
            <svg viewBox="0 0 111 30" version="1.1" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" class="header__logo-img">
                <g>
                    <path fill="rgb(229 9 20)"
                          d="M105.06233,14.2806261 L110.999156,30 C109.249227,29.7497422 107.500234,
                              29.4366857 105.718437,29.1554972 L102.374168,20.4686475 L98.9371075,
                              28.4375293 C97.2499766,28.1563408 95.5928391,28.061674 93.9057081,
                              27.8432843 L99.9372012,14.0931671 L94.4680851,-5.68434189e-14 L99.5313525,
                              -5.68434189e-14 L102.593495,7.87421502 L105.874965,-5.68434189e-14 L110.999156,
                              -5.68434189e-14 L105.06233,14.2806261 Z M90.4686475,-5.68434189e-14 L85.8749649,
                              -5.68434189e-14 L85.8749649,27.2499766 C87.3746368,27.3437061 88.9371075,
                              27.4055675 90.4686475,27.5930265 L90.4686475,-5.68434189e-14 Z M81.9055207,
                              26.93692 C77.7186241,26.6557316 73.5307901,26.4064111 69.250164,26.3117443 L69.250164,
                              -5.68434189e-14 L73.9366389,-5.68434189e-14 L73.9366389,21.8745899 C76.6248008,
                              21.9373887 79.3120255,22.1557784 81.9055207,22.2804387 L81.9055207,26.93692 Z M64.2496954,
                              10.6561065 L64.2496954,15.3435186 L57.8442216,15.3435186 L57.8442216,
                              25.9996251 L53.2186709,25.9996251 L53.2186709,-5.68434189e-14 L66.3436123,
                              -5.68434189e-14 L66.3436123,4.68741213 L57.8442216,4.68741213 L57.8442216,
                              10.6561065 L64.2496954,10.6561065 Z M45.3435186,4.68741213 L45.3435186,
                              26.2498828 C43.7810479,26.2498828 42.1876465,26.2498828 40.6561065,
                              26.3117443 L40.6561065,4.68741213 L35.8121661,4.68741213 L35.8121661,
                              -5.68434189e-14 L50.2183897,-5.68434189e-14 L50.2183897,4.68741213 L45.3435186,
                              4.68741213 Z M30.749836,15.5928391 C28.687787,15.5928391 26.2498828,
                              15.5928391 24.4999531,15.6875059 L24.4999531,22.6562939 C27.2499766,
                              22.4678976 30,22.2495079 32.7809542,22.1557784 L32.7809542,26.6557316 L19.812541,
                              27.6876933 L19.812541,-5.68434189e-14 L32.7809542,-5.68434189e-14 L32.7809542,
                              4.68741213 L24.4999531,4.68741213 L24.4999531,10.9991564 C26.3126816,
                              10.9991564 29.0936358,10.9054269 30.749836,10.9054269 L30.749836,
                              5.5928391 Z M4.78114163,12.9684132 L4.78114163,29.3429562 C3.09401069,
                              9.5313525 1.59340144,29.7497422 0,30 L0,-5.68434189e-14 L4.4690224,
                              -5.68434189e-14 L10.562377,17.0315868 L10.562377,-5.68434189e-14 L15.2497891,
                              -5.68434189e-14 L15.2497891,28.061674 C13.5935889,28.3437998 11.906458,
                              28.4375293 10.1246602,28.6868498 L4.78114163,12.9684132 Z"
                    ></path>
                </g>
            </svg>
        </div>

        <div class="header__search">
            <div class="header__search-input-wrap">
                <input type="text" class="header__search-input" placeholder="nhập để tìm kiếm phim"/>
            </div>

            <button id="modalSearch" class="header__search-btn" onclick="openModalSearch()">
                <i class=" header__search-btn-icon fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </div>

    <div class="category_total">
        <div class="girl__column-10">
            <div class="home-filter">
                <%-- Kiểm tra và hiển thị thông báo thành công --%>
                <% String successMessage = (String) request.getAttribute("successMessage");
                    if (successMessage != null && !successMessage.isEmpty()) { %>
                <div class="alert alert-success" role="alert" id="successAlert">
                    <%= successMessage %>
                </div>
                <% } %>
                <div id="add_Movie" class="select-input-text">
                    <button type="button" class="btn" data-toggle="modal" data-target="#addMovie">
                        <span class="select-input__sub">Thêm phim</span>
                        <i class="fa-solid fa-right-to-bracket"></i>
                    </button>

                    <div class="modal fade" id="addMovie" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel1">Thêm phim</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="/movie?action=create">
                                        <div class="form-group">
                                            <label for="titleMovie">Tiêu đề</label>
                                            <input type="text" class="form-control" id="titleMovie" name="titleMovie"
                                                   placeholder="Ma ơi chào mi" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="titleEnglishMovie">Tiêu đề tiếng anh</label>
                                            <input type="text" class="form-control" id="titleEnglishMovie"
                                                   name="titleEnglishMovie" placeholder="Hello ghost" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="genreMovie">Thể loại</label>
                                            <input type="text" class="form-control" id="genreMovie" name="genreMovie"
                                                   placeholder="Hài kịch" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="releaseYear">Năm</label>
                                            <input type="number" class="form-control" id="releaseYear"
                                                   name="releaseYear" placeholder="Năm" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="ratingMovie">Xếp hạng</label>
                                            <input type="number" class="form-control" id="ratingMovie"
                                                   name="ratingMovie" placeholder="8.5" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="imgMovie">Ảnh phim</label>
                                            <input type="text" class="form-control" id="imgMovie" name="imgMovie"
                                                   placeholder="URL" required>
                                        </div>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Add Movie</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Loại Phim</span>
                    <i class="fa-solid fa-chevron-down"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Thể Loại</span>
                    <i class="fa-solid fa-chevron-down"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Năm Phát Hành</span>
                    <i class="fa-solid fa-chevron-down"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Quốc Gia</span>
                    <i class="fa-solid fa-chevron-down"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Thời Lượng</span>
                    <i class="fa-solid fa-chevron-down"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Sắp Xếp</span>
                    <i class="fa-solid fa-chevron-down"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Trang Trước</span>
                    <i class="fa-solid fa-chevron-left"></i>
                </div>

                <div class="select-input-sub">
                    <i class="fa-solid fa-chevron-left"></i>
                    <span class="select-input__label">1/2</span>
                    <i class="fa-solid fa-chevron-right"></i>
                </div>

                <div class="select-input">
                    <span class="select-input__label">Trang Sau</span>
                    <i class="fa-solid fa-chevron-right"></i>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="body__container">
    <% int count = 0; %>
    <% List<Movie> movielist = (List<Movie>) request.getAttribute("movieList");
        if (movielist != null && !movielist.isEmpty()) {
            for (Movie movie : movielist) { %>
    <div class="body__container-total row">
        <div class="total__card col-sm-3">
            <div class="card">
                <img src="<%= movie.getImg()%>" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text"><%= movie.getTitle()%>
                    </p>
                    <p class="card-text_sub"><%= movie.getEnglishTitle()%>
                    </p>

                    <div class="card-body-total">
                        <div class="card-body_select">



                            <div class="modal fade" id="detailMovie<%= count %>"
                                 aria-labelledby="exampleModalLabel<%= count %>" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="ModalLabel<%= count %>">Modal title</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <%= count %>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <% int idMovie = movie.getId();%>
                        <button type="button" class="btn" data-toggle="modal" data-target="#showAllMovies" onclick="redirectToShowMovie(<%=idMovie%>)">
                            <span class="select-input__sub">hiển thị chi tiết</span>
                            <i class="fa-solid fa-right-to-bracket"></i>
                        </button>

                        <div class="card-body_select">
                            <button type="button" class="btn" data-toggle="modal" data-target="#deleteMovie"  onclick="redirectToDelete(<%=idMovie%>)">
                                <span class="select-input__label">xóa phim</span >
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <% count++; %>
    <% }
    } else {
        System.out.println("Không có danh sách phim");
    }%>
</div>




<script src="../assets/style.js"></script>
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

    function redirectToShowMovie(id) {
        console.log(id);
        window.location.href = "../movie?action=show-movie&id="+id;
    }

    function redirectToDelete(id) {
        console.log(id);
        window.location.href = "../movie?action=delete&id="+id;
    }


</script>

</body>
</html>
