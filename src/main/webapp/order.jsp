<%@page import="com.entity.Book_Order"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>

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

@media (max-width: 768px) {
	.table th, .table td {
		font-size: 0.85rem;
	}
	.book-img {
		width: 40px;
		height: 40px;
	}
	.btn-custom {
		padding: 5px 14px;
		font-size: 0.75rem;
	}
}
</style>

</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${ empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container p-1">
	
	 <h3 class="text-center text-primary">Your Order</h3>

		<div class="glass-container">
			<table class="table table-hover mt-3">
				<thead class="table-dark">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
					</tr>
				</thead>
				<tbody>
				
				<% 
				User u=(User)session.getAttribute("userobj");
				BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
				
				List<Book_Order> blist=dao.getBook(u.getEmail());
				
				for(Book_Order b:blist)
				{%>
					<tr>
						<th scope="row"><%=b.getOrderId() %></th>
						<td><%=b.getUsername() %></td>
						<td><%=b.getBookName() %></td>
						<td><%=b.getAuthor() %></td>
						<td><%=b.getPrice() %></td>
						<td><%=b.getPaymentType() %></td>
					</tr>
				<%}
				%>
				
				</tbody>
			</table>
		</div>

	</div>

</body>
</html>
