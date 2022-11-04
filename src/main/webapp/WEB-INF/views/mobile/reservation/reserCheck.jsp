<!-- #include virtual='/mobile/include/header.asp' -->
<script type="text/javascript">

var rows;

$(document).ready(function() {
	init();
});

function init() {
	if("<%=session.getAttribute("ms_num")%>" == "") {
		alert("로그인 후 이용 가능합니다.");
		location.href = "/mobile/member/login.asp";
		return;
	}

	doSearch();
}

function doSearch() {
	var sUrl = "/controller/ReservationController.asp";
	var params = {};

	params["method"] = "getReservationList";
	params["coDiv"] = globals.coDiv;
	params["msNum"] = "<%=session.getAttribute("ms_num")%>";

	mAjax(sUrl, params, "GET", true, function(data) {
		if(data.resultCode == "0000") {
			var tBody = $("#tbody");
			tBody.empty();

			rows = data.rows;

			if(rows.length == 0) {
				tBody.append("<tr><td colspan='6'>조회되는 예약건이 없습니다. </td></tr>");
			}

			for(i=0; i<rows.length; i++) {
				var row = $("<tr></tr>");

				var bkDate = rows[i].BK_DAY;
				bkDate = bkDate.substring(2, 4) + "/" + bkDate.substring(4, 6) + "/" + bkDate.substring(6, 8);
				var bkTime = rows[i].BK_TIME;
				bkTime = bkTime.substring(0, 2) + ":" + bkTime.substring(2, 4);
				var cancelDiff = rows[i].CANCEL_DIFF;
				var cancelYn = "Y";

				if(cancelDiff < 5) {
					cancelYn = "N";
				}
				if(cancelDiff == 5 && new Date().getHours() >= 17 ) {
					cancelYn = "N";
				}

				var col1 = $("<td>" + bkDate + "</td>");
				var col2 = $("<td>" + bkTime + "</td>");
				var col3 = $("<td>" + rows[i].BK_COS_NM + "코스</td>");
				var col4 = $("<td>" + rows[i].BK_CADDY + "</td>");
				var col5 = $("<td>" + rows[i].BK_FIRST_PHONE1 + "-" +  rows[i].BK_MID_PHONE1 + "-" +  rows[i].BK_LAST_PHONE1 + "</td>");
				if(rows[i].AFTER_YN=="Y"){					
					if (cancelYn == "Y") {
					var	col6 = $("<td><button type='button' value='변경' class='motion inputBtn2' onclick='changeReservation(" + i + ")'>변경</button><button type='button' value='취소' class='cancel inputBtn2' onclick='doDeleteReservation(" + i + ")'>취소</button></td>");
					} else {
					var	col6 = $("<td><button type='button' value='변경' class='motion inputBtn2' onclick='cantChange()'>변경</button><button type='button' value='취소' class='cancel inputBtn2' onclick='cantCancel()'>취소</button></td>");
					}
				}else{
					var	col6 = $("<td><button type='button' value='완료' class='cancel inputBtn2' onclick=''>완료</button></td>");
				}

				row.append(col1,col2,col3,col4,col5,col6).appendTo(tBody);
			}
		} else {
			alert(data.resultMessage);
		}
	});
}

function cantCancel() {
	alert("해당 예약은 위약일자에 포함되는 예약으로 취소가 불가능합니다.");
}

function cantChange() {
	alert("해당 예약은 위약일자에 포함되는 예약으로 예약변경이 불가능합니다.");
}

function blDeleteReservation(i) {

	ans = confirm("[위약 확인] 해당건은 위약 일자에 포함되는 건으로 취소시 위약이 발생합니다. 취소를 진행 하시겠습니까?");

	if (ans == true) {

		var sUrl = "/controller/ReservationController.asp";
		var params = {};

		params["method"] = "blDeleteReservation";
		params["coDiv"] = globals.coDiv;
		params["msNum"] = "<%=session.getAttribute("ms_num")%>";
		params["day"] = rows[i].BK_DAY;
		params["cos"] = rows[i].BK_COS;
		params["time"] = rows[i].BK_TIME;
		params["remain"] = rows[i].REMAINDAY;

		mAjax(sUrl, params, "POST", true, function(data) {
			if(data.resultCode == "0000") {
				alert("취소 되었습니다.")

				doSearch();
			} else {
				alert(data.resultMessage);
			}
		});

	} else {
		return;
	}
}

function doDeleteReservation(i) {

	var bkDate = rows[i].BK_DAY;
	bkDate = bkDate.substring(2, 4) + "." + bkDate.substring(4, 6) + "." + bkDate.substring(6, 8);
	var bkTime = rows[i].BK_TIME;
	bkTime = bkTime.substring(0, 2) + ":" + bkTime.substring(2, 4);

	ans = confirm("[취소 확인] <%=Session("MS_NAME")%> 회원님. \r\n" + bkDate + " " + bkTime + " " + rows[i].BK_COS_NM + "코스 취소를 진행 하시겠습니까?");

	if (ans == true) {

		var sUrl = "/controller/ReservationController.asp";
		var params = {};

		params["method"] = "cancelReservation";
		params["coDiv"] = globals.coDiv;
		params["msNum"] = "<%=session.getAttribute("ms_num")%>";
		params["day"] = rows[i].BK_DAY;
		params["cos"] = rows[i].BK_COS;
		params["time"] = rows[i].BK_TIME;

		mAjax(sUrl, params, "POST", true, function(data) {
			if(data.resultCode == "0000") {
				alert("취소 되었습니다.")

				doSearch();
			} else {
				alert(data.resultMessage);
			}
		});

	} else {
		return;
	}
}

function changeReservation(i) {
	$("#BK_DAY").val(rows[i].BK_DAY);
	$("#BK_COS").val(rows[i].BK_COS);
	$("#BK_COS_NM").val(rows[i].BK_COS_NM);
	$("#BK_TIME").val(rows[i].BK_TIME);
	$("#BK_NAME").val(rows[i].BK_NAME);
	$("#BK_ROUNDF").val(rows[i].BK_ROUNDF);
	$("#form_change").submit();
}

</script>

<form id="form_change" action="/mobile/reservation/reservation.asp" method="post">
	<input type="hidden" name="OLD_BK_DAY" 					id="BK_DAY" >
	<input type="hidden" name="OLD_BK_COS" 					id="BK_COS" >
	<input type="hidden" name="OLD_BK_COS_NM" 			id="BK_COS_NM" >
	<input type="hidden" name="OLD_BK_TIME" 				id="BK_TIME" >
	<input type="hidden" name="OLD_BK_NAME" 				id="BK_NAME" >
	<input type="hidden" name="OLD_BK_ROUNDF" 			id="BK_ROUNDF" >
</form>
<div class="menuTabBox">
	<ul class="menuList">
		<li class="" ><a href="/mobile/reservation/reservation.asp">실시간예약</a></li>
		<li class="on" ><a href="/mobile/reservation/reserCheck.asp">예약확인/취소</a></li>
	</ul>
</div>

<div class="contents">
	<ul class="commonTitle">
		<li class="title">예약확인 / 취소 </li>
		<li class="midBar"></li>
	</ul>

	<div class="commonDot"> 예약확인</div>
	<table class="commonTable" summary="예약확인">
		<caption>예약확인</caption>
		<colgroup>
			<col width="12%">
			<col width="12%">
			<col width="10%">
			<col width="22%">
			<col width="22%">
			<col width="22%">
		</colgroup>
		<thead>
			<tr>
				<th class="col">예약일</th>
				<th class="col">시간</th>
				<th class="col">코스</th>
				<th class="col">캐디여부</th>
				<th class="col">핸드폰</th>
				<th class="col">취소/변경</th>
			</tr>			
		</thead>
		<tbody id="tbody">	
		</tbody>
	</table>
</div>	
<%@ include file="../include/footer.jsp" %>
