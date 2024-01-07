<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Page</title>
    <style>
        /* Ajoutez votre style CSS ici */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .blog {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }

        .comment {
            margin-left: 20px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<c:forEach var="blog" items="${blogs}">
    <div class="blog">
        <h2>${blog.title}</h2>
        <p>${blog.description}</p>
        <p>By: ${blog.username}</p>

        <h3>Comments:</h3>
        <c:forEach var="commentaire" items="${commentaires}">
            <c:if test="${commentaire.blog_id == blog.id}">
                <div class="comment">
                    <p>${commentaire.content}</p>
                    <p>By: ${commentaire.userName}</p>
                </div>
            </c:if>
            
        </c:forEach>
    </div>
    <form action="AddCommentaire"  method="post">
    		 <input type="hidden" name="blogid" value="${blog.id }" />
            <input type="text" name="commentaire_saisie" placeholder="Saisir un comment"  />
            <input type="submit"> 
    </form>
</c:forEach>

</body>
</html>
