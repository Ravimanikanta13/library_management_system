<%@page import="com.lms.service.LMSService"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.bean.Book"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Edit Book</title>
<script>
	function validateForm() {
		var errors = "";

		var authorName = document.forms["EditBook"]["authorName"].value;
		if (authorName.trim() == "") {
			errors += "Please enter Author Name.\n";
		}

		var title = document.forms["EditBook"]["title"].value;
		if (title.trim() == "") {
			errors += "Please enter Title.\n";
		}

		var type = document.forms["EditBook"]["type"].value;
		if (type.trim() == "") {
			errors += "Please enter Type.\n";
		}

		var price = document.forms["EditBook"]["price"].value;
		if (price.trim() == "") {
			errors += "Please enter Price.\n";
		}

		var totalLessons = document.forms["EditBook"]["totalLessons"].value;
		if (totalLessons.trim() == "") {
			errors += "Please Enter Total Lessons.\n";
		}

		if (errors !== "") {
			alert(errors);
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<form action="editBook" name="EditBook" method="post"
		onsubmit="return validateForm()">
		<c:if test="${book == null }">
            Books not Found to edit...!
        </c:if>
		<c:if test="${book != null }">
			<table border='2'>
				<tr>
					<td colspan='2' style="text-align: center;">EditBook Details</td>
				</tr>
				<tr>
					<td>Author Name</td>
					<td><input type="text" name="authorName"
						value='${book.authorName }'></td>
				</tr>
				<tr>
					<td>Title</td>
					<td><input type="text" name='title' value='${book.title }'></td>
				</tr>
				<tr>
					<td>Type</td>
					<td><input type="text" name='type' value='${book.type }'></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><Input type="text" name='price' value='${book.price }'></td>
				</tr>
				<tr>
					<td>Total Lessons</td>
					<td><input type="text" name='totalLessons'
						value='${book.totalLessons }'></td>
				</tr>
				<tr>
					<td colspan='2' style="text-align: center;"><input
						type="hidden" name="id" value="${book.id}"> <input
						type='submit' value='Update'></td>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>
