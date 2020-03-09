<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.model.Country" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Collection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/sample.css">
    <meta charset="UTF-8">
    <title>Countries</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<main id="container">
    <jsp:include page="title.jsp">
        <jsp:param name="title" value="Countries"/>
    </jsp:include>

    <article>
        <c:if test="${popular != null}">

            <p>
                The most popular country is
                <c:out value="${popular.name}"/>
            </p>
        </c:if>
        <c:if test="${not empty countries}">
            <table id="overview">
                <tr>
                    <th>Name</th>
                    <th>Capital</th>
                    <th class="number">Inhabitants</th>
                    <th class="number">Votes</th>
                </tr>
                <c:forEach var="country" items="${countries}">
                    <tr>
                        <td><c:out value="${country.name}"/></td>
                        <td><c:out value="${country.capital}"/></td>
                        <td class="number"><c:out value="${country.numberInhabitants}"/></td>
                        <td class="number"><c:out value="${country.votes}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <p>
            <a href="countryForm.jsp">Add new country</a>
        </p>
    </article>
</main>
</body>
</html>