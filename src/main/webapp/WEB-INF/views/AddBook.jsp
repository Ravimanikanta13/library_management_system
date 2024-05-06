<html>
<head>
<title>Add Book</title>
<script>
	function validateForm() {
		var errors = "";

		var authorName = document.forms["AddBookForm"]["authorName"].value;
		if (authorName.trim() == "") {
			errors += "Please Enter Author Name.\n";
		}

		var title = document.forms["AddBookForm"]["title"].value;
		if (title.trim() == "") {
			errors += "Please Enter Title.\n";
		}

		var type = document.forms["AddBookForm"]["type"].value;
		if (type.trim() == "") {
			errors += "Please Enter Type.\n";
		}

		var price = document.forms["AddBookForm"]["price"].value;
		if (price.trim() == "") {
			errors += "Please enter Price.\n";
		}

		var totalLessons = document.forms["AddBookForm"]["totalLessons"].value;
		if (totalLessons.trim() == "") {
			errors += "Please enter Total Lessons.\n";
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
	<br>
	<a href="getOptions">Get Records</a>
	<br>
	<a href="showEditBookOptions">Edit Book</a>
	<br>
	<a href="deleteBookOptions">Delete Record</a>
	<br>

	<form name="AddBookForm" action="addBook" method="GET"
		onsubmit="return validateForm()">
		<table border='2'>
			<tr>
				<td colspan='2' style="text-align: center;">Add New Book</td>
			</tr>
			<tr>
				<td>Author Name</td>
				<td><input type="text" name="authorName"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" name='title'></td>
			</tr>
			<tr>
				<td>Type</td>
				<td><input type="text" name='type'></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><Input type="text" name='price'></td>
			</tr>
			<tr>
				<td>Total Lessons</td>
				<td><input type="text" name='totalLessons'></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><input
					type='submit' value='Save'></td>
			</tr>
		</table>
	</form>
</body>
</html>
