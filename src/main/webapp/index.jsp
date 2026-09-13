<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook Management System</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("Images/book3.avif");
	height: 80vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

a:hover {
  text-decoration: none !important;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

.card.crd-ho {
	height: 100%;
	min-height: 420px;
	min-width: 270px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
}

.card-body {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	height: 100%;
	padding: 15px;
}

.card-body img {
	width: 150px;
	height: 200px;
	object-fit: cover;
	margin-bottom: 10px;
}

.card-body p {
	margin: 4px 0;
	text-align: center;
}

.card-body .d-flex {
	margin-top: auto;
}

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
	background-color: #1E3A8A;
	padding: 15px 30px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	display: inline-block;
	text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);
}

@keyframes fadeInDown {
	from {
		opacity: 0;
		transform: translateY(-30px);
	}

	to {
		opacity: 1;
		transform: translateY(0);
	}
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluid back-img">
		<div class="heading-wrapper text-center my-4">
			<h2 class="heading-custom">
				<i class="fas fa-book-reader"></i> Ebook Management System
			</h2>
		</div>
	</div>

	<!-- Recent Book Section -->
	<div class="container">
		<h3 class="text-center section-heading">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 mb-4 d-flex align-items-stretch">
				<div class="card crd-ho">
					<div class="card-body">
						<img src="Book/<%=b.getPhotoName()%>" alt="Book Image" class="img-thumbnail">
						<p>
							<strong><%=b.getBookName()%></strong>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory()%></p>

						<div class="d-flex justify-content-center flex-wrap">
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-info-circle me-2"></i> View Details
							</a> <a href="#"
								class="btn btn-outline-danger btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-rupee-sign me-2"></i><%=b.getPrice()%>
							</a>
							<%
							} else {
							%>

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-outline-success btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-cart-plus me-2"></i> Add to Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-outline-success btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-cart-plus me-2"></i> Add to Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-info-circle me-2"></i> View Details
							</a> 
							<a href="#" class="btn btn-outline-danger btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-rupee-sign me-2"></i><%=b.getPrice()%>
							</a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<hr>

	<!-- New Book Section -->
	<div class="container">
		<h3 class="text-center section-heading">New Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 mb-4 d-flex align-items-stretch">
				<div class="card crd-ho">
					<div class="card-body">
						<img src="Book/<%=b.getPhotoName()%>" alt="Book Image" class="img-thumbnail">
						<p>
							<strong><%=b.getBookName()%></strong>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory()%></p>

						<div class="d-flex justify-content-center flex-wrap">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-outline-success btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-cart-plus me-2"></i> Add to Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-outline-success btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-cart-plus me-2"></i> Add to Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-info-circle me-2"></i> View Details
							</a> 
							<a href="#" class="btn btn-outline-danger btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-rupee-sign me-2"></i><%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<hr>

	<!-- Old Book Section -->
	<div class="container">
		<h3 class="text-center section-heading">Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3 mb-4 d-flex align-items-stretch">
				<div class="card crd-ho">
					<div class="card-body">
						<img src="Book/<%=b.getPhotoName()%>" alt="Book Image" class="img-thumbnail">
						<p>
							<strong><%=b.getBookName()%></strong>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory()%></p>

						<div class="d-flex justify-content-center flex-wrap">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-info-circle me-2"></i> View Details
							</a> 
							<a href="#" class="btn btn-outline-danger btn-sm px-3 py-1 shadow-sm m-1">
								<i class="fas fa-rupee-sign me-2"></i><%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
