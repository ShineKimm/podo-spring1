<!-- #include virtual='/mobile/include/header.asp' -->
<script>

	$(document).ready(function() {
		init();
	});

	function init() {
		$("#txtIdName").keypress(function (event) {
			if(event.keyCode == 13) {
				doFindId();
			}
		});
		$("#txtIdPhone").keypress(function (event) {
			if(event.keyCode == 13) {
				doFindId();
			}
		});
		$("#txtPwName").keypress(function (event) {
			if(event.keyCode == 13) {
				doFindPw();
			}
		});
		$("#txtPwId").keypress(function (event) {
			if(event.keyCode == 13) {
				doFindPw();
			}
		});
	}

	function doFindId() {
		var sUrl = "/controller/MemberController.asp";
		var params = {};

		params["method"] = "doFindId";
		params["coDiv"] = globals.coDiv;

		var name = $("#txtIdName").val();
		var phone = $("#txtIdPhone").val();

		if(name == "") {
			alert("이름을 입력하세요.");
			return;
		}

		if(phone == "") {
			alert("핸드폰번호를 입력하세요.");
			return;
		}

		params["name"] = name;
		params["phone"] = phone;

		mAjax(sUrl, params, "GET", true, function(data) {
			alert(data.resultMessage);
		});
	}

	function doFindPw() {
		var sUrl = "/controller/MemberController.asp";
		var params = {};

		params["method"] = "doFindPw";
		params["coDiv"] = globals.coDiv;

		var name = $("#txtPwName").val();
		var id = $("#txtPwId").val();

		if(name == "") {
			alert("이름을 입력하세요.");
			return;
		}

		if(id == "") {
			alert("아이디를 입력하세요.");
			return;
		}

		params["name"] = name;
		params["id"] = id;

		mAjax(sUrl, params, "POST", true, function(data) {
			alert(data.resultMessage);
		});
	}

</script>
<div class="menuTabBox">
	<ul class="menuList">
		<li class="" ><a href="/mobile/member/find.asp">아이디찾기</a></li>
		<li class="on" ><a href="/mobile/member/find2.asp">비밀번호찾기</a></li>
	</ul>
</div>

<div class="contents">
	<ul class="commonTitle">
		<li class="title">비밀번호 찾기</li>
		<li class="midBar"></li>
	</ul>

	<ul class="loginBox">
		<li><input type="text" placeholder="이름" class="idInput" id="txtPwName" maxlength="30"></li>
		<li><input type="text" placeholder="아이디" class="pwInput" id="txtPwId" maxlength="30"></li>
	</ul>
	<a href="javascript:doFindPw()" class="loginBtn">확인</a>
	
</div>	
<%@ include file="../include/footer.jsp" %>

