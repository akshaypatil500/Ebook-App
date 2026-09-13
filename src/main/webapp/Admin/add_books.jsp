<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>

<style>
/* Global Styles */
html, body {
    height: 100%;
    margin: 0;
    background-color: #f0f2f2;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #333;
}

/* Card Styling */
.card {
    border-radius: 10px;
    box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
    background: #fff;
    border: 1px solid #e0e0e0;
    padding: 20px;
}

.card-body {
    padding: 30px;
}

/* Heading */
h4.text-center {
    font-size: 1.5rem;
    font-weight: 600;
    color: #34495e;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 20px;
}

/* Form Styling */
.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    font-size: 1rem;
    color: #333;
}

input[type="text"], input[type="number"], select, input[type="file"] {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 1rem;
}

input[type="file"] {
    padding: 5px;
}

button[type="submit"] {
    background-color: #3498db;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 1rem;
    transition: all 0.3s ease;
    width: 100%;
}

button[type="submit"]:hover {
    background-color: #2980b9;
    cursor: pointer;
}

/* Success and Error Messages */
.swal2-popup {
    font-size: 1.2rem;
}

footer {
    background: #34495e;
    color: #fff;
    padding: 30px 0;
    text-align: center;
    margin-top: 100px;
    border-top: 1px solid #fff;
}

footer .footer-links a {
    color: #fff;
    text-decoration: none;
    margin: 0 15px;
}

footer .footer-links a:hover {
    color: #3498db;
}

@media (max-width: 768px) {
    .col-md-4 {
        width: 100%;
    }

    .card-body {
        padding: 20px;
    }

    button[type="submit"] {
        width: 100%;
    }
}
</style>

</head>
<body style="background-color: #f0f2f2;">
    <%@include file="navbar.jsp"%>
    
    <c:if test="${ empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>

    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card mt-3">
                    <div class="card-body">

                        <h4 class="text-center text-primary">Add Books</h4>

                        <!-- Success Message -->
                        <c:if test="${not empty sessionScope.succMsg}">
                            <script>
                                Swal.fire({
                                    icon : 'success',
                                    title : 'Success!',
                                    text : '${sessionScope.succMsg}',
                                    confirmButtonColor : '#28a745',
                                    timer : 3500,
                                    showConfirmButton : false
                                });
                            </script>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <!-- Error Message -->
                        <c:if test="${not empty sessionScope.failedMsg}">
                            <script>
                                Swal.fire({
                                    icon : 'error',
                                    title : 'Oops!',
                                    text : '${sessionScope.failedMsg}',
                                    confirmButtonColor : '#dc3545',
                                    timer : 3500,
                                    showConfirmButton : false
                                });
                            </script>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>

                        <!-- Add Book Form -->
                        <form action="../add_books" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label for="bname">Book Name</label>
                                <input type="text" class="form-control" id="bname" required="required" name="bname">
                            </div>

                            <div class="form-group">
                                <label for="author">Author Name</label>
                                <input type="text" class="form-control" id="author" required="required" name="author">
                            </div>

                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" id="price" required="required" name="price">
                            </div>

                            <div class="form-group">
                                <label for="categories">Book Categories</label>
                                <select id="categories" name="categories" class="form-control">
                                    <option selected>--select</option>
                                    <option value="New">New Book</option>
                                    
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="status">Book Status</label>
                                <select id="status" name="status" class="form-control">
                                    <option selected>--select</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="bimg">Upload Photo</label>
                                <input name="bimg" type="file" class="form-control-file" id="bimg">
                            </div>

                            <button type="submit" class="btn btn-primary">Add Book</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 200px;">
        <%@include file="footer.jsp"%>
    </div>

</body>
</html>
