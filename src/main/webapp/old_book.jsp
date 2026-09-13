<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User : Old Book</title>
<%@include file="all_component/allCss.jsp"%>

<style>
html, body {
    margin: 0;
    background: #f9f9f9;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #333;
}

.page-header {
    text-align: center;
    padding: 20px 0;
    font-size: 2rem;
    font-weight: 500;
    background: #fff;
    margin-bottom: 20px;
    background-image: linear-gradient(45deg, #8e44ad, #3498db, #e74c3c);
    -webkit-background-clip: text;
    color: transparent;
    animation: textAnimation 3s ease-in-out infinite;
}

@keyframes textAnimation {
    0% { background-position: 0%; }
    50% { background-position: 100%; }
    100% { background-position: 0%; }
}

.page-header:hover {
    background-image: linear-gradient(45deg, #f39c12, #e74c3c, #8e44ad);
    -webkit-background-clip: text;
    color: transparent;
}

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
    color: white;
}

.table-hover tbody tr:hover {
    background: #f0f0f0;
}

.table th, .table td {
    vertical-align: middle;
    font-size: 0.95rem;
    padding: 12px;
    text-align: center;
}

.btn-delete {
    background: #e53935;
    color: white;
    border: none;
    border-radius: 20px;
    padding: 8px 24px;
    font-size: 0.85rem;
    font-weight: 600;
    text-transform: uppercase;
    transition: all 0.3s ease;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.btn-delete:hover {
    transform: scale(1.05);
    opacity: 0.95;
}

@media (max-width: 768px) {
    .page-header {
        font-size: 1.5rem;
    }
    .btn-delete {
        padding: 6px 18px;
        font-size: 0.75rem;
    }
}
</style>
</head>
<body>

<%@include file="all_component/navbar.jsp"%>

<c:if test="${not empty succMsg}">
    <script>
        Swal.fire({
            icon : 'success',
            title : 'Success!',
            text : '${succMsg}',
            confirmButtonColor : '#28a745',
            timer : 3500,
            showConfirmButton : false
        });
    </script>
    <c:remove var="succMsg" scope="session" />
</c:if>

<c:if test="${not empty failedMsg}">
    <script>
        Swal.fire({
            icon : 'error',
            title : 'Oops!',
            text : '${failedMsg}',
            confirmButtonColor : '#dc3545',
            timer : 3500,
            showConfirmButton : false
        });
    </script>
    <c:remove var="failedMsg" scope="session" />
</c:if>

<div class="page-header">My Old Books</div>

<div class="glass-container">
    <table class="table table-hover text-center">
        <thead>
            <tr>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Category</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            User u = (User) session.getAttribute("userobj");
            String email = u.getEmail();
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list = dao.getBookByOld(email, "Old");
            for (BookDtls b : list) {
            %>
            <tr>
                <td><%=b.getBookName()%></td>
                <td><%=b.getAuthor()%></td>
                <td>&#8377;<%=b.getPrice()%></td>
                <td><%=b.getBookCategory()%></td>
                <td>
                    <a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
                       class="btn btn-delete">
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

</body>
</html>
