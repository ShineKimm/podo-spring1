<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
  var mType = "6";
  var mIdx;
  var re_rows;

  $(document).ready(function() {
    init();
  });

  function init() {
    if("<%=session.getAttribute("ms_num")%>" == "") {
      alert("로그인 후 이용 가능합니다.");
      location.href = "/member/login?page=/reservation/joinList";
      return;
    }

    mIdx = "<%=Request("idx")%>";

    doSearchDetail();
    doSearchReply();
  }

  function doSearchDetail() {
    var sUrl = "/controller/BoardController";
    var params = {};

    params["method"] = "getBoardDetail";
    params["coDiv"] = globals.coDiv;
    params["type"] = mType;
    params["idx"] = mIdx;

    mAjax(sUrl, params, "POST", true, function(data) {
      if(data.resultCode == "0000") {
        var rows = data.rows;

        var title = rows[0].TITLE;
        var writer = rows[0].WRITER_NAME;
        var inputDate = rows[0].INPUT_DATETIME;
        var viewCnt = rows[0].VIEW_CNT;
        var content = rows[0].CONTENT;
        var bkDay = getDateFormat(rows[0].BK_DAY);
        content = replaceAll(content, "\n", "<br>");

        $("#txtTitle").html(title);
        $("#txtWriter").html(writer);
        $("#txtViewCnt").html(viewCnt);
        $("#txtDate").html(inputDate);
        $("#txtContent").html(content);

        var template = "";
        template += "부킹일자 : {0} . {1} . {2} ({3}) <br>";
        template += "부킹시간 : {4} 시대<br>";
        template += "구분 : {5}<br>";
        template += "진행상태 : {6}";

        $("#txtBkInfo").html(String.format(template
            , bkDay.yyyy()
            , bkDay.mm()
            , bkDay.dd()
            , bkDay.week()
            , rows[0].BK_TIME
            , (rows[0].BOARD_DIV == "1" ? "초청" : "신청")
            , (rows[0].JOIN_STATUS == "1" ? "진행중" : "종료")
        ));

        if("<%=session.getAttribute("ms_num")%>" == rows[0].INPUT_STAFF) {
          $("#btnAdminAction1").show();
          $("#btnAdminAction2").show();
        }
      } else {
        alert(data.resultMessage);
      }
    });
  }

  function doSearchReply() {
    var sUrl = "/controller/BoardController";
    var params = {};

    params["method"] = "getReplyList";
    params["coDiv"] = globals.coDiv;
    params["type"] = mType;
    params["idx"] = mIdx;

    mAjax(sUrl, params, "POST", true, function(data) {
      if(data.resultCode == "0000") {
        var rows = data.rows;
        re_rows = rows;

        $("#replyContainer").empty();

        if(rows.length == 0) return;

        $("#replyContainer").append("<p class='joinTitle'></p>");

        var template = "";
        template += " <li> ";
        template += " 	<p class='data'>이름 : {0}</p> ";
        template += " 	<p class='data'>등록일자 : {1}</p> ";
        template += " 	<p class='text' id='Memo_57'> ";
        template += " 		{2} ";
        template += " 	</p> ";
        template += " 	<div class='editBtn' id='MemoBtn_57'> ";
        template += " 	</div>	";
        template += " 	<div class='editBtn' id='MemoEditFormBtn_57' {3}> ";
        template += "			<a href='javascript:doDeleteReply({4})' id='EditCanTxt_57'>X</a> ";
        template += "		</div> ";
        template += " </li> ";

        for(i=0; i<rows.length; i++) {
          var datetime = rows[i].INPUT_DATETIME;
          var writer = rows[i].WRITER_NAME;
          var staff = rows[i].INPUT_STAFF;
          var content = rows[i].CONTENT;
          content = replaceAll(content, "\n", "<br>");
          $("#replyContainer").append(String.format(template
              , writer
              , datetime
              , content
              , ("<%=session.getAttribute("ms_num")%>" == staff ? "" : "hidden")
              , i
          ));
        }
      } else {
        alert(data.resultMessage);
      }
    });
  }

  function doDeleteReply(i) {
    var sUrl = "/controller/BoardController";
    var params = {};

    params["method"] = "doDeleteReply";
    params["coDiv"] = globals.coDiv;
    params["type"] = mType;
    params["idx"] = mIdx;
    params["seq"] = re_rows[i].SEQ;

    mAjax(sUrl, params, "POST", true, function(data) {
      if(data.resultCode == "0000") {
        alert("댓글이 삭제되었습니다.");
        doSearchReply();
      } else {
        alert(data.resultMessage);
      }
    });
  }

  function doDelete() {
    var sUrl = "/controller/BoardController";
    var params = {};

    params["method"] = "doDelete";
    params["coDiv"] = globals.coDiv;
    params["type"] = mType;
    params["idx"] = mIdx;

    mAjax(sUrl, params, "POST", true, function(data) {
      if(data.resultCode == "0000") {
        alert("게시글이 삭제되었습니다.");
        location.href = "/reservation/joinList";
      } else {
        alert(data.resultMessage);
      }
    });
  }

  function doUpdate() {
    location.href = "/reservation/joinWrite?action=U&idx=" + mIdx;
  }

  function writeReply() {
    var sUrl = "/controller/BoardController";
    var params = {};

    params["method"] = "writeReply";
    params["coDiv"] = globals.coDiv;
    params["type"] = mType;
    params["idx"] = mIdx;
    params["content"] = $("#txtReContent").val();

    mAjax(sUrl, params, "POST", true, function(data) {
      if(data.resultCode == "0000") {
        alert("댓글이 등록되었습니다.");
        doSearchReply();
      } else {
        alert(data.resultMessage);
      }
    });
  }

</script>
<div class="middleBg zoomImg">
</div>
<ul class="mainMenuTitle text-focus-in">
    <li class="big">Reservation</li>
    <li>인터넷예약</li>
</ul>

<!-- 컨텐츠 시작 -->
<div id="wrap">
    <div class="navbarWrap">
        <ul class="navbarBox">
            <li class="" onclick="location.href='/board/list'">공지사항</li>
            <li class="" onclick="location.href='/board/event'">이벤트</li>
            <li class="" onclick="location.href='/board/list'">보도자료</li>
            <li class="" onclick="location.href='/board/list'">자료실</li>
            <li class="" onclick="location.href='/board/Honor'">홀인원</li>
            <li class="on" onclick="location.href='/reservation/joinList'">조인게시판</li>

            <li class="homeBox"><img src="/static/images/home.jpg" alt="">&nbsp; 정보마당 &nbsp;<img src="/static/images/mini_arw.jpg" alt="">&nbsp; 조인게시판</li>
        </ul>
    </div>
    <div class="contents">
        <div class="joinChoice">
            <p>포도CC 및 조인/초대와 관련되지 않은 글 <span class="bold">(비방, 협오, 부킹광고, 기타 조인/초대와 관련되지 않은 글)</span>은<br>
                작성자의 동의없이 임의 삭제될 수 있습니다.</p>
        </div>

        <h2 class="commonTitle"> 조인게시판 내용</h2>

        <table class="joinViewTable">
            <tbody>
            <tr>
                <th>제목</th>
                <td class="title" id="txtTitle"></td>
                <th>작성자</th>
                <td id="txtWriter"></td>
            </tr>
            <tr>
                <th>작성일자</th>
                <td id="txtDate"></td>
                <th>조회수</th>
                <td id="txtViewCnt"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td class="bContents" colspan="3">
                    <div class="joinContentBox">
                        <p class="joinInfo" id="txtBkInfo"></p>
                        <hr>
                        <p class="joinCont" id="txtContent"></p>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="padding5"></div>

        <div class="btnBox">
            <a href="/reservation/joinList" class="cancel">목록</a>
            <a href="javascript:doUpdate()" id="btnAdminAction1" class="motion" hidden>수정</a>
            <a href="javascript:doDelete()" id="btnAdminAction2" class="cancel" hidden>삭제</a>
        </div>

        <div class="padding15"></div>

        <div class="comment">
            <div class="commentInner">
                <textarea name="body_memo" id="txtReContent" cols="30" rows="10" placeholder="댓글을 입력해 주세요." style="width:90%; height:100px; resize:none;"></textarea>
                <a href="javascript:writeReply()" class="miniBtn">등록</a>
            </div>
        </div>

        <ul class="listComment" id="replyContainer">
        </ul>


        <div class="padding5"></div>

        <!--<div class="btnBox">
            <a href="javascript:writeReply()" class="motion">신청글 등록</a>
        </div>-->

        <div class="padding15"></div>
    </div><!-- contents End-->

</div>	<!-- wrap End -->
<%@ include file="../include/footer.jsp" %>
