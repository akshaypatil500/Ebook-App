<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Ebook website to explore and read various ebooks.">
    <meta name="author" content="Your Name">
    <title>Ebooks - Website</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom Navbar Gradient */
        .bg-custome {
            background: linear-gradient(90deg, #8e44ad, #3498db);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .bg-custome .navbar-brand,
        .bg-custome .navbar-nav .nav-link {
            color: #fff;
        }

        .bg-custome .navbar-toggler-icon {
            background-color: #fff;
        }

        .bg-custome .navbar-nav .nav-link:hover {
            color: #f1c40f;
        }

        .ebook-logo {
            font-size: 2.5rem;
            font-weight: 800;
            color: #fff;
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            display: inline-block;
            padding: 10px 20px;
            border-radius: 8px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }

        .ebook-logo:hover {
            transform: scale(1.1);
        }

        .ebook-logo i {
            font-size: 2.5rem;
            margin-right: 10px;
        }

        /* Navbar and Button Styles */
        .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-nav .nav-link.active {
            color: #ff7e5f;
        }

        .btn-custom {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .btn-custom:hover {
            transform: scale(1.05);
            background: linear-gradient(90deg, #feb47b, #ff7e5f);
        }

        .btn-custom:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body>

<!-- Top Gradient Bar -->
<div class="container-fluid" style="height:10px; background: linear-gradient(90deg, #8e44ad, #3498db);"></div>

<!-- Search and Login Section -->
<div class="container-fluid py-3 bg-light">
    <div class="row align-items-center">
        <!-- Logo -->
        <div class="col-md-3">
            <h1 class="h4 mb-0 ebook-logo">
                <i class="fas fa-book"></i> Ebooks
            </h1>
        </div>

        <!-- Auth Buttons (Right Aligned) -->
        <div class="col-md-3 ml-auto text-md-right mt-3 mt-md-0">
            <c:if test="${not empty userobj}">
                <a class="btn text-white mr-2" style="background: linear-gradient(90deg, #43cea2, #185a9d); border: none;">
                    <i class="fas fa-user"></i> ${userobj.name}</a>
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn text-white" style="background: linear-gradient(90deg, #8e44ad, #3498db); border: none;">
                    <i class="fas fa-sign-in-alt"></i> Logout
                </a>
            </c:if>

            <c:if test="${empty userobj}">
                <a href="../register.jsp" class="btn text-white" style="background: linear-gradient(90deg, #8e44ad, #3498db); border: none;">
                    <i class="fas fa-user-plus"></i> Register
                </a>
            </c:if>
        </div>
    </div>
</div>

<!-- Logout Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4>Do you want to Logout?</h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custome">
    <a class="navbar-brand" href="#"><i class="fas fa-home"></i> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
