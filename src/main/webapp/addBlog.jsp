<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		 <div class="container">
        <h2>Ajouter un Blog</h2>
        <form action="addBlog" method="post" enctype="multipart/form-data">
            <!-- Remplacez "process-blog.php" par le script de traitement de votre formulaire -->

            <div class="form-group">
                <label for="title">Titre du Blog:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" class="form-control-file" id="image" name="image" accept="image/*" required>
            </div>

            <button type="submit" class="btn btn-primary">Ajouter le Blog</button>
        </form>
    </div>
</body>
</html>