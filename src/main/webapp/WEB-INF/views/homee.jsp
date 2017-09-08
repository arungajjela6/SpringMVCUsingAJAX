<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body onload="load();">
	<div class="container">
		<h2 align="center">Welcome</h2>
		<h4>List of Products</h4>
		<table id="table" class="table table-hover">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Department</th>
					<th>Price</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
		</table>

		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal" id="second">Add or Edit</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add or Edit</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="name">Name:</label> <input type="text"
									class="form-control" id="name" name="name">
							</div>
							<div class="form-group">
								<label for="dept">Description:</label> <input type="text"
									class="form-control" id="dept" name="dept">
							</div>
							<div class="form-group">
								<label for="price">Price:</label> <input type="text"
									class="form-control" id="price" name="price">
							</div>
							<a href=# onclick="submit();"><button type="submit" class="btn btn-default">Add</button></a>
							<a href=# onclick="update();"></a><button type="submit" class="btn btn-default">Update</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>



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
												"<tbody><tr class='tr'> <td>"
														+ response.data[i].id
														+ "</td><td> "
														+ response.data[i].name
														+ " </td> <td> "
														+ response.data[i].dept
														+ " </td> <td> "
														+ response.data[i].price
														+ " </td><td><a href='#' onclick='edit("
														+ i
														+ ");'>Edit</a></td><td> <a href='#' onclick='delete_("
														+ response.data[i].id
														+ ");'> Delete </a>  </td> </tr></tbody>");
							}
						}
					});

		}

		submit = function() {

			$.ajax({
				url : 'save',
				type : 'POST',
				data : {
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
			$("#second").click();
		}
		
	</script>
</body>
</html>