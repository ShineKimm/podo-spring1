<!-- #include virtual='/mobile/include/header.asp' -->
<script language="javascript">
		$(document).ready(function() {
			if("<%=session.getAttribute("ms_num")%>" != "") {
				alert("이미 로그인이 되어있습니다.");
				location.href="/mobile/index.asp";
			}

			var chk = getCookie("chkSaveId");
			var id = getCookie("loginId");

			if(chk != null && chk != "") {
				$("#chkSaveId").attr('checked', true);
			}

			if(id != null && id != "") {
				$("#txtId").val(id);
			}

			$("#txtId").keypress(function (event) {
				if(event.keyCode == 13) {
					doLogin();
				}
			});

			$("#txtPw").keypress(function (event) {
				if(event.keyCode == 13) {
					doLogin();
				}
			});
		});

		function doLogin() {
			var sUrl = "/controller/MemberController.asp";
			var params = {};
			var page = "<%=request("page")%>";

			var id = $("#txtId").val();
			var pw = $("#txtPw").val();

			if(page == null || page == "") {
				page = "/mobile/index.asp";
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
			params["coDiv"] = globals.coDiv;
			params["id"] = id;
			params["pw"] = pw;

			mAjax(sUrl, params, "POST", true, function(data) {
				if(data.resultCode == "0000") {
					var chkSaveId = $('input:checkbox[id="chkSaveId"]').is(":checked");

					if(chkSaveId) {
						setCookie("loginId", $("#txtId").val(), 365);
						setCookie("chkSaveId", true, 365);
					} else {
						setCookie("loginId", "", 365);
						setCookie("chkSaveId", "", 365);
					}
					alert(data.resultName + "회원님 환영합니다.")
					location.href = page;
				} else {
					alert(data.resultMessage);
				}
			});
		}
</script>
<div class="menuTabBox">
	<ul class="menuList">
		<li class="" ><a href="/mobile/member/join01.asp">회원가입</a></li>
		<li class="on" ><a href="/mobile/member/login.asp">로그인</a></li>
	</ul>
</div>

<div class="contents">
	<!--<img src="/mobile/images/logo.svg" alt="" class="bigLogo">-->

	<ul class="loginBox">
		<li><input type="text" placeholder="아이디" class="idInput" id="txtId"></li>
		<li><input type="password" placeholder="비밀번호" class="pwInput" id="txtPw"></li>
		<li><input type="checkbox" class="check" id="chkSaveId"> 아이디저장</li>
	</ul>
	<a href="javascript:doLogin()" class="loginBtn">로그인</a>
	<a href="/mobile/member/find.asp" class="loginBtn2">아이디/비밀번호찾기</a>
</div>	
<%@ include file="../include/footer.jsp" %>

