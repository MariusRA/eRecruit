<%-- 
    Document   : pageTemplate
    Created on : Jan 4, 2021, 1:11:22 PM
    Author     : eli10
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle"%>

<%-- any content can be specified here e.g.: --%>
<!DOCTYPE html>
<html>
    <head>
        <title>${pageTitle}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="/WEB-INF/pages/menu.jsp"/>
        <main>
            <jsp:doBody/> 
        </main>
    </body>
</html>