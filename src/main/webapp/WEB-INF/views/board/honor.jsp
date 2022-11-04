<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%--<%--%>
<%--    int intPageSize, intPageNum; //페이지사이즈, 현재페이지번호--%>
<%--    int intRecordCount, intPageCount; //레코드수, 페이지수--%>
<%--    String strColumn, strSearchString;  //검색문자열--%>
<%--    int totalpage;--%>
<%--    int intBlockPage;--%>

<%--    //페이지사이즈 셋팅--%>
<%--    intPageSize = 10;--%>
<%--    //페이지블럭 셋팅--%>
<%--    intBlockPage = 10;--%>

<%--    //현재페이지 설정--%>
<%--    if (request.getParameter("PageNum").trim().isEmpty()){--%>
<%--        intPageNum = Integer.parseInt(request.getParameter("PageNum"));--%>
<%--    } else {--%>
<%--        intPageNum = 1;--%>
<%--    };--%>

<%--    int intReplyWidth;--%>
<%--    int intTemp, intLoop;--%>

<%--    //페이지블럭 셋팅--%>
<%--    intBlockPage = 10;--%>

<%--    //달력 계산을 위한 현재 날짜--%>
<%--//    strSql = "select DATE_FORMAT(NOW(),'%Y%m%d') NOWDATE, DATE_FORMAT(NOW(),'%W') NOWDAY, DATE_FORMAT(NOW(),'%H') NOWHOUR from dual "--%>
<%--//--%>
<%--//    adoRs.Open strSql, adoDBconn, adOpenKeyset, adLockReadOnly--%>
<%--//--%>
<%--//    s_date = CStr(adoRs("NOWDATE"))				'연월일(YYYYMMDD)--%>
<%--//--%>
<%--//    adoRs.Close--%>
<%--//--%>
<%--//    '페이지 Count--%>
<%--//    strSql = ""--%>
<%--//    strSql = strSql & "SELECT COUNT(holl_msname) "--%>
<%--//    strSql = strSql & "FROM ms_hollhist "--%>
<%--//    strSql = strSql & "WHERE co_div = '501' "--%>
<%--//    strSql = strSql & "ORDER BY holl_day DESC, HOLL_SEQ  "--%>
<%--//    adoRs.Open strSql, adoDBConn, adOpenKeyset, adLockReadOnly--%>
<%--//    intRecordCount = adoRs(0)--%>
<%--//    intPageCount = CLng((CLng(intRecordCount) - 1) \ CLng(intPageSize)) + 1--%>
<%--//    adoRs.Close--%>
<%--//--%>
<%--//    'List Select--%>
<%--//    strSql = ""--%>
<%--//    strSql = strSql & "SELECT HOLL_DAY, HOLL_MSNAME, HOLL_COS, HOLL_TIME, HOLL_NO, HOLL_BALL, HOLL_CLUB, HOLL_DIV, CONCAT(HOLL_DONG1,' ',HOLL_DONG2,' ',HOLL_DONG3) HOLL_DONG   "--%>
<%--//    strSql = strSql & "FROM ms_hollhist "--%>
<%--//    strSql = strSql & "WHERE co_div = '501' "--%>
<%--//    strSql = strSql & "ORDER BY holl_day DESC, HOLL_SEQ  "--%>
<%--//--%>
<%--//    adoRs.Open strSql, adoDBConn, adOpenKeyset, adLockReadOnly--%>
<%--%>--%>
<div class="middleBg6 zoomImg">
</div>
<ul class="mainMenuTitle text-focus-in">
<li class="big">Infomation</li>
<li>정보마당</li>
</ul>


<!-- 컨텐츠 시작 -->
<div id="wrap">
    <div class="navbarWrap">
        <ul class="navbarBox">
            <li class="" onclick="location.href='/board/list?type=1'">공지사항</li>
            <li class="" onclick="location.href='/board/list?type=2'">이벤트</li>
            <li class="" onclick="location.href='/board/list?type=3'">보도자료</li>
            <li class="" onclick="location.href='/board/list?type=4'">자료실</li>
            <li class="on" onclick="location.href='/board/honor'">홀인원</li>
            <li class="" onclick="location.href='/reservation/joinList'">조인게시판</li>
            <li class="" onclick="location.href='/board/list?type=7'">명예의 전당</li>

            <li class="homeBox"><img src="/images/home.jpg" alt="">&nbsp; 정보마당 &nbsp;<img src="/images/mini_arw.jpg" alt="">&nbsp; 공지사항</li>
        </ul>
    </div>
    <div class="contents">
        <div class="borderBox">
            <div class="serching">
                <ul>
                    <li>
                        <select name="Column" id="selSearchOption" class="select-arrow">
                            <option value="title" selected="">제목</option>
                            <option value="content">내용</option>
                            <option value="writer">작성자</option>
                        </select>
                    </li>
                    <li>
                        <input type="text" name="SearchString" id="txtSearchText" class="inputSerch" value="" title="검색할 내용">
                    </li>
                    <li><a href="javascript:doSearch()" class="darkGrayBtn serchBtn">검색</a></li>
                </ul>
                <div class="padding10"></div>
                <table class="commonTable">
                    <colgroup>
                        <col width="11%">
                        <col width="10%">
                        <col width="12%">
                        <col width="13%">
                        <col width="54%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="col">일자</th>
                        <th scope="col">성명</th>
                        <th scope="col">구분</th>
                        <th scope="col">홀</th>
                        <th scope="col">사용클럽/볼</th>
                        <!--<th scope="col">동반자</th>-->
                    </tr>
<%--                    <%--%>
<%--                        If adoRs.BOF And adoRs.EOF Then--%>
<%--                    %>--%>
                    <tr><td colspan="5" class="empty">내역이 존재하지 않습니다.</td></tr>
<%--                    <%--%>
<%--                        Else--%>
<%--                        totalpage = adoRS.pagecount--%>
<%--                        adoRS.absolutepage = intPageNum--%>

<%--                        i = 1--%>
<%--                        Do Until adoRs.EOF or i > adoRS.Pagesize--%>

<%--                        For j = 1 To Len(adoRs("HOLL_MSNAME"))-2--%>
<%--                        starStr = starStr & "*"--%>
<%--                        Next--%>
<%--                        starName = Left(adoRs("HOLL_MSNAME"),1)&starStr&Right(adoRs("HOLL_MSNAME"),1)--%>
<%--                        starStr = ""--%>
<%--                    %>--%>

<%--                    <tr>--%>
<%--                        <td><%=Mid(adoRs("HOLL_DAY"),1,4)%>.<%=Mid(adoRs("HOLL_DAY"),5,2)%>.<%=Mid(adoRs("HOLL_DAY"),7,2)%> </td>--%>
<%--                        <td><%=starName%></td>--%>
<%--                        <td><%If adoRs("HOLL_DIV") = "01" then%>알바트로스<%ElseIf adoRs("HOLL_DIV") = "02" Then%>홀인원<%ElseIf adoRs("HOLL_DIV") = "03" Then%>이글<%End If%></td>--%>
<%--                        <td><%=adoRs("HOLL_NO")%>홀</td>--%>
<%--                        <td><%=adoRs("HOLL_CLUB")%> / <%=adoRs("HOLL_BALL")%></td>--%>
<%--                        <!--<td><%=adoRs("HOLL_DONG")%></td>-->--%>
<%--                    </tr>--%>
<%--                    <%--%>
<%--                        adoRs.MoveNext--%>
<%--                        i = i + 1--%>
<%--                        Loop--%>
<%--                        End If--%>
<%--                        adoRs.Close--%>
<%--                    %>--%>
                    </tbody>
                </table>
                <div class="padding10"></div>
                <div class="pageNum">
                    <div class="pageNumWrap">
<%--                        <%--%>
<%--                            intTemp = Int(Int((intPageNum - 1) / intBlockPage)  * intBlockPage) + 1--%>

<%--                            If Cint(intTemp) = 1 Then--%>
<%--                        %>--%>
<%--                        <a href='#' class='pagebtn'>◀</a>--%>
<%--                        <%--%>
<%--                            Else--%>
<%--                        %>--%>
<%--                        <a href='honor?PageNum=<%=CLng(intTemp) - CInt(intBlockPage)%>'>◀</a>--%>
<%--                        <%--%>
<%--                            End If--%>

<%--                            intLoop = 1--%>

<%--                            Do Until Cint(intLoop) > Cint(intBlockPage) Or Cint(intTemp) > Cint(intPageCount)--%>
<%--                            If Cint(intTemp) = CInt(intPageNum) Then--%>
<%--                        %>--%>
<%--                        <a href='#'><%=intTemp%></a>--%>
<%--                        <%--%>
<%--                            Else--%>
<%--                        %>--%>
<%--                        <a href='honor?PageNum=<%=intTemp%>'><%=intTemp%></a>--%>
<%--                        <%--%>
<%--                            End If--%>
<%--                            intTemp = Cint(intTemp) + 1--%>
<%--                            intLoop = Cint(intLoop) + 1--%>
<%--                            Loop--%>

<%--                            If Cint(intTemp) > Cint(intPageCount) Then--%>
<%--                        %>--%>
<%--                        <a href='#' class='pagebtn'>▶</a>--%>
<%--                        <%--%>
<%--                            Else--%>
<%--                        %>--%>
<%--                        <a href='honor?PageNum=<%=intTemp%>' class='pagebtn'>▶</a>--%>
<%--                        <%--%>
<%--                            End If--%>
<%--                        %>--%>
                    </div>
                </div>

            </div>
        </div>
    </div><!-- contents End-->

</div>	<!-- wrap End -->
<%@ include file="../include/footer.jsp" %>