<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>

<style>
/* Global Styles */
html, body {
	height: 100%;
	margin: 0;
	background: #f9f9f9;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #333;
}

/* Header Styles */
.page-header {
	text-align: center;
	padding: 20px 0;
	font-size: 2rem;
	font-weight: 500;
	background: #fff;
	box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	background-image: linear-gradient(45deg, #8e44ad, #3498db, #e74c3c);
	-webkit-background-clip: text;
	color: transparent;
	animation: textAnimation 3s ease-in-out infinite;
	transition: background-image 0.3s ease-in-out;
}

/* Keyframes for Animation */
@keyframes textAnimation {
	0% {
		background-position: 0%;
	}
	50% {
		background-position: 100%;
	}
	100% {
		background-position: 0%;
	}
}

/* Hover Effect on Text */
.page-header:hover {
	background-image: linear-gradient(45deg, #f39c12, #e74c3c, #8e44ad); /* Change gradient on hover */
	-webkit-background-clip: text;
	color: transparent;
}

/* Table Styling */
.glass-container {
	margin: 20px auto;
	max-width: 95%;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
	background: #fff;
	border: 1px solid #e0e0e0;
}

.table thead {
            background: linear-gradient(90deg, #8e44ad, #3498db);
}

.table-hover tbody tr:hover {
	background: #f9f9f9;
}

.table th, .table td {
	vertical-align: middle;
	font-size: 0.95rem;
	padding: 12px;
	text-align: center;
}

.book-img {
	width: 50px;
	height: 50px;
	border-radius: 8px;
	object-fit: cover;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.btn-custom {
	border: none;
	border-radius: 20px;
	padding: 6px 18px;
	font-size: 0.8rem;
	transition: all 0.3s ease;
	font-weight: 600;
	text-transform: uppercase;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.btn-edit {
	background: #00b09b;
	color: white;
}

.btn-edit:hover {
	transform: scale(1.05);
	opacity: 0.95;
}

.btn-delete {
	background: #e53935;
	color: white;
}

.btn-delete:hover {
	transform: scale(1.05);
	opacity: 0.95;
}

/* Footer Styling */
footer {
	background: #34495e;
	color: #fff;
	padding: 30px 0;
	text-align: center;
	margin-top: auto;
	border-top: 1px solid #fff;
}

footer .footer-links {
	margin-bottom: 20px;
}

footer .footer-links a {
	color: #fff;
	text-decoration: none;
	margin: 0 15px;
	font-size: 0.9rem;
}

footer .footer-links a:hover {
	color: #3498db;
}

footer p {
	font-size: 1rem;
	color: #ecf0f1;
}

@media (max-width: 768px) {
	.page-header {
		font-size: 1.5rem;
		padding: 30px 0;
	}
	.book-img {
		width: 40px;
		height: 40px;
	}
	.btn-custom {
		padding: 5px 14px;
		font-size: 0.75rem;
	}
	footer .footer-links a {
		font-size: 0.8rem;
	}
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>
	
	<c:if test="${ empty userobj}">
	
	<c:redirect url="../login.jsp"/>
	</c:if>
	

	<div class="page-header">Admin Panel  All Books</div>
	
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

	<div class="glass-container">
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>ID</th>
					<th>Image</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Category</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getAllBook();
				for (BookDtls b : list) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>
					<td><img src="../Book/<%=b.getPhotoName()%>" alt="book"
						class="book-img"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td>
    <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-custom btn-edit">
        <i class="fas fa-edit"></i> Edit
    </a>
    <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-custom btn-delete">
        <i class="fas fa-trash-alt"></i> Delete
    </a>
</td>
</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<div style="margin-top: 100px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>
