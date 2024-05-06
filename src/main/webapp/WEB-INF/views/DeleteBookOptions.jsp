<%@page import="com.lms.service.LMSService"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.bean.Book"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script>
    function validateForm() {
        var bookId = document.forms["DeleteBookOptions"]["id"].value;
        if (bookId.trim() == "") {
            alert("Please select a Book ID");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
	<form name="DeleteBookOptions" action="deleteBook" method="post"
		onsubmit="return validateForm()">
		<c:if test="${empty books}">
            Books not Found to edit...!
        </c:if>

		<c:if test="${not empty books}">
            Book Id:
            &nbsp;&nbsp;
            <select name='id'>
				<option value=''>Please select the Book ID</option>
				<c:forEach var="book" items="${books}">
					<option value='${book.id}'>${book.id}--${book.title}--${book.type}--${book.authorName}-${book.price}</option>
				</c:forEach>
			</select> &nbsp; &nbsp;
            <input type='submit' value='Delete'>
		</c:if>
	</form>
</body>
</html>
