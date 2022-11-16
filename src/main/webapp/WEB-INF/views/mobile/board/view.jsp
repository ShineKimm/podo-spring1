<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
	var mType;
	var mIdx;

	var title = {
		"1" : "공지사항",
		"2" : "이벤트",
		"3" : "분실물정보",
		"4" : "자료실",
		"5" : "코스갤러리",
		"7" : "명예의 전당"
	}

	$(document).ready(function() {
		init();
	});

	function init() {
		mType = "<%=Request("type")%>";
		mIdx = "<%=Request("idx")%>";

		$("#txtTitle").html(title[mType]);
		$("#type" + mType).addClass("on");

		if (mType == "5") {
			$("#galleryList").show();
		} else {
			$("#boardList").show();
		}

		doSearchDetail();
	}

	function doSearchDetail() {
		var sUrl = "/controller/BoardController";
		var params = {};

		//params["method"] = "getBoardDetail";
		params["coDiv"] = globals.coDiv;
		params["type"] = mType;
		params["idx"] = mIdx;

		mAjax(sUrl, params, "POST", true, function(data) {
			if(data.resultCode == "0000") {
				rows = data.rows;

				var title = rows[0].TITLE;
				var writer = rows[0].WRITER_NAME;
				var inputDate = rows[0].INPUT_DATETIME;
				var viewCnt = rows[0].VIEW_CNT;
				var content = rows[0].CONTENT;
				content = replaceAll(content, "\n", "<br>");

				$("#txtSubject").html(title);
				$("#txtWriter").html(writer);
				$("#txtDate").html(inputDate);
				$("#txtViewCnt").html(viewCnt);

				$("#contentContainer").html(content);

				var imageContainer = $("#imageContainer");

				var fileName1 = rows[0].FILE_NAME1;
				var fileName2 = rows[0].FILE_NAME2;
				var fileName3 = rows[0].FILE_NAME3;
				var originFileName1 = rows[0].ORIGIN_FILE_NAME1;
				var originFileName2 = rows[0].ORIGIN_FILE_NAME2;
				var originFileName3 = rows[0].ORIGIN_FILE_NAME3;
				var filePath1 = rows[0].FILE_PATH1;
				var filePath2 = rows[0].FILE_PATH2;
				var filePath3 = rows[0].FILE_PATH3;

				if(fileName1 != "" && filePath1 != "") {
					if(isImage(fileName1)) {
						var img = String.format("<div class='viewContentBox'><img src='{0}/{1}' alt=''></div>", filePath1, fileName1);
						imageContainer.show();
						imageContainer.append(img);
					}
				}

				if(fileName2 != "" && filePath2 != "") {
					if(isImage(fileName2)) {
						var img = String.format("<div class='viewContentBox'><img src='{0}/{1}' alt=''></div>", filePath2, fileName2);
						imageContainer.show();
						imageContainer.append(img);
					}
				}
				if(fileName3 != "" && filePath3 != "") {
					if(originFileName3.substr(-3)=="mp4") {
						var img = String.format("<video muted autoplay loop controls width='370'><source src='{0}/{1}' type='video/mp4'></video>" ,filePath3, fileName3);
						imageContainer.show();
						imageContainer.append(img);
					}
				}
			} else {
				alert(data.resultMessage);
			}
		});
	}

</script>
<div class="menuTabBox">
	<ul class="menuList">
		<li class="" id="type1"><a href="/mobile/board/list?type=1">공지사항</a></li>
		<li class="" id="type2"><a href="/mobile/board/list?type=2">이벤트</a></li>
		<li class="" id="type3"><a href="/mobile/board/list?type=3">보도자료</a></li>
		<li class="" ><a href="/mobile/board/honor">홀인원</a></li>
		<li class="" id="type6"><a href="/mobile/board/joinList">조인게시판</a></li>
		<li class="" id="type7"><a href="/mobile/board/list?type=7">명예의 전당</a></li>
	</ul>
</div>

<div class="contents">
	<ul class="commonTitle">
		<li class="title" id="txtTitle"></li>
		<li class="midBar"></li>
	</ul>
	<div class="boardTxt">포도C.C의 새로운 소식을 전해드립니다. </div>
	<table class="boardTable" summary="게시글목록" style="">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td class="title" colspan="3" id="txtSubject"></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td id="txtDate"></td>
					<th>등록자</th>
					<td id="txtWriter"></td>
				</tr>
				<tr>
					<td class="boardCont" colspan="4">
						<div id="imageContainer"></div>
						<div id="contentContainer"></div>
					</td>
				</tr>
			</tbody>
	</table>
	<div class="btnBox">
		<a href="/mobile/board/list?type=<%=Request("type")%>" class="cancel">목록</a>
	</div>

	
</div>	
<%@ include file="../include/footer.jsp" %>
