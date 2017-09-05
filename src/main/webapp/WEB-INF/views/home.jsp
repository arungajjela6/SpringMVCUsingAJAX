<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body onload="load();">
	<h1 align="center">Welcome</h1>
	<hr />
	<table border="2" align="center">
		<tr>
			<td>Id</td>
			<td><input type="text" id="id" placeholder="Product ID"
				name="id"></td>
		</tr>

		<tr>
			<td>Name</td>
			<td><input type="text" id="name" placeholder="Product Name"
				name="name"></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" id="dept"
				placeholder="Product Description" name="dept"></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" id="price" placeholder="Product Price"
				name="price"></td>
		</tr>
		<tr>
			<td><a href=#">
					<button type="submit" onclick="update();">Update Product</button>
			</a></td>
			<td><a href=#">
					<button type="submit" onclick="submit();">Add Product</button>
			</a></td>
		</tr>
	</table>
	<h5 align="center">Products List</h5>

	<table id="table" align="center" border=2>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</table>


	<script type="text/javascript">
		data = "";

		load = function() {
			$
					.ajax({
						url : 'list',
						type : 'POST',
						success : function(response) {
							data = response.data;
							$('.tr').remove();
							for (i = 0; i < response.data.length; i++) {
								$("#table")
										.append(
												"<tr class='tr'> <td>"+ response.data[i].id+ "</td><td> "+ response.data[i].name
														+ " </td> <td> "+ response.data[i].dept+ " </td> <td> "+ response.data[i].price
														+ " </td><td><a href='#' onclick='edit("+ i+ ");'>Edit</td><td> <a href='#' onclick='delete_("
														+ response.data[i].id+ ");'> Delete </a>  </td> </tr>");
							}
						}
					});

		}

		delete_ = function(id) {
			$.ajax({
				url : 'delete',
				type : 'POST',
				data : {
					id : id
				},
				success : function(response) {
					alert(response.message);
					load();
				}
			});
		}

		submit = function() {

			$.ajax({
				url : 'save',
				type : 'POST',
				data : {
					id : $("#id").val(),
					name : $('#name').val(),
					dept : $('#dept').val(),
					price : $('#price').val()
				},
				success : function(response) {
					alert(response.message);
					load();
				}
			});
		}

		update = function() {
			$.ajax({
				url : 'update',
				type : 'POST',
				data : {
					id : $('#id').val(),
					name : $('#name').val(),
					dept : $('#dept').val(),
					price : $('#price').val()
				},
				success : function(response) {
					alert(response.message);
					load();
				}
			});
		}
		edit = function(index) {
			$("#id").val(data[index].id);
			$("#name").val(data[index].name);
			$("#dept").val(data[index].dept);
			$("#price").val(data[index].price);
		}
	</script>
</body>
</html>
