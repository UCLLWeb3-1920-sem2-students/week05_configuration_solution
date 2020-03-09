<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
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
        <jsp:param name="title" value="New Country"/>
    </jsp:include>
    <article>
        <form method="POST" action="Controller">
            <c:if test="${not empty result}">
                <div class="alert alert-danger">
                    <c:forEach items="${result}" var="message">
                        <p>${message}</p>
                    </c:forEach>
                </div>
            </c:if>
            <fieldset>
                <legend>Identification</legend>
                <p class="form-group ${nameClass}">
                    <label class="control-label" for="name">Name (required): </label> <input
                        id="name" name="name" type="text" value="<c:out value="${param.name}"/>">
                </p>
                <p class="form-group ${capitalClass}">
                    <label class="control-label" for="capital">Capital: </label>
                    <input
                            id="capital" type="text" name="capital" value="<c:out value="${param.capital}"/>">
                </p>
                <p class="form-group ${inhabitantsClass}">
                    <label class="control-label" for="inhabitants">Inhabitants:
                    </label> <input id="inhabitants" name="inhabitants" type="text"
                                    value="<c:out value="${param.inhabitants}"/>">
                </p>
            </fieldset>
            <p class="form-group ${votesClass}">
                <label class="control-label" for="votes">Votes: </label> <input
                    id="votes" name="votes" type="text" value="<c:out value="${param.votes}"/>">
            </p>

            <p>
                <label for="bewaar">&nbsp;</label><input id="bewaar" type="submit"
                                                         value="Save">
            </p>

        </form>
    </article>
</main>
</body>
</html>