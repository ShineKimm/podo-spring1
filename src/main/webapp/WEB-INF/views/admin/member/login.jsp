<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>포도CC 관리자</title>

    <link href="/static/admin/css/login.css" rel="stylesheet" type="text/css">

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <script src="/static/js/globals.js"></script>
    <script src="/static/js/tools.js"></script>
    <script src="/static/js/jquery.preloaders.js"></script>

    <script>
      $(document).ready(function() {
        var chkId = getCookie("chkSaveAdminId");
        var chkPw = getCookie("chkSaveAdminPw");
        var id = getCookie("txtAdminId");
        var pw = getCookie("txtAdminPw");

        if(chkId != null && chkId != "") {
          $("#chkSaveAdminId").attr('checked', true);
        }

        if(chkPw != null && chkPw != "") {
          $("#chkSaveAdminPw").attr('checked', true);
        }

        if(id != null && id != "") {
          $("#txtAdminId").val(id);
        }

        if(pw != null && pw != "") {
          $("#txtAdminPw").val(pw);
        }

        $("#txtAdminId").keypress(function (event) {
          if(event.keyCode == 13) {
            doLogin();
          }
        });

        $("#txtAdminPw").keypress(function (event) {
          if(event.keyCode == 13) {
            doLogin();
          }
        });
      });

      function doLogin() {
        var sUrl = "/controller/AdminController";
        var params = {};
        <%--var page = "<%=Request("page")%>";--%>
        var page = "<%=request.getParameter("page")%>";

        var id = $("#txtAdminId").val();
        var pw = $("#txtAdminPw").val();

        if(page == null || page == "") {
          page = "/admin/index";
        }

        if(id == "") {
          alert("아이디를 입력하세요.");
          return;
        }

        if(pw == "") {
          alert("비밀번호를 입력하세요.");
          return;
        }

        params["method"] = "doLogin";
        params["id"] = id;
        params["pw"] = pw;

        mAjax(sUrl, params, "POST", true, function(data) {
          if(data.resultCode == "0000") {
            var chkSaveAdminId = $('input:checkbox[id="chkSaveAdminId"]').is(":checked");
            var chkSaveAdminPw = $('input:checkbox[id="chkSaveAdminPw"]').is(":checked");

            if(chkSaveAdminId) {
              setCookie("txtAdminId", $("#txtAdminId").val(), 365);
              setCookie("chkSaveAdminId", true, 365);
            } else {
              setCookie("txtAdminId", "", 365);
              setCookie("chkSaveAdminId", "", 365);
            }

            if(chkSaveAdminId && chkSaveAdminPw) {
              setCookie("txtAdminPw", $("#txtAdminPw").val(), 365);
              setCookie("chkSaveAdminPw", true, 365);
            } else {
              setCookie("txtAdminPw", "", 365);
              setCookie("chkSaveAdminPw", "", 365);
            }

            location.href = page;
          } else {
            alert(data.resultMessage);
          }
        });
      }

    </script>
</head>

<body>
<div id="wrap">
    <p class="title">포도CC 관리자 로그인</p>
    <div id="login">
        <ul class="register">
            <li class="name">
                <div>아이디</div>
                <div>비밀번호</div>
            </li>
            <li class="box">
                <div><input type="text" id="txtAdminId"></div>
                <div><input type="password" id="txtAdminPw"></div>
            </li>
            <li class="btnlogin" onclick="javascript:doLogin()" style="cursor:pointer;"><font color="white">로그인</font></li>
        </ul>
        <ul class="save">
            <li><input type="checkbox" id="chkSaveAdminId"></li>
            <li class="space2">아이디 저장</li>
            <li class="left"><input type="checkbox" id="chkSaveAdminPw"></li>
            <li class="space2">비밀번호 저장<li>
        </ul>
    </div>
</div>
</body>
</html>
