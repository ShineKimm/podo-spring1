<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>포도CC 관리자</title>

    <link href="/admin/css/style.css" rel="stylesheet" type="text/css">

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <script src="/static/js/globals.js"></script>
    <script src="/static/js/tools.js"></script>
    <script src="/static/js/jquery.preloaders.js"></script>

    <script>
      $(document).ready(function() {
        <%--var staff = "<%=Session("USER_STAFF")%>";--%>
        var staff = "<%=(String)session.getAttribute("USER_STAFF")%>";

        if(staff == "") {
          location.href = "/admin/member/login";
        }
      });

      function doLogout() {
        var sUrl = "/Controller/AdminController";
        var params = {};

        //params["method"] = "doLogout";

        mAjax(sUrl, params, "POST", true, function(data) {
          // if(data.resultCode == "0000") {
          if(data.resultCode == true) {
            alert("로그아웃 되었습니다.");
            location.href = "/admin/member/login"
          }
        });
      }
    </script>
</head>

<body>
<div id="header">
    <div class="content">
        <div class="logo">포도CC 관리자</div>
        <ul class="member">
            <li><a href="/index" target="_blank"><font color="white">홈페이지</font></a></li>
            <li>|</li>
            <li><a href="javascript:doLogout()"><font color="white">로그아웃</font></a></li>
        </ul>
    </div>
</div>
