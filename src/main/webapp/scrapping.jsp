<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Scraping Results</title>
</head>
<body>
  <c:if test="${not empty scrapedDataList}">
    <c:forEach var="data" items="${scrapedDataList}">
        <div>
            <p>Titre: ${data.title}</p>
            <p>Paragraphe: ${data.paragraphe}</p>
            <p>Paragraphe: ${data.imageUrl} </p>
            <p>Image: <img style="width:100px;" src="${data.imageUrl}" alt="Image"></p>
            <p>Lien: <a href="${data.relativeLink}">${data.relativeLink}</a></p>
        </div>
    </c:forEach>
</c:if>

</body>
</html>
