<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
  /** 갤러리
  ===================================*/
  .bx-wrapper2 {
    position: relative;
    margin-bottom: 60px;
    padding: 0;
    *zoom: 1;
    -ms-touch-action: pan-y;
    touch-action: pan-y;
  }
  .bx-wrapper2 img {
    max-width: 100%;
    display: block;
  }
  .bxslider {
    margin: 0;
    padding: 0;
  }
  ul.bxslider {
    list-style: none;
  }
  .bx-viewport {
    -webkit-transform: translatez(0);
  }
  /** THEME
  ===================================*/
  .bx-wrapper2 {}
  .bx-wrapper2 .bx-pager,
  .bx-wrapper2 .bx-controls-auto {
    position: absolute;
    bottom: -70px;
    width: 100%;
  }
  /* PAGER */
  .bx-wrapper2 .bx-pager {
    text-align: center;
    padding-top: 20px;
  }
  .bx-wrapper2 .bx-pager.bx-default-pager a {
    background: #666;
    text-indent: -9999px;
    display: block;
    width: 14px;
    height: 14px;
    margin: 0 5px;
    outline: 0;
  }
  .bx-wrapper2 .bx-pager.bx-default-pager a:hover,
  .bx-wrapper2 .bx-pager.bx-default-pager a.active,
  .bx-wrapper2 .bx-pager.bx-default-pager a:focus {
    background: #000;
  }
  .bx-wrapper2 .bx-pager-item,
  .bx-wrapper2 .bx-controls-auto .bx-controls-auto-item {
    display: inline-block;
    vertical-align: bottom;
    *zoom: 1;
    *display: inline;
  }
  .bx-wrapper2 .bx-pager-item {
    font-size: 0;
    line-height: 0;
  }
  /* DIRECTION CONTROLS (NEXT / PREV) */
  .bx-wrapper2 .bx-prev:hover,
  .bx-wrapper2 .bx-prev:focus {
    background-position: 0 0;
  }
  .bx-wrapper2 .bx-prev {
    left:30px;
    background:url(/static/images/controls_arw2L.png) no-repeat;
  }
  .bx-wrapper2 .bx-next {
    right:30px;
    background:url(/static/images/controls_arw2R.png) no-repeat;
  }
  .bx-wrapper2 .bx-controls-direction a {
    position: absolute;
    top: 50%;
    margin-top: -50px;
    outline: 0;
    width: 49px;
    height: 96px;
    text-indent: -9999px;
    z-index: 38;
  }
  .bx-wrapper2 .bx-controls-direction a.disabled {
    display: none;
  }
</style>
<div class="middleBg5 zoomImg">
</div>
<ul class="mainMenuTitle text-focus-in">
    <li class="big">Facility description</li>
    <li>시설안내</li>
</ul>

<!-- 컨텐츠 시작 -->
<div id="wrap">
    <div class="navbarWrap">
        <ul class="navbarBox">
            <li class="" onclick="location.href='/fac/fac01'">클럽하우스</li>
            <li class="on" onclick="location.href='/fac/fac02'">레스토랑</li>
            <li class="" onclick="location.href='/fac/fac03'">프로샵</li>
            <li class="" onclick="location.href='/fac/fac04'">락카</li>

            <li class="homeBox"><img src="/static/images/home.jpg" alt="">&nbsp; 시설안내 &nbsp;<img src="/static/images/mini_arw.jpg" alt="">&nbsp; 레스토랑</li>
        </ul>
    </div>
    <div class="contents">
        <ul class="facTitleBox">
            <li class="bigTt">회원님을 위한 품격있는 서비스를 제공하는, </li>
            <li class="bigTt2 bold">포도CC 레스토랑</li>
        </ul>
        <div class="padding20"></div>

        <div class="guideTxt">
            <p class="bold title2">PodoCC Restaurant</p>
            <p class="bold title">최고의 맛과 최상의 서비스로 귀하를 모시겠습니다.</p>
            <div class="padding5"></div>
            최고급 요리사들이 정성들여 선보이는 맛깔스런 요리와 탁 트인 그린 조망을 감상하며, 수준높은 맛을 즐기시기 바랍니다. <br>
            또한 조용하고 아늑한 분위기의 단체실은 소규모 모임이나 비즈니스 파트너와 미팅을 위한 장소로서 모던하고 깔끔한 환경을 제공하고 있습니다.
        </div>

        <ul class="facTab">
            <li class="" onclick="location.href='/fac/fac01'">클럽하우스</li>
            <li class="on" onclick="location.href='/fac/fac02'">레스토랑</li>
            <li class="" onclick="location.href='/fac/fac03'">프로샵</li>
            <li class="" onclick="location.href='/fac/fac04'">락카</li>
        </ul>


        <div class="facSlide">
            <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
            <div class="bx-wrapper2">
                <ul class="slider2">
                    <li><img src="/static/images/R_01.jpg" title="식당"></li>
                    <li><img src="/static/images/R_02.jpg" title="식당"></li>
                    <li><img src="/static/images/R_03.jpg" title="식당"></li>
                    <li><img src="/static/images/R_04.jpg" title="식당"></li>
                    <li><img src="/static/images/R_05.jpg" title="식당"></li>
                    <li><img src="/static/images/R_06.jpg" title="식당"></li>
                </ul>

                <script>
                  $('.slider2').bxSlider({
                    mode:'fade',
                    speed : 300,
                    pause : 6000,
                    auto: true,
                    captions: false,
                    autoHover: false,
                    touchEnabled: false,
                    slideWidth: 1200,
                    pager: false
                  });
                </script>
            </div>
        </div>



    </div><!-- contents End-->

</div>	<!-- wrap End -->
<%@ include file="../include/footer.jsp" %>