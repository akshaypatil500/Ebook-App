
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Ebook website to explore and read various ebooks.">
<meta name="author" content="Your Name">
<title>Ebooks - Website</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Custom Navbar Gradient */
.bg-custome {
	background: linear-gradient(90deg, #8e44ad, #3498db);
	/* Purple to blue gradient */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

.bg-custome .navbar-brand, .bg-custome .navbar-nav .nav-link {
	color: #fff; /* Ensure the text is visible on the gradient */
}

.bg-custome .navbar-toggler-icon {
	background-color: #fff; /* Make the toggler icon white */
}

.bg-custome .navbar-nav .nav-link:hover {
	color: #f1c40f; /* Yellow color on hover */
}

.bg-custome .navbar-toggler {
	border-color: #fff;
	/* Optional: Change the border of the toggler button */
}

/* Ebook Logo and Name Styling */
.ebook-logo {
	font-size: 2.5rem;
	font-weight: 800;
	color: #fff;
	background: linear-gradient(90deg, #ff7e5f, #feb47b);
	/* Gradient effect for the text */
	display: inline-block;
	padding: 10px 20px;
	border-radius: 8px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
	/* Slight shadow for a modern look */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease;
}

.ebook-logo:hover {
	transform: scale(1.1); /* Slight zoom effect when hovered */
}

.ebook-logo i {
	font-size: 2.5rem; /* Icon size */
	margin-right: 10px;
}

/* Custom Heading */
.heading-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	animation: fadeInDown 1s ease;
}

.heading-custom {
	font-size: 2.5rem;
	font-weight: 700;
	color: #fff;
	background: linear-gradient(90deg, #4e54c8, #8f94fb);
	padding: 15px 30px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	display: inline-block;
	text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);
}

@
keyframes fadeInDown {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Styling for Active/Non-Active Links in Navbar */
.navbar-nav .nav-link {
	color: #fff; /* Ensure all links are white */
}

.navbar-nav .nav-link.active {
	color: #ff7e5f; /* Active link color (matching ebook gradient) */
}

.navbar-nav .nav-link.disabled {
	color: #ccc; /* Disabled link color */
}

.navbar-nav .nav-link:hover {
	color: #f1c40f; /* Yellow color for hover effect */
}

/* Ensuring Old Book Link is visible */
.nav-item.old-book {
	color: #ccc;
	/* Light color to make it look different from active links */
}

.nav-item.old-book:hover {
	color: #f1c40f; /* Highlight the old book link on hover */
}

/* New Styles for Setting and Contact Us Buttons */
.btn-custom {
	background: linear-gradient(90deg, #ff7e5f, #feb47b);
	/* Gradient background */
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 50px; /* Rounded edges */
	font-weight: 600;
	text-transform: uppercase;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease, background 0.3s ease;
}

.btn-custom i {
	font-size: 1.3rem; /* Icon size */
	margin-right: 8px;
}
/* Disable Hover Effect for the Setting Button */
.setting-btn:hover {
    background: linear-gradient(90deg, #ff7e5f, #feb47b); /* Keep the same background as the default */
    transform: none; /* No zoom effect on hover */
    color: #fff; /* Ensure the text color stays white */
}

/* Disable Hover Effect for the Setting Button */
.btn-custom:hover {
    background: linear-gradient(90deg, #ff7e5f, #feb47b); /* Keep the same background */
    transform: scale(1.05); /* Zoom effect on hover */
}

.btn-custom:focus {
	outline: none; /* Remove outline on focus */
	box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5); /* Focus ring effect */
}

.btn-custom:active {
	transform: scale(0.98); /* Slight shrink when clicked */
}
</style>
</head>
<body>

	<!-- Top Gradient Bar -->
	<div class="container-fluid"
		style="height: 10px; background: linear-gradient(90deg, #8e44ad, #3498db);"></div>

	<!-- Search and Login Section -->
	<div class="container-fluid py-3 bg-light">
		<div class="row align-items-center">
			<!-- Logo or Title -->
			<div class="col-md-3 text-success">
				<!-- Updated Ebook Logo with Gradient and Animation -->
				<h1 class="h4 mb-0 ebook-logo">
					<i class="fas fa-book"></i> Ebooks
				</h1>
			</div>

			<!-- Search Bar -->
			<div class="col-md-6">
				<form class="form-inline justify-content-center" action="search.jsp" method="post">
					<input class="form-control mr-2 w-75" type="search" name="ch"
						placeholder="Search ..." aria-label="Search">
					<button class="btn text-white" type="submit"
						style="background: linear-gradient(90deg, #8e44ad, #3498db); border: none;">
						Search</button>
				</form>
			</div>

			<c:if test="${not empty userobj }">
				<!-- Auth Buttons -->


				<div class="col-md-3 text-md-right mt-1 mt-md-0">

					<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x mt-1"></i>
        </a>
        
            <a href="login.jsp" 
               class="btn text-white mr-2" 
               style="background: linear-gradient(90deg, #43cea2, #185a9d); border: none;">
                <i class="fas fa-user-plus"></i>  ${userobj.name }
            </a>

            <a href="logout" 
               class="btn text-white" 
               style="background: linear-gradient(90deg, #8e44ad, #3498db); border: none;">
                <i class="fas fa-sign-in-alt"></i> </i> Logout
            </a>
        </div>

			</c:if>

			<c:if test="${  empty userobj }">


				<div class="col-md-3 text-md-right mt-3 mt-md-0">
					<a href="login.jsp" class="btn text-white mr-2"
						style="background: linear-gradient(90deg, #43cea2, #185a9d); border: none;">
						<i class="fas fa-sign-in-alt"></i> Login
					</a> <a href="register.jsp" class="btn text-white"
						style="background: linear-gradient(90deg, #8e44ad, #3498db); border: none;">
						<i class="fas fa-user-plus"></i> Register
					</a>
				</div>


			</c:if>



		</div>
	</div>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-custome">
		<a class="navbar-brand" href="#"><i class="fas fa-home"></i> </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_recent_books.jsp"><i class="fas fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_new_book.jsp"><i class="fas fa-book-open"></i> New
						Book</a></li>

				<!-- Updated styling for Old Book -->
				<li class="nav-item old-book"><a class="nav-link"
					href="all_old_book.jsp"><i class="fas fa-book-open"></i> Old
						Book</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="setting.jsp" class="btn-custom setting-btn my-2 my-sm-0" type="submit">
    <i class="fas fa-cog"></i> Setting
</a>

				<button class="btn-custom my-2 my-sm-0 ps-2 ml-1" type="submit">
					<i class="fas fa-phone-square-alt"></i> Contact Us
				</button>
			</form>
		</div>
	</nav>

	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
