<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.crd-ho {
	transition: 0.3s ease;
	min-height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.crd-ho:hover {
	background-color: #fcf7f7;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.card-body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
}

.btn-style {
	padding: 6px 16px;
	font-size: 14px;
	border-radius: 50px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.08);
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 5px;
}

.btn-group-line {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.card-body p {
	margin-bottom: 1px; /* Reduced spacing between text elements */
}

.card-body .text-center {
	margin-bottom: 10px; /* Reduced space between text and buttons */
}

.card-body .btn-group-line {
	margin-top: 5px; /* Reduced space between the buttons */
}
</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid ">
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card crd-ho mt-5">
					<div class="card-body text-center">

						<div class="text-center">
							<img alt="" src="Book/<%=b.getPhotoName()%>"
								style="width: 130px; height: 180px"
								class="img-thumbnail mb-2 mx-auto d-block">
						</div>
						<p>
							<strong><%=b.getBookName()%></strong>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories: <%=b.getBookCategory()%>
						</p>

						<div class="mt-1">
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-style"> <i
								class="fas fa-info-circle me-2"></i> View Details
							</a> <a href="#" class="btn btn-outline-danger btn-style"> <i
								class="fas fa-rupee-sign me-2"></i> <%=b.getPrice()%>
							</a>
							<%
							} else {
							// First line: Add to Cart
							if (u == null) {
							%>
							<div class="text-center">
								<a href="login.jsp" class="btn btn-outline-success btn-style">
									<i class="fas fa-cart-plus me-2 "></i> Add Cart
								</a>
							</div>
							<%
							} else {
							%>
							<div class="text-center">
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-outline-success btn-style"> <i
									class="fas fa-cart-plus me-2"></i> Add to Cart
								</a>
							</div>
							<%
							}
							%>

							<!-- Second line: View Details + Price -->
							<div class="btn-group-line mt-1">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-outline-primary btn-style"> <i
									class="fas fa-info-circle me-2"></i> View Details
								</a> <a href="#" class="btn btn-outline-danger btn-style"> <i
									class="fas fa-rupee-sign me-2"></i> <%=b.getPrice()%>
								</a>
							</div>
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
	</div>
</body>
</html>
