<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Infirmier Dashboard - TeleDx</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <jsp:include page="/views/layouts/header.jsp" />
    
    <div id="content" class="min-h-screen">
        <jsp:include page="${contentPage}" />
    </div>
    
    <jsp:include page="/views/layouts/footer.jsp" />
</body>
</html>