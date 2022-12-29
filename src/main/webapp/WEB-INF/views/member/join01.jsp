<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>

  $(document).ready(function() {
    init();
  });

  function init() {
    if(<%=session.getAttribute ("MS_NUM") != null %>) {
      location.href = "/index";
    }
  }

  function doNextStep(div) {
    for(i=1; i<=2; i++) {
      if($(String.format("input[name='chkAgree{0}']:checked", i)).val() != "Y") {
        alert("약관에 동의 후 진행하시기 바랍니다.");
        return;
      }
    }
    document.agreeChk.submit();
  }

  function onChangeAllAgree() {
    let val = $("input:checkbox[id='chkAgreeAll']").is(":checked") ? "Y" : "N";

    for(i=1; i<=5; i++) {
      $("input:radio[name=chkAgree" + i + "]:input[value=" + val + "]").prop("checked", true).change();
    }
  }
</script>
<div class="middleBg6 zoomImg">
</div>
<ul class="mainMenuTitle text-focus-in">
    <li class="big">Join Membership</li>
    <li>회원가입</li>
</ul>

<!-- 컨텐츠 시작 -->
<div id="wrap">
    <div class="navbarWrap">
        <ul class="navbarBox">
            <li class="" onclick="location.href='/member/login'">로그인</li>
            <li class="on" onclick="location.href='/member/join01'">회원가입</li>
            <li class="" onclick="location.href='/member/find'">아이디/비번찾기</li>
            <li class="homeBox"><img src="/static/images/home.jpg" alt="">&nbsp; 회원가입 &nbsp;<img src="/static/images/mini_arw.jpg" alt="">&nbsp; 회원가입</li>
        </ul>
    </div>
    <div class="contents">
        <div class="joinStep">
            <ul>
                <li class="on">STEP1 회원약관동의
                    <div class="tri on"></div>
                </li>
                <li class="">STEP2 회원정보입력
                    <div class="tri"></div>
                </li>
                <li class="">STEP3 회원가입완료
                    <div class="tri"></div>
                </li>
            </ul>
        </div>

        <div class="joinBox">
            <form name="agreeChk" method="post" action="/member/join03">

                <h2 class="commonDot"> 포도 컨트리클럽 골프클럽 이용약관 동의(필수)</h2>

                <div class="textarea">
                    1.제 1 조 목적

                    본 약관은 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 의하여 김천포도컨트리클럽 (이하 '회사'라 합니다)가 제공하는 www.podocc.com의 인터넷 서비스(이하 '서비스'라 합니다)의 이용 조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.
                    2. 제 2 조 정의

                    이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

                    (1) 사이트란 회사가 컴퓨터 등 정보통신설비를 이용하여 상품이나 서비스를 이용자에게 제공할 수 있도록 설정한 가상공간을 말하며, 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다.
                    (2) 이용자란 사이트에 접속하여 이 약관에 따라 사이트가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                    (3) 회원이라 함은 만 19세 이상으로, 사이트에 개인정보를 제공하여 회원등록을 한 자로서, 사이트의 정보를 지속적으로 제공받으며, 사이트가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
                    (4) 비회원이라 함은 회원에 가입하지 않고 사이트가 제공하는 서비스를 이용하는 자를 말합니다.

                    3. 제 3 조 약관의 효력 및 변경

                    (1) 사이트란 회사가 컴퓨터 등 정보통신설비를 이용하여 상품이나 서비스를 이용자에게 제공할 수 있도록 설정한 가상공간을 말하며, 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다.
                    (2) 이용자란 사이트에 접속하여 이 약관에 따라 사이트가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                    (3) 회원이라 함은 만 19세 이상으로, 사이트에 개인정보를 제공하여 회원등록을 한 자로서, 사이트의 정보를 지속적으로 제공받으며, 사이트가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
                    (4) 비회원이라 함은 회원에 가입하지 않고 사이트가 제공하는 서비스를 이용하는 자를 말합니다.
                    4. 제 4 조 약관 외 준칙

                    (1) 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 공정거래법 등 관계법령 및 회사가 제공하는 서비스에 관한 별도의 약관,이용규정 또는 세칙과 함께 적용됩니다.
                    (2) 회사와 회원간의 상업적인 계약과 관련하여 본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령, 또는 상관례 등에 따릅니다.
                    5. 제 5 조 이용 계약의 성립

                    (1) 이용자는 회사가 정한 양식에 따라 회원정보를 기입한 후 본 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청하며, 이용 신청 시 "위의 이용약관에 동의하십니까?"라는 물음에 "동의" 버튼을 누르면 본 약관에 대해 동의 의사표시를 한 것으로 간주합니다.
                    (2) 회원에 가입하여 서비스를 이용하고자 하는 희망자는 당사에서 요청하는 개인신상정보를 제공해야 합니다.
                    6. 제 6 조 이용 신청의 승낙과 제한

                    (1) 회사는 제 5조에 따른 이용신청에 대하여 특별한 사정이 없는 한 접수 순서에 따라서 이용 신청을 승낙합니다. 다만 다음 각 호의 해당하는 경우 이용신청에 대한 승낙을 제한할 수 있고, 그 사유가 해소될 때까지 승낙을 유보할 수 있습니다.
                    ① 서비스 관련 설비의 용량이 부족한 경우
                    ② 기술상 장애 사유가 있는 경우
                    ③ 기타 회사가 필요하다고 인정되는 경우

                    (2) 회사는 다음 각 호에 해당하는 이용계약 신청에 대하여는 이를 승낙하지 않거나 사실 확인에 필요한 개인정보를 요구할 수 있으며, 사전 통지 없이 서비스 이용을 제한할 수 있습니다.
                    ① 사회의 안녕과 질서 혹은 미풍양속에 반하는 경우
                    ② 범죄행위에 관련되는 경우
                    ③ 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행 할 경우
                    ④ 본인의 실명으로 신청하지 않은 경우
                    ⑤ 다른 사람의 명의를 사용하여 신청한 경우
                    ⑥ 같은 이용자가 다른 ID로 이중등록을 한 경우
                    ⑦ 회사와 이용자 간에 위해를 가하는 등 건전한 이용을 저해하는 경우
                    ⑧ 이용 신청 시 필요 내용을 허위로 기재하여 신청한 경우
                    ⑨ 신용정보의 이용과 보호에 관한 법률에 의한 PC통신, 인터넷 서비스의 신용불량자로 등록되어 있는 경우
                    ⑩ 기타 관계 법령이나 회사가 정한 이용조건에 위배되는 경우
                    7. 제 7 조 계약 사항의 변경

                    회원은 이용신청 시 기재한 사항이 변경되었을 경우, 즉시 전자우편 또는 회사가 정한 별도의 정해진 양식 및 이용방법으로 변경사항을 알리고 수정해야 합니다.
                    8. 제 8 조 개인 보호 정책

                    (1) 회사는 서비스 제공과 관련하여 취득한 회원개인정보를 본인의 승낙 없이 제 3자에게 누설 또는 배포할 수 없으며 상업적 목적으로 사용할 수 없습니다. 다만, 다음 각 호에 해당하는 경우에는 그러하지 아니합니다.
                    ① 관계 법령에 의하여 수사상의 목적으로 관계기관으로부터 요구가 있는 경우
                    ② 정보통신윤리위원회의 요청이 있는 경우
                    ③ 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우

                    (2) 회사가 향후에 본 사이트 이외의 사이트와 제휴하게 될 경우 회원이 해당 제휴 사이트의 서비스 이용 동의를 하실 경우 제휴 사이트를 이용할 수 있으며 회원 정보가 회사가 새로 제휴한 사이트에 전달됩니다.
                    (3) 회사는 타 사이트와 제휴하게 될 경우 미리 제휴하게 될 사이트를 전자우편 또는 공지 화면 등으로 회원에게 공지합니다.
                    (4) 회원은 전자우편과 팩스로 회원 탈퇴 의사를 밝힐 수 있습니다.
                    (5) 회사는 업무 및 서비스와 관련하여 회원 전체 또는 일부의 개인정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다.
                    9. 제 9 조 회사의 의무

                    (1) 회사는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고 안정적으로 재화·용역을 제공하는 데 최선을 다해야 합니다.
                    (2) 회사는 이용자가 안전하게 서비스를 이용할 수 있도록 신용정보를 포함한 이용자의 개인정보보호를 위한 보안 시스템을 갖춰야 합니다.
                    (3) 회사가 재화·용역에 대하여 표시·광고의공정화에관한법률 제3조에 따라 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
                    (4) 회사는 이용자가 원하지 않을 경우 영리목적의 광고성 전자우편을 발송하지 않습니다.
                    (5) 회사는 관계법령이 정하는 바에 따라 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력하며, 회원의 개인정보 보호와 관련하여 "개인정보보호정책"을 별도로 수립, 공지합니다.
                    (6) 회사는 회원의 개인정보를 본인의 승낙 없이 타인 또는 제3자에게 누설하거나 배포·제공하지 않습니다. 단, 본 약관 제20조 제2항 및 다음의 경우는 그 예외로 합니다.
                    ① 회사의 "개인정보보호정책"에서 별도로 규정한 경우
                    ② 회원이 동의한 회사의 "개인정보의 수집, 제공 및 활용 동의서"에 별도로 명기한 제3자에게 제공하는 경우
                    ③ 회사가 서비스 이용계약의 이행 또는 제공에 따른 요금정산을 위해서 필요한 경우
                    ④ 정보통신망이용촉진및정보보호등에관한법률 또는 다른 관계법령에 특별한 규정이 있는 경우
                    (7) 회사는 서비스를 통하여 회원의 컴퓨터에 쿠키(cookie)를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저 설정을 변경할 수 있으며, 쿠키의 설정 변경에 의해 서비스 이용이 변경 되거나 불가능한 것은 회원의 책임입니다.
                    10. 제10조 회원(이용자)의 의무

                    (1) 회원은 이용신청 시에 요구되는 정보를 정확하게 기입해야 합니다. 또한 이미 제공된 회원에 대한 정보가 현재의 사실과 정확히 일치하는 정보가 되도록 유지·갱신해야 합니다. 만일 회원이 등록한 정보가 부정확한 경우 또는 회원이 본 조 제3항에 명시된 행위를 한 경우에 회사는 본 약관 제7조에 의해 회원의 서비스 이용을 제한 또는 정지할 수 있습니다.
                    (2) 이용자는 회사의 서비스 운영정책에 포함된 영업행위 이외에 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없으며 서비스를 이용하여 얻은 정보를 회사의 사전승낙 없이 복사·복제·변경·번역·출판·방송 등 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
                    (3) 이용자는 서비스 이용과 관련하여 본 약관을 준수해야 하며, 다음 각 호의 행위를 해서는 안됩니다.
                    ① 신청 또는 변경 시 허위 내용의 등록
                    ② 다른 회원의 ID 및 비밀번호를 도용하거나 부정하게 사용하는 행위
                    ③ 다른 회원 또는 제3자의 개인정보를 수집, 저장 또는 공개하는 행위
                    ④ 서비스를 통하여 전송된 내용의 출처 또는 전송자를 위장하는 행위
                    ⑤ 회사 또는 제3자의 저작권 등 지적재산권에 대한 침해
                    ⑥ 회사 또는 제3자의 명예를 손상시키거나 업무를 방해하는 행위
                    ⑦ 자신 또는 타인에게 재산상의 이익을 주거나 타인에게 손해를 가할 목적으로 정보를 유통 시키는 행위
                    ⑧ 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
                    ⑨ 서비스와 관련된 설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염 자료를 등록 또는 유포하는 행위
                    ⑩ 회사의 승인을 받지 아니한 상업적 목적의 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시·게재하거나 메일 또는 기타의 방법으로 전송하는 행위
                    ⑪ 외설 또는 폭력적인 정보·문장·도형·화상·음성 등 기타 공서양속에 반하는 정보를 사이트에 공개 또는 게시하는 행위
                    ⑫ 수치심이나 혐오감 또는 공포심을 일으키는 말이나 문장·도형·화상·음성 등을 계속하여 상대방에게 도달하게 하여 상대방의 일상적 생활을 방해하는 행위
                    ⑬ 기타 불법적이거나 부당한 행위
                    (4) 이용자는 관계법령, 이용안내 및 서비스상에 공지한 주의사항, 회사가 통지하는 사항 등을 준수해야 하며, 회사의 업무에 방해되는 행위를 해서는 안됩니다.
                    (5) 회원은 서비스의 이용권한 등 이용계약상의 지위를 타인에게 양도·증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
                    11. 제 11 조 서비스 이용시간

                    서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기 점검 등의 필요로 인하여 회사가 정한 날이나 시간은 그러지 아니합니다.
                    12. 제 12 조 회원의 게시물

                    회사는 회원이 게시하거나 등록하는 서비스 내의 내용물이 다음 각 항에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다.
                    (1) 타인을 비방하거나 중상모략으로 개인 및 단체의 명예를 손상시키는 내용인 경우
                    (2) 공공질서 및 미풍양속에 위반되는 내용인 경우
                    (3) 범죄적 행위에 결부된다고 인정되는 내용일 경우
                    (4) 회사의 저작권, 타인의 저작권 등 기타 권리를 침해하는 내용인 경우
                    (5) 회사에서 규정한 게시기간을 초과한 경우
                    (6) 상업성이 있는 게시물이나 돈벌이 광고, 행운의 편지 등을 게시하는 경우
                    (7) 기타 관계법령이나 회사가 정한 규정에 위배된다고 판단되는 경우
                    13. 제 13 조 게시물의 저작권

                    본 사이트의 모든 게시물에 대한 저작권은 사전에 당사자와의 명시적인 다른 합의가 없는 한 회사에 귀속됩니다.
                    14. 제 14 조 서비스의 제공

                    회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 전자우편이나 서신우편, 매체 광고, 웹사이트 등의 방법으로 회원에게 제공할 수 있습니다.
                    15. 제 15 조 서비스 제공의 중지

                    (1) 회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다.

                    ① 서비스용 관련 설비의 보수 점검 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우
                    ② 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우
                    ③ 기타 불가항력적 사유가 있는 경우
                    16. 제 16 조 계약 해지 및 서비스 이용 제한

                    당사는 이용자가 다음 사항에 해당하는 행위를 하였을 경우 사전 통지 없이 이용 계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있고 원활한 서비스의 제공을 위하여 이 정보를 6개월 간 보관할 수 있습니다.
                    (1) 공공 질서 및 미풍 양속에 반하는 경우
                    (2) 범죄적 행위에 관련되는 경우
                    (3) 이용자가 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우
                    (4) 가입한 이름이 실명이 아닌 경우
                    (5) 타인의 서비스 아이디 및 비밀 번호를 도용한 경우
                    (6) 타인의 명예를 손상시키거나 불이익을 주는 경우
                    (7) 같은 사용자가 다른 아이디로 이중 등록을 한 경우
                    (8) 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우
                    (9) 기타 관련법령이나 회사가 정한 이용조건에 위배되는 경우
                    (10) 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우
                    (11) 본 약관을 포함하여 기타 회사가 정한 이용 조건에 위반한 경우
                    17. 제 17 조 손해배상

                    회사는 서비스 요금이 무료인 동안의 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.
                    18. 제 18 조 면책조항

                    (1) 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
                    (2) 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
                    (3) 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
                    (4) 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
                    19. 제 19 조 저작권의 귀속

                    (1) 회사가 작성한 서비스에 관한 저작권 및 기타 지적재산권은 회사에 귀속합니다.
                    (2) 회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나, 제 3자에게 이용하게 하여서는 안됩니다.
                    20. 제 20 조 분쟁

                    사이트와 이용자간은 개인정보에 관한 분쟁이 있는 경우 신속하고 효과적인 분쟁 해결을 위하여 한국정보보호센터 내의 개인정보분쟁조정위원회에 그 처리를 의뢰할 수 있으며 소송이 제기될 경우 민사소송법상의 관할법원에 제기합니다.
                    21. [부칙]

                    (시행일) 이 약관은 2019년 11월 20일부터 시행합니다.
                    22. [추가정보]

                    김천포도컨트리클럽의 홈페이지 이용약관에 관한 관리부서는 경영지원팀이며, 연락처는 다음과 같습니다.
                    관리부서: 경영지원부
                    관리담당자: 박영일 본부장
                    전화: 054-420-0230
                    이메일: podocc2020@naver.com
                    본 정책의 내용에 관한 질문은 podocc2020@naver.com으로 하시기 바랍니다.
                </div>
                <h4><label><input type="radio" name="chkAgree1" value="Y"> 동의합니다.</label> <label><input type="radio" name="chkAgree1" value="N"> 동의하지 않습니다.</label></h4>
                <hr><div class="padding10"></div>

                <h2 class="commonDot"> 개인정보 수집 및 이용동의 (필수)</h2>

                <table border="0" cellpadding="0" cellspacing="0" class="joinViewTable">
                    <colgroup>
                        <col width="300px">
                        <col width="400px">
                        <col width="*">
                    </colgroup>
                    <thead>
                    <tr>
                        <th align="center">수집 및 이용목적</th>
                        <th align="center">수집하는 개인정보 항목</th>
                        <th align="center">보유 및 이용기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td align="center">이용자 식별 및 본인여부 확인</td>
                        <td align="center">아이디, 비밀번호, 성명, 생년월일 </td>
                        <td align="center">탈퇴 후 5일까지</td>
                    </tr>
                    <tr>
                        <td align="center">계약이행을 위한 연락민원등 고객고충처리
                            <br>
                            (골프장 예약,취소 확인 및 고객 관리등)
                        </td>
                        <td align="center">연락처(이메일, 휴대전화번호) </td>
                        <td align="center">탈퇴 후 5일까지</td>
                    </tr>
                    <tr>
                        <td align="center">만 14세 미만 아동인지 확인</td>
                        <td align="center">법정생년월일 </td>
                        <td align="center">탈퇴 후 5일까지</td>
                    </tr>
                    </tbody>
                </table>
                <p class="joinTxt">※ 포도컨트리클럽 골프클럽 예약 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스를 이용하실수 있습니다. <br>
                    <br>
                    ‘본 동의는 포도컨트리클럽 골프클럽의 본질적 기능 제공을 위한 개인정보 수집/이용에 대한 동의로서, <br>고객님은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며, 본 동의를 거부할 경우 받는 별도의 불이익은 없습니다.<br>
                    단, 본 동의를 거부할 경우, 포도컨트리클럽 골프클럽의 서비스 이용이 불가능합니다.’</p>
                <h4><label><input type="radio" name="chkAgree2" value="Y"> 동의합니다.</label> <label><input type="radio" name="chkAgree2" value="N"> 동의하지 않습니다.</label></h4>
                <hr><div class="padding10"></div>

                <h2 class="commonDot"> 개인정보수집 및 이용동의 (선택)</h2>
                <table border="0" cellpadding="0" cellspacing="0" class="joinViewTable">
                    <colgroup>
                        <col width="*">
                        <col width="*">
                        <col width="*">
                        <col width="250">
                    </colgroup>
                    <thead>
                    <tr>
                        <th width="34%">수집 및 이용목적</th>
                        <th width="26%">수집하는 개인정보 항목</th>
                        <th width="23%">보유 및 이용기간</th>
                        <th width="17%">동의 여부</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td align="center">광고성 문자메세지 전송(할인 이벤트등)</td>
                        <td align="center">휴대전화번호,이메일</td>
                        <td align="center">탈퇴 후 5일까지</td>
                        <td align="center" style="text-align: left; padding-left: 20px;">
                            <label for="AgreeCheck3_1">
                                <input type="radio" name="chkAgree3" id="AgreeCheck3_1" value="Y" class="ck_agree">
                                동의<br>
                            </label>
                            <label for="AgreeCheck3_2">
                                <input type="radio" name="chkAgree3" id="AgreeCheck3_2" value="N">
                                동의안함</label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">새로운 상품 안내마케팅(전화,이메일)</td>
                        <td align="center">휴대전화번호,이메일</td>
                        <td align="center">탈퇴 후 5일까지</td>
                        <td align="center" style="text-align: left; padding-left: 20px;">
                            <label for="AgreeCheck4_1">
                                <input type="radio" name="chkAgree4" id="AgreeCheck4_1" value="Y" class="ck_agree">
                                동의<br>
                            </label>
                            <label for="AgreeCheck4_2">
                                <input type="radio" name="chkAgree4" id="AgreeCheck4_2" value="N">
                                동의안함</label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">공지사항,클럽소식등 정보제공</td>
                        <td align="center">휴대전화번호,이메일 </td>
                        <td align="center">탈퇴 후 5일까지</td>
                        <td align="center" style="text-align: left; padding-left: 20px;">
                            <label for="AgreeCheck5_1">
                                <input type="radio" name="chkAgree5" id="AgreeCheck5_1" value="Y" class="ck_agree">
                                동의<br>
                            </label>
                            <label for="AgreeCheck5_2">
                                <input type="radio" name="chkAgree5" id="AgreeCheck5_2" value="N">
                                동의안함</label>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
            <div class="joinTxt">
                ※ 동의를 거부하시는 경우에도 예약서비스는 이용하실수 있습니다.
                <br>
                <br>
                본 동의는 포도컨트리클럽 골프클럽의 서비스 제공을 위한 개인정보 수집/이용에 대한 동의로서, 고객님은
                개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며, 본 동의를 거부할 경우 받는 별도의 불이익은 없습니다.’
                <br>
                <br>
                - 개인정보 수집/이용 및 광고성 정보 수신 동의를 “미동의” (으)로 선택하셔도 개인정보 보호를 위한 정보 안내 수신 동의/철회 등의 메시지나 메일은 발송 될 수 있습니다.<br>
                - 법령에 따른 개인정보의 수집/이용, 계약의 이행/편의증진을 위한 개인정보 취급위탁 및 개인정보 취급과 관련된 일반 사항은 당사의 개인정보 취급 방침에 따릅니다.<br>
                - 고객이 본 수신동의를 철회하고자 할 경우 당사의 개인정보 취급 책임자/담당자를 통해 수신동의 철회요청을 할 수 있습니다.<br>
            </div>

            <!--<h4><label><input type="radio" name="chkAgree3" value="Y"> 동의합니다.</label> <label><input type="radio" name="chkAgree3" value="N"> 동의하지 않습니다.</label></h4>-->
            <hr><div class="padding10"></div>

            <div class="allAgree">
                <label><input type="checkbox" id="chkAgreeAll" onclick="onChangeAllAgree()"> 전체 동의합니다.</label>
            </div>

            <div class="btnBox">
                <!--<a href="javascript:doNextStep()" class="motion">분양회원</a>-->
                <a href="javascript:doNextStep()" class="cancel">인터넷회원</a>
                <a href="/index" class="whiteBtn">취소</a>
            </div>
        </div>
    </div><!-- contents End-->

</div>	<!-- wrap End -->
<%@ include file="../include/footer.jsp" %>
