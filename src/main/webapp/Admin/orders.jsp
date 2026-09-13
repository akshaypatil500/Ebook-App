<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
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
    background: linear-gradient(90deg, #8e44ad, #3498db); /* Matching gradient background */
}

.table-hover tbody tr:hover {
    background: #f9f9f9; /* Light hover effect */
}

.table th, .table td {
    vertical-align: middle;
    font-size: 0.95rem;
    padding: 12px;
    text-align: center;
}

/* Button Styling */
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
    background: #00b09b; /* Greenish background for Edit button */
    color: white;
}

.btn-edit:hover {
    transform: scale(1.05);
    opacity: 0.95;
}

.btn-delete {
    background: #e53935; /* Red background for Delete button */
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
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<h3 class="text-center">Hello Admin</h3>

	<div class="container">
		<div class="glass-container">
			<table class="table table-hover">
				<thead class="table-dark text-white">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Ph No</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
					</tr>
				</thead>
				<tbody>
					<% 
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> blist = dao.getAllOrder();
					for (Book_Order b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId() %></th>
						<td><%=b.getUsername() %></td>
						<td><%=b.getEmail() %></td>
						<td><%=b.getFulladd() %></td>
						<td><%=b.getPhno() %></td>
						<td><%=b.getBookName() %></td>
						<td><%=b.getAuthor() %></td>
						<td><%=b.getPrice() %></td>
						<td><%=b.getPaymentType() %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>

	<div style="margin-top: 290px;">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>
