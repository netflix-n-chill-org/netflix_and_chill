<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/13/2023
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Profile</title>
    <script src="https://kit.fontawesome.com/4e9e7bbd1b.js" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
        }

        body {
            color: black;
            height: 100vh;
            margin: 20px;
            background-color: #f6f9ff;
        }

        .header {
            position: relative;
        }

        .header::before {
            content: "";
            position: absolute;
            height: 100%;
            width: 100%;
            opacity: 0.6;
            z-index: -1;
        }

        .header .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 140px 15px 140px;
            border-bottom: 1px solid #e6e6e6;

        }

        .logo {
            width: 150px;
            cursor: pointer;
        }

        .header .navbar .right button {
            font-size: 18px;
            font-weight: 400;
            cursor: pointer;
            outline: none;
            border: none;
        }

        .header .navbar .right button a {
            text-decoration: none;
            color: #000;
            background-color: white;
        }

        .search-container {
            position: relative;
        }
        .right {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-container input[type=text] {
            padding: 8px;
            margin-top: 8px;
            width: 300px;
            font-size: 17px;
            border: 1px solid rgba(1, 41, 112, 0.2);
            transition: box-shadow 0.3s ease;
            outline: none;
        }

        .search-container input[type=text]:focus {
            box-shadow: 0 0 10px rgba(1, 41, 112, 0.2);
        }

        .search-container input[type=text]:hover {
            box-shadow: 0 0 10px rgba(1, 41, 112, 0.2);
        }

        .search-container .fa-search {
            position: absolute;
            right: 10px;
            top: 60%;
            transform: translateY(-50%);
        }

        .dropdown {
            position: relative;
            display: inline-block;
            margin-right: 10px;
        }

        .dropdown-content {
            right: 0;
            left: 50%;
            width: 300px;
            transform: translateX(-50%);
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 130px;
            box-shadow: 0 5px 30px 0 rgba(82, 63, 105, 0.2);
            z-index: 1;
            margin-top: 25px;
            transition: background-color 0.3s ease;
        }

        .dropdown-content::before {
            content: "";
            position: absolute;
            bottom: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: transparent transparent #000 transparent;
        }

        .dropdown-content a {
            color: #6C757D;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color:#eeee;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown.active .dropdown-content {
            display: block;
        }

        .notification-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        .notification-header h4 {
            font-size: 16px;
            margin: 0;
        }

        .notification-header button {

            border-radius: 10px;
        }

        .notification-box {
            width: 300px;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }


        .notification-text {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .notification-box h2, .notification-box p {
            margin: 0;
            padding: 0;
            font-size: 16px;
            text-align: left;
        }

        .notification-box p {
            font-size: 14px;
        }

        .notification-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .show-all-link {
            display: block;
            text-align: center;
            color: #0D6DFD;
            text-decoration: none;
            font-weight: bold;
        }

        .show-all-link:hover {
            text-decoration: underline;
        }

        .notification-box:hover,
        .notification-box:focus {
            background-color: #f6f9ff;
        }

        .dropdown-menu a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #000;
        }

        .dropdown-item i {
            margin-right: 0.5em;
        }

        .profile-dropdown{
            position: relative;
            width: fit-content;
        }

        .profile-dropdown-btn{
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-right: 1rem;
            font-weight: 500;
            font-size:0.9rem;
            border:1px solid #227C70;
            border-radius:50px;
            cursor: pointer;
            width: 150px;
            transition: box-shadow 0.2s, background-color 0.2s;
        }

        .profile-dropdown-btn:hover{
            background-color: rgb(127,183,126,0.1);
            box-shadow: 0 2px 8px 0 rgb(34,124,112,0.2);
        }
        .profile-img{
            position: relative;
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            background:url(../img/profile-img.jpg);
            background-size: cover;
        }
        .profile-img i {
            position: absolute;
            right: 0;
            bottom: 0.3rem;
            font-size:0.5rem;
            color:#82cd47;

        }

        /*.profile-dropdown-btn span{*/
        /*    margin: 0 0 0 0.5rem;*/
        /*}*/
        .profile-dropdown-list{
            display: none;
            position: absolute;
            top:68px;
            width: 220px;
            right: 0;
            background-color:#eeee;
            border-radius: 10px;
            box-shadow:  0 2px 8px 0 rgb(34,124,112,0.2);
        }
        .profile-dropdown:hover .profile-dropdown-list{
            display: block;
        }

        .profile-dropdown-list hr{
            border:1px solid #82cd47;
        }
        .profile-dropdown-list-item{
            padding:0.5rem 0  0.5rem 1rem;
            transition: background-color 0.2s,padding-left 0.2s;
        }
        .profile-dropdown-list-item:hover{
            padding-left: 1.5rem;
            background-color:rgb(34,124,112,0.2) ;
        }
        .profile-dropdown-list-item a{
            display: flex;
            align-items: center;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            color:#393e46;
        }
        .profile-dropdown-list-item a i {
            margin-right: 0.8rem;
            font-size: 1.1rem;
            width: 2.3rem;
            background-color: #227C70;
            color:#eeee;
            line-height: 2.3rem;
            text-align: center;
            border-radius: 50%;

        }
        .profile-dropdown-list-item{
            list-style-type: none;
        }
        .profile-dropdown-list::before {
            content: "";
            position: absolute;
            top: -10px;
            left: 85%;
            transform: translateX(-50%);
            border-width: 0 10px 10px 10px;
            border-style: solid;
            border-color: transparent transparent #eeee transparent;
        }
        .dropdown, .profile-dropdown {
            margin-right:40px;
        }
        body {
            margin: 0;
        }

        #content {
            width: 100%;
            padding: 40px;
            box-sizing: border-box;
            background-color: #f6f9ff;
            display: flex;
            justify-content: center;
        }

        .center-container {
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            background-color: #fff;
        }

        table {
            width: 100%;
            border: none;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            padding: 10px;
        }

        td {
            padding: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 20px;
        }

        input[type="submit"] {
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        img {
            display: block;
            margin: 0 auto;
            width: 10%;
        }

        .footer h2 {
            font-size: 18px;
            font-weight: 400;
            margin-bottom: 30px;
        }

        .footer .column {
            flex-basis: 25%;
            flex-grow: 1;
            margin-bottom: 20px;
        }

        .footer .column a {
            display: block;
            text-decoration: none;
            color: #737373;
            font-size: 15px;
            margin-bottom: 10px;
        }

        .footer .row {
            align-items: flex-start;
            padding: 10px 0;
            border-bottom: none;
        }

        .column select {
            padding: 10px;
            border: none;
        }

        .footer .language {
            color: #333;
            font-size: 16px;
            height: 48px;
            padding: 10px 30px 12px 10px;
            background: #fff;
            border: 1px solid #a6a6a6;
            margin-top: 10px;
        }

        .column p {
            margin-top: 10px;
            color: white;
        }

        .row {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            margin-bottom: 20px;

        }
    </style>
</head>
<body>
<div class="header">
    <nav class="navbar">
        <div class="left">
            <a href="../HomePage/homepage.jsp">
                <img src="../img/logo/netflix-logo.png" alt="" class="logo">
            </a>
        </div>
        <div class="search-container">
            <input type="text" placeholder="Search..">
            <a href="#contact"><i class="fa fa-search"></i></a>
        </div>
        <div class="right">
            <div class="dropdown" onclick="toggleDropdownF(this)">
                <i class="fa-regular fa-bell " style="font-size: 25px"></i>
                <div class="dropdown-content">
                    <div class="notification-header">
                        <h4>You have 4 new notifications</h4>
                        <button style="font-size: 14px;padding: 5px 5px;background-color: #0D6DFD;color: white">View
                            all
                        </button>
                    </div>

                    <div class="notification-box">

                        <div class="notification-text">
                            <h2>Lorem Ipsum</h2>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>30 min. ago</p>
                        </div>
                    </div>

                    <div class="notification-box">

                        <div class="notification-text">
                            <h2>Atque rerum nesciunt</h2>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>1 hr. ago</p>
                        </div>
                    </div>

                    <div class="notification-box">


                        <div class="notification-text">
                            <h2>Sit rerum fuga</h2>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>2 hrs. ago</p>
                        </div>
                    </div>

                    <div class="notification-box">


                        <div class="notification-text">
                            <h2>Dicta reprehenderit</h2>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>4 hrs. ago</p>
                        </div>
                    </div>

                    <a href="" class="show-all-link">Show all notifications</a>
                </div>

            </div>
            <div class="profile-dropdown">
                <div class="profile-dropdown-btn" onclick="toggleDropdown()">
                    <div class="profile-img">
                        <i class="fa-solid fa-circle"></i>
                    </div>
                    <span>
                    ${requestScope["user"].getName()}

                      <i class="fa-solid fa-angle-down"></i>
                    </span>
                </div>
                <ul class="profile-dropdown-list">
                    <li class="profile-dropdown-list-item">
                        <a href="#">
                            <i class="fa-regular fa-user"></i>
                            Edit Profile
                        </a>
                    </li>
                    <li class="profile-dropdown-list-item">
                        <a href="#">
                            <i class="fa-regular fa-envelope"></i>
                            Inbox
                        </a>
                    </li>
                    <li class="profile-dropdown-list-item">
                        <a href="#">
                            <i class="fa-solid fa-chart-line"></i>
                            Analytics
                        </a>
                    </li>
                    <li class="profile-dropdown-list-item">
                        <a href="#">
                            <i class="fa-solid fa-sliders"></i>
                            Settings
                        </a>
                    </li>
                    <li class="profile-dropdown-list-item">
                        <a href="#">
                            <i class="fa-regular fa-circle-question"></i>
                            Help & Support
                        </a>
                    </li>
                    <hr>
                    <li class="profile-dropdown-list-item">
                        <a href="#">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                            Log out
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </nav>
</div>
<div id="content">
    <div class="center-container">
        <img src="../img/logo/netflix-logo.png" alt="Logo" />
        <div class="form-container">
            <form method="post">
                <table border="1" cellpadding="5">
                    <caption>
                        <h1>Chỉnh sửa hồ sơ</h1>
                        <h2>
                            <a href="${pageContext.request.contextPath}/users">Back to Profile List</a>
                        </h2>
                    </caption>
                    <tr>
                        <th>
                            Profile Name:
                        </th>
                        <td>
                            <label>
                                <input type="text" name="name" id="name" size="45" value="${user.name}"/>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            Profile phone:
                        </th>
                        <td>
                            <label>
                                <input type="text" name="phone" id="phone" size="45" value="${user.phone}" }/>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th>
                            Profile email:
                        </th>
                        <td>
                            <label>
                                <input type="text" name="email" id="email" size="45" value="${user.email}"/>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <label>
                                <input type="submit" value="Save"/>
                            </label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div class="footer">
    <h2>Bạn có câu hỏi? Liên hệ với chúng tôi.</h2>
    <div class="row">
        <div class="column">
            <a href="#">Câu hỏi thường gặp</a>
            <a href="#">Quyền riêng tư</a>
            <select name="language" class="language">
                <option value="Vietnamese">🌐 Tiếng việt</option>
                <option value="English">🌐 English</option>
            </select>
        </div>
        <div class="column">
            <a href="#">Trung tâm trợ giúp</a>
            <a href="#">Tùy chọn cookie</a>
        </div>
        <div class="column">
            <a href="#">Cửa hàng Netflix</a>
            <a href="#">Thông tin doanh nghiệp</a>
        </div>
        <div class="column">
            <a href="#">Điều khoản sử dung</a>
        </div>
    </div>
</div>

<script>
    let isDropdownOpen = false;

    function toggleDropdownF(dropdown) {
        isDropdownOpen = !isDropdownOpen;

        if (isDropdownOpen) {
            dropdown.classList.add('active');
        } else {
            dropdown.classList.remove('active');
        }
    }

    function toggleDropdown() {
        var dropdownList = document.querySelector('.profile-dropdown-list');
        dropdownList.style.display = dropdownList.style.display === 'none' ? 'block' : 'none';
    }
    document.getElementById("profileForm").addEventListener("submit", function(event) {
        event.preventDefault();
        window.location.href = "${pageContext.request.contextPath}/users";
    });
</script>

</body>
</html>