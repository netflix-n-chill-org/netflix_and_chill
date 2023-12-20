<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/20/2023
  Time: 4:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <script>
        // Lấy phần tử thông báo
        var successAlert = document.getElementById('successAlert');
        // var errorAlert = docu    ment.getElementById('errorAlert');

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
            window.location.href = "../movie/action=deleteMovie&id=" + movieId;
        }


    </script>

</body>
</html>
