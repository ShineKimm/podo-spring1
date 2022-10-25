<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<body>
<div class="container">
    <div>
        <table>
            <thead>

            <tr>
<%--                <th>#</th>--%>
<%--                <th>이름</th>--%>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="item" items="${members}" begin="0" end="1" step="1" varStatus="status">
                <p>이름 : ${item.name}</p>
            </c:forEach>


            </tbody>
        </table>
    </div>
</div> <!-- /container -->
</body>
</html>
