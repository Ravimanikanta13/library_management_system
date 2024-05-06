<%@page import="com.lms.service.LMSService"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.bean.Book"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
</head>
<body>
	<br>
	<a href="getOptions">Get Records</a>
	<br>
	<a href="showEditBookOptions">Edit Book</a>
	<br>
	<a href="deleteBookOptions">Delete Record</a>
	<br>
	<a href="addBook">Add Book</a>
	<form action="save" name="GetRecords" method="POST">
		<c:if test="${books.isEmpty()}">
			books not Found...!
		</c:if>

		<c:if test="${!books.isEmpty()}">
			<table border='2'>
				<tr>
					<td colspan='5' align='center'>book Report</td>
				</tr>
				<tr>
					<td>Author Name</td>
					<td>Title</td>
					<td>Type</td>
					<td>Price</td>
					<td>Total Lessons</td>
				</tr>
				<c:forEach var="book" items="${books}">
					<tr>
						<td><input type='text' name='authorName'
							value='${book.authorName}'></td>
						<td><input type='text' name='title' value='${book.title}'></td>
						<td><input type='text' name='type' value='${book.type}'></td>
						<td><input type='text' name='price' value='${book.price}'></td>
						<td><input type='text' name='totalLessons'
							value='${book.totalLessons}'></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan='5' align='center'><input type='submit'
						value='print'></td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>
