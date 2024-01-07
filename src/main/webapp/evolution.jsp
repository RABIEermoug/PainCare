<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success Page</title>
</head>
<body>

<%
    // Display Level of Pain
    out.println("<p>Level of Pain: " + request.getAttribute("levelOfPain") + "</p>");

    // Display Selected Feelings
    out.println("<p>Feelings:");
    String[] feelings = (String[]) request.getAttribute("size");
    if (feelings != null) {
        for (String feeling : feelings) {
            out.println(feeling + "<br/>");
        }
    }
    out.println("</p>");
%>

</body>
</html>
