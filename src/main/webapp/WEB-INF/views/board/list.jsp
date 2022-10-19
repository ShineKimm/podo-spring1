<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="user-scalable=yes, initial-scale=0.3, maximum-scale=1.0, minimum-scale=0.1, width=device-width" />
    <meta name="title" content="">
    <meta name="author" content="포도CC">
    <meta name="Keywords" content="포도CC, 포도 컨트리클럽, ">
    <meta name="description" content="포도CC, 포도 컨트리클럽, ">
    <meta name="copyright" content="All Contents Copyright©pineBeach">
    <meta name="format-detection" content="telephone=no, address=no, email=no"/>
    <meta property="og:type" content="mobile">
    <meta property="og:title" content="포도CC, 포도 컨트리클럽">
    <meta property="og:description" content="포도CC, 포도 컨트리클럽">
    <meta property="og:url" content="">
    <title>포도 컨트리클럽</title>
    <link rel="stylesheet" type="text/css" href="/css/import.css">
    <link rel="stylesheet" type="text/css" href="/css/content.css?v=2">

    <link rel="stylesheet" type="text/css" href="/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/css/slick-theme.css"/>

    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>


    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script src="/js/jquery.preloaders.js"></script>
    <script src="/js/tools.js"></script>
    <script src="/js/globals.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/motion.css">
    <link rel="stylesheet" type="text/css" href="/css/animate.css">
    <script src="/js/wow.js"></script>
    <script type="text/javascript">
      /* 컨텐츠 fade in */
      wow = new WOW(
          {
            boxClass: 'fadeBox',
            animateClass: 'animated',
            offset: 100,
            callback: function(box) {
              //console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
            }
          });
      wow.init();
      /*//컨텐츠 fade in */

      $(document).ready(function() {
        //setProtocol();
        sessionCheck();
      });

      function doLogout() {
        var sUrl = "/controller/MemberController.asp";
        var params = {};

        params["method"] = "doLogout";

        mAjax(sUrl, params, "POST", true, function(data) {
          if(data.resultCode == "0000") {
            alert("로그아웃 되었습니다.");

            location.href = "/index.asp";
          }
        });
      }

      function setProtocol() {
        if (document.location.protocol == 'http:') {
          document.location.href = document.location.href.replace('http:', 'https:');
        }
      }

      function sessionCheck() {
        var sUrl = "/controller/SessionManager.asp";
        var params = {"method" : "sessionConfirm"};

        mAjax(sUrl, params, "POST", false, function(data) {
          if(data.resultCode == "2000") {
            alert(data.resultMessage);
            location.reload();
          }
        });
      }

      function deleteMember() {

        if("<%=Session("ms_num")%>" == "") {
          alert("로그인 후 이용 가능합니다.");
          location.href = "/members/login.asp";
          return;
        }

        var sUrl = "/controller/MemberController.asp";
        var params = {};

        params["method"] = "doDeleteMemeber";

        var con = confirm("회원님께서 확인 버튼을 누르면 탈퇴가 완료됩니다.\r\n그동안 포도CC를 이용해 주셔서 감사합니다..");
        if(con == true) {
          mAjax(sUrl, params, "POST", true, function(data) {
            if(data.resultCode == "0000") {
              alert("회원 탈퇴 되었습니다.");

              location.href = "/index.asp";
            }
          });
        }
      }


    </script>
    <!--textmotion-->
    <script src="js/ScrollTrigger.js"></script>
    <script>
      window.counter = function($) {
        // this refers to the html element with the data-scroll-showCallback tag
        var span = this.querySelector('span');
        var current = parseInt(span.textContent);

        span.textContent = current + 1;
      };

      document.addEventListener('DOMContentLoaded', function($){
        var trigger = new ScrollTrigger({
          addHeight: true
        });
      });
    </script>
    <!-- subTab Fixed js -->
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>

    <script src="/js/jquery.preloaders.js"></script>
    <script src="/js/tools.js"></script>
    <script src="/js/globals.js"></script>
</head>
<body>
<div class="siteAll"><div class="toggleMenu"><span></span></div></div>
<div id="header">
    <div class="subHeader">
        <a href="/index.asp" class="logoBox" id="logo"></a>
        <ul class="mainList">
            <li onclick="location.href='/reservation/reservation.asp'">인터넷예약</li>
            <li onclick="location.href='/guide/reserGuide.asp'">이용안내</li>
            <li onclick="location.href='/club/intro.asp'">클럽소개</li>
            <li onclick="location.href='/course/intro.asp'">코스소개</li>
            <li onclick="location.href='/fac/fac01.asp'">시설안내</li>
            <li onclick="location.href='/board/list.asp?type=1.asp'">정보마당</li>
        </ul>
        <!--#include virtual="/include/submenu.asp"-->

        <ul class="rightBtn">
            <li class="topJoin">
                <%If Session("MS_NUM") = "" Then%>
                <a href="https://www.serenitycc.co.kr" class="podo">세레니티</a>
                <a href="/member/login.asp" class="topLogin" id="login"></a>
                <%Else%>
                <a href="https://www.serenitycc.co.kr" class="podo">세레니티</a>
                <a href="/member/modify.asp" class="topLogin" id="login"></a>
                <%End If%>
            </li>
        </ul>
    </div>

    <div id="menu">
        <div class="main-nav">
            <img src="/images/logo.svg" alt="포도 로고" class="hambergerLogo">
            <ul class="menuTitleBox">
                <li><a href="/reservation/reservation.asp" class="title">인터넷예약</a></li>
                <li><a href="/reservation/reservation.asp">실시간예약</a></li>
                <li><a href="/reservation/reserCheck.asp">예약확인/취소</a></li>
            </ul>
            <ul class="menuTitleBox">
                <li><a class="title" href="/guide/guide.asp">이용안내</a></li>
                <li><a href="/guide/reserGuide.asp">예약안내</a></li>
                <li><a href="/guide/fee.asp">이용요금</a></li>
                <li><a href="/guide/break.asp">위약안내</a></li>
                <li><a href="/guide/etiquette.asp">에티켓</a></li>
                <li><a href="/guide/inquiry.asp">예약/기타문의</a></li>
            </ul>
            <ul class="menuTitleBox">
                <li><a class="title" href="/club/intro.asp">클럽소개</a></li>
                <li><a href="/club/intro.asp">소개</a></li>
                <li><a href="/club/greeting.asp">인사말</a></li>
                <li><a href="/club/location.asp">오시는길</a></li>
            </ul>
            <ul class="menuTitleBox">
                <li><a class="title" href="/couse/intro.asp">코스소개</a></li>
                <li><a href="/course/intro.asp">코스소개</a></li>
                <!--<li><a href="/course/o1.asp">아웃코스</a></li>
                <li><a href="/course/i1.asp">인코스</a></li>-->
                <li><a href="/board/list.asp?type=5">코스갤러리</a></li>
            </ul>
            <ul class="menuTitleBox">
                <li><a class="title" href="/board/list.asp">시설안내</a></li>
                <li><a href="/fac/fac01.asp">클럽하우스</a></li>
                <li><a href="/fac/fac02.asp">레스토랑</a></li>
                <li><a href="/fac/fac03.asp">프로샵</a></li>
                <li><a href="/fac/fac04.asp">락카</a></li>
            </ul>
            <ul class="menuTitleBox">
                <li><a class="title" href="/board/list.asp?type=1">정보마당</a></li>
                <li><a href="/board/list.asp?type=1">공지사항</a></li>
                <li><a href="/board/list.asp?type=2">이벤트</a></li>
                <li><a href="/board/list.asp?type=3">보도자료</a></li>
                <li><a href="/board/list.asp?type=4">자료실</a></li>
                <li><a href="/board/Honor.asp">홀인원</a></li>
                <li><a href="/reservation/joinList.asp">조인게시판</a></li>
                <li><a href="/board/list.asp?type=7">명예의 전당</a></li>

            </ul>
        </div>
    </div>

