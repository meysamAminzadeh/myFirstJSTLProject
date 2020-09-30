<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 5/23/2020
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>








<br/>
name= <core:out value="${param.name}"></core:out>
family= <core:out value="${param.family}"></core:out>



<%
    out.print(session.getAttribute("name"));
%>
<br/>
<core:out value="${sessionScope.nameJstl}"></core:out>
<br/>

<%
    out.print(request.getMethod());
%>
<br/>

<core:out value="${pageContext.request.method}"></core:out>

<core:forEach var="i" begin="0" end="5">

    <core:out value="${i}"></core:out>

</core:forEach>

<br/>
<core:forEach var="a" begin="0" end="50" step="2">

    <core:out value="${a}"></core:out>

</core:forEach>

<br/>
<core:set var="num1" value="10"></core:set>
<core:set var="num2" value="20"></core:set>
<core:if test="${num1>num2}">
    <core:out value=" num1=${num1} is out number "></core:out>
</core:if>
<core:if test="${num2>num1}">
    <core:out value=" num2=${num2} is out number "></core:out>
</core:if>

<br/>
<core:choose>

    <core:when test="${num1==10 && num2==22}">
        <core:out value="aaaaa"></core:out>
    </core:when>
    <core:when test="${num1==10 && num2==20}">
        <core:out value="bbbb"></core:out>
    </core:when>
    <core:when test="${num1==10 && num2==20}">
        <core:out value="cccc"></core:out>
    </core:when>
</core:choose>

<br/>
<sql:setDataSource

        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@192.168.142.134:1521:orcl"
        user="system"
        password="12345"
        scope="session"

/>

<sql:query var="max_id">
    SELECT max(person_id) m from person
</sql:query>
<core:forEach var="row" items="${max_id.rows}">
    <core:set var="maxId" value="${row.m}"/>
</core:forEach>

<sql:transaction>
    <sql:update>
        insert into person (person_id,name,family) values (?,?,?)
        <sql:param value="${maxId+1}" />
        <sql:param value="${'JSTL'}" />
        <sql:param value="${'SQLJstlTag'}" />
    </sql:update>
</sql:transaction>

<br/>

<sql:query var="result">
    SELECT * from person
</sql:query>
<table border="1">
    <core:forEach var="row" items="${result.rows}">
        <tr>
            <td><core:out value="${row.person_id}"/></td>
            <td><core:out value="${row.name}"/></td>
            <td><core:out value="${row.family}"/></td>
        </tr>
    </core:forEach>
</table>


</body>
</html>
