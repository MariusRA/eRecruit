<%-- 
    Document   : subpageTemplate
    Created on : Jan 7, 2021, 1:06:48 AM
    Author     : Denisa
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
        footer {
            width: 100%;
            background-color: hsla(248, 18%, 65%, 0.58);
            text-align: center;
            height: 80px;
        }
        .students {
            width: 100%;
            padding-top: 30px;
            height: 20px;
            color: #000000;
        }
    </style>
    <body>
        <jsp:include page="/WEB-INF/pages/submenu.jsp"/>
        <main>
            <jsp:doBody/> 
        </main>
    </body>
    <footer>
         <div class="students">Proiect realizat de Andrei Paul-Valer, Dancu Denisa-Florentina, Ratiu Marius-Andrei, Popa Ioan-Alexandru, Morariu Elisei-Ionel</div>
    </footer>
</html>