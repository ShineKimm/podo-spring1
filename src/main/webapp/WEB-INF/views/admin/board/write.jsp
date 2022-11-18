<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>

  var mFlag;
  var mType;
  var mIdx;

  var title = {
    "1" : "공지사항",
    "2" : "이벤트",
    "3" : "보도자료",
    "4" : "자료실",
    "5" : "코스갤러리",
    "7" : "명예의 전당"
  }

  $(document).ready(function() {
    init();

    initListener();
  });

  function init() {
    mType = "<%=request.getParameter("type")%>";
    mIdx = "<%=request.getParameter("idx")%>";
    mFlag = "<%=request.getParameter("action")%>";

    $("#txtSubject").html(title[mType]);

    initTabMenu();

    if(mFlag == "I") {
      $("#btnAction").html("등록하기");
      mSeq = "1";
    } else if(mFlag == "U") {
      $("#btnAction").html("수정하기");
      doSearchDetail();
    }

    if(mType == 2 || mType == 5) {
      $("#fileContainer3").show();
    }
    if(mType ==7){
      $("#fileContainer1").hide();
      $("#fileContainer2").hide();
      $("#fileContainer3").show();
      $(".imgFile").hide();
    }
    else{
      $(".vFile").hide();
    }
  }

  function initListener() {
    $('#fileUpload1').change(function (event) {
      var fileValue = $("#fileUpload1").val().split("\\");
      var fileName = fileValue[fileValue.length-1];

      $("#txtFileName1").val(fileName);
    });

    $('#fileUpload2').change(function () {
      var fileValue = $("#fileUpload2").val().split("\\");
      var fileName = fileValue[fileValue.length-1];

      $("#txtFileName2").val(fileName);
    });

    $('#fileUpload3').change(function () {
      var fileValue = $("#fileUpload3").val().split("\\");
      var fileName = fileValue[fileValue.length-1];

      if(fileName.substr(-3)!="mp4"){
        alert("mp4형식의 파일만 올려주세요");
        $("#txtFileName3").val("");
        $(this).val('');
        return false;
      }
      if (this.files && this.files[0]) {

        var maxSize = 900* 1024 * 1024;
        var fileSize = this.files[0].size;

        if(fileSize > maxSize){
          alert("첨부파일 사이즈는 900MB 이내로 등록 가능합니다.");
          $("#txtFileName3").val("");
          $(this).val('');
          return false;
        }
      }
      $("#txtFileName3").val(fileName);
    });
  }

  function initTabMenu() {
    $("#tabContainer").children("a").each(function(index, element) {
      if(element.id == "tab" + mType) {
        $("#" + element.id).addClass("on");
      } else {
        $("#" + element.id).removeClass("on");
      }
    });
  }

  function doSearchDetail() {
    var sUrl = "/getBoardDetail";
    var params = {};

    //params["method"] = "getBoardDetail";
    params["coDiv"] = globals.coDiv;
    params["type"] = mType;
    params["idx"] = mIdx;

    mAjax(sUrl, params, "POST", true, function(data) {
      if(data.resultCode == "0000") {
        rows = data.rows;
        var tbody = $("#tbody");
        tbody.empty();

        var title = rows[0].TITLE;
        var content = rows[0].CONTENT;
        var link = rows[0].LINK;
        var boardDiv = rows[0].BOARD_DIV;
        var fileName1 = rows[0].ORIGIN_FILE_NAME1;
        var fileName2 = rows[0].ORIGIN_FILE_NAME2;
        var fileName3 = rows[0].ORIGIN_FILE_NAME3;

        $("#txtTitle").val(title);
        $("#txtContent").val(content);
        $("#selBoardDiv").val(boardDiv);
        $("#txtLink").val(link);
        $("#txtFileName1").val(fileName1);
        $("#txtFileName2").val(fileName2);
        $("#txtFileName3").val(fileName3);
      } else {
        alert(data.resultMessage);
      }
    });
  }

  function writeBoard() {
    var sUrl = "/writeBoard";

    // $("#method").val("writeBoard");
    $("#coDiv").val(globals.coDiv);
    $("#flag").val(mFlag);
    $("#type").val(mType);
    $("#idx").val(mIdx);
    $("#timestamp").val(getTimeStamp());

    var title = $("#txtTitle").val();

    if(title == "") {
      alert("제목을 입력하세요.");
      return;
    }

    var formData = new FormData($("#fileForm")[0]);

    progressStart();

    mFileAjax(sUrl, formData, function(data) {
      progressStop();

      if(data.resultCode == "0000") {
        alert("작성한 글이 정상적으로 등록되었습니다.");

        location.href = "/admin/board/list?type=" + mType;
      } else {
        alert(data.resultMessage);
      }
    });
  }

</script>

<div id="wrap">
    <ul class="gnb">
        <div class="content">
            <li class=""><a href="/admin/index">HOME</a></li>
            <li class="on"><a href="/admin/board/list?type=1">게시판 관리</a></li>
            <li class=""><a href="/admin/contents/message">문구 관리</a></li>
        </div>
    </ul>

    <div class="content">
        <div class="adminTab" id="tabContainer">
            <a href="javascript:location.href='/admin/board/list?type=1'" id="tab1" class="on">공지사항</a>
            <a href="javascript:location.href='/admin/board/list?type=2'" id="tab2" class="">이벤트</a>
            <a href="javascript:location.href='/admin/board/list?type=3'" id="tab3" class="">보도자료</a>
            <a href="javascript:location.href='/admin/board/list?type=4'" id="tab4" class="">자료실</a>
            <a href="javascript:location.href='/admin/board/list?type=5'" id="tab5" class="">코스갤러리</a>
            <a href="javascript:location.href='/admin/board/list?type=7'" id="tab7" class="">명예의 전당</a>
        </div>

        <div class="cate_title" id="txtSubject"></div>

        <div id="contentsWrap">
            <!-- 컨텐츠 시작 -->
            <div class="start"> <br>
                <div class="pop">
                    <form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="게시물 등록">
                            <caption>
                                게시물 등록
                            </caption>
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="txtTitle" id="txtTitle" placeholder="제목을 입력해주세요." class="popinput1"/></td>
                            </tr>
                            <tr id="linkContainer" hidden>
                                <th>링크</th>
                                <td><input type="text" name="link" id="txtLink" class="popinput1"/></td>
                            </tr>
                            <tr id="divContainer" hidden>
                                <th>구분</th>
                                <td>
                                    <select type="text" name="boardDiv" id="selBoardDiv" class="popinput3">
                                        <option value="1">예약관련</option>
                                        <option value="2">이용관련</option>
                                        <option value="3">호텔관련</option>
                                        <option value="4">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr id="fileContainer1">
                                <th>첨부파일1</th>
                                <td>
                                    <input type="text" id="txtFileName1" class="popinput3" readonly></label>
                                    <label for="fileUpload1" class="btn_file">이미지찾기</label>
                                    <input type="file" name="fileUpload1" id="fileUpload1">
                                </td>
                            </tr>
                            <tr id="fileContainer2">
                                <th>첨부파일2</th>
                                <td>
                                    <input type="text" id="txtFileName2" class="popinput3" readonly></label>
                                    <label for="fileUpload2" class="btn_file">이미지찾기</label>
                                    <input type="file" name="fileUpload2" id="fileUpload2">
                                </td>
                            </tr>
                            <tr id="fileContainer3" hidden>
                                <th>미리보기</th>
                                <td>
                                    <input type="text" id="txtFileName3" class="popinput3" readonly></label>
                                    <label for="fileUpload3" class="btn_file imgFile">이미지찾기</label>
                                    <label for="fileUpload3" class="btn_file vFile">mp4/avi찾기</label>
                                    <input type="file" name="fileUpload3" id="fileUpload3">
                                </td>
                            </tr>
                            <tr id="contentContainer">
                                <td colspan="2" class="poppadding">
                                    <textarea class="poptextarea" name="txtContent" id="txtContent"></textarea>
                                </td>
                            </tr>
                        </table>

                        <input type="hidden" id="method" name="method" />
                        <input type="hidden" id="coDiv" name="coDiv" />
                        <input type="hidden" id="type" name="type" />
                        <input type="hidden" id="idx" name="idx" />
                        <input type="hidden" id="flag" name="flag" />
                        <input type="hidden" id="timestamp" name="timestamp" />
                    </form>
                </div>
                <ul class="choice">
                    <li><a href="javascript:writeBoard()"><span class="bigbtn" id="btnAction"></span></a></li>
                    <li><a href="javascript:history.back()"><span class="bigbtn">취소하기</span></a></li>
                </ul>
                <div class="clear"></div>
                <br>
                <br>
            </div>
        </div>

    </div>
</div>
<%@ include file="../include/footer.jsp" %>