<html>
<head>
<script>
	function validateForm() {
		var errors = "";

		var authorName = document.forms["GetRecords"]["type"].value;
		if (authorName.trim() == "") {
			errors += "Please enter Type.\n";
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
	<form action="getRecords" name="GetRecords" method="post"
		onsubmit="return validateForm()">
		<table border='2'>
			<tr>
				<td colspan='2' style="text-align: center;">Get Book Details</td>
			</tr>
			<tr>
				<td>Type</td>
				<td><input name='type'></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><input
					type="submit" value="Next"></td>
			</tr>
		</table>
	</form>
</body>
</html>