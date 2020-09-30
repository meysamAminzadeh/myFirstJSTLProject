<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 5/23/2020
  Time: 12:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>JSTL</title>
  </head>
  <body>

  <form action="page2.jsp">
    <input type="text" name="name">
    <br/>
    <input type="text" name="family">
    <input type="submit">
  </form>

  <core:set var="stringToInt" value="202"></core:set>
  <core:out value="${stringToInt}"></core:out>
  <br/>
  <fmt:parseNumber var="parsedNumber" type="number" value="${stringToInt}" />
  <core:out value="${parsedNumber*2}"></core:out>

<br/>
  <core:out value="2+2"></core:out>

  <br/>

  <core:out value="${2+2}"></core:out>

  <br/>

  <core:set var="a" value="2"></core:set>

  <core:out value="a"></core:out>

  <br/>

  <core:out value="${a}"></core:out>

  <br/>

  <%
    session.setAttribute("name","ALI");
  %>

  <br/>

  <core:set var="nameJstl" value="ALI" scope="session"></core:set>

  <form action="page2.jsp">
    <input type="submit">
  </form>

  <br/>


  </body>
</html>
