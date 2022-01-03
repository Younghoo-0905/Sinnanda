<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
	
	<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="/css/animate.css">
	
	<link rel="stylesheet" href="/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/css/magnific-popup.css">
	
	<link rel="stylesheet" href="/css/aos.css">
	
	<link rel="stylesheet" href="/css/ionicons.min.css">
	
	<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/css/jquery.timepicker.css">
	
	
	<link rel="stylesheet" href="/css/flaticon.css">
	<link rel="stylesheet" href="/css/icomoon.css">
	<link rel="stylesheet" href="/css/style.css">
	<title>이용약관</title>
</head>
<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery 실행 -->
<body onload="toBoardScroll()">

	<!-- [이승준] 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// [이승준] 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
		}
	</script>
	
	<!-- [이승준] 상단 내비바 - START -->
	<%@ include file="/WEB-INF/partials/navbar.jsp" %>
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<%@ include file="/WEB-INF/partials/qnaBackground.jsp" %>
	<!-- [이승준] 상단 이미지 배너 - END -->
	
	<!-- [이승준] 본문 QnA 목록 부분 - START -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		<div class="container">
			<span class="subheading">개인정보처리방침</span>
			<h1><strong>신난다 개인정보처리방침</strong></h1>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;"></strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					< 신난다 >('http://3.34.145.56/sinnanda/index'이하 '신난다')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.
					<br>○ 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제1조(개인정보의 처리 목적)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					< 신난다 >('http://3.34.145.56/sinnanda/index'이하 '신난다')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
					<br>&nbsp;&nbsp;1. 홈페이지 회원가입 및 관리
						<br>&nbsp;&nbsp;&nbsp;&nbsp;회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리 목적으로 개인정보를 처리합니다.
					<br>&nbsp;&nbsp;2. 재화 또는 서비스 제공
						<br>&nbsp;&nbsp;&nbsp;&nbsp;서비스 제공, 콘텐츠 제공을 목적으로 개인정보를 처리합니다.
										
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제2조(개인정보의 처리 및 보유 기간)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① < 신난다 >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
					<br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
					<br>&nbsp;&nbsp;1.<홈페이지 회원가입 및 관리>
					<br>&nbsp;&nbsp;&nbsp;&nbsp;<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<1년>까지 위 이용목적을 위하여 보유.이용됩니다.
					<br>&nbsp;&nbsp;&nbsp;&nbsp;보유근거 : 홈페이지 회원정보 수집 등에 관한 기록
					<br>&nbsp;&nbsp;&nbsp;&nbsp;관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년
					<br>&nbsp;&nbsp;&nbsp;&nbsp;예외사유 :
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제3조(개인정보의 제3자 제공)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① < 신난다 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
					<br>② < 신난다 >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
					<br>&nbsp;&nbsp;1. < 신난다 >
					<br>&nbsp;&nbsp;&nbsp;&nbsp;개인정보를 제공받는 자 : 신난다
					<br>&nbsp;&nbsp;&nbsp;&nbsp;제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 이름
					<br>&nbsp;&nbsp;&nbsp;&nbsp;제공받는 자의 보유.이용기간: 지체없이 파기
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제4조(개인정보처리 위탁)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① < 신난다 >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
					<br>② < 신난다 >은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
					<br>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
					
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① 정보주체는 신난다에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
					<br>② 제1항에 따른 권리 행사는신난다에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 신난다은(는) 이에 대해 지체 없이 조치하겠습니다.
					<br>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
					<br>④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
					<br>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
					<br>⑥ 신난다은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
					
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제6조(처리하는 개인정보의 항목 작성)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① < 신난다 >은(는) 다음의 개인정보 항목을 처리하고 있습니다.
						<br>&nbsp;&nbsp;1< 홈페이지 회원가입 및 관리 >
						<br>&nbsp;&nbsp;&nbsp;&nbsp;필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 이름
						<br>&nbsp;&nbsp;&nbsp;&nbsp;선택항목 : 자택전화번호
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제7조(개인정보의 파기)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① < 신난다 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
					<br>② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
						<br>&nbsp;&nbsp;1. 법령 근거 :
						<br>&nbsp;&nbsp;2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜
					<br>③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
						<br>&nbsp;&nbsp;1. 파기절차
					<br>< 신난다 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 신난다 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
						<br>&nbsp;&nbsp;2. 파기방법
							<br>&nbsp;&nbsp;&nbsp;&nbsp;전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.
							<br>&nbsp;&nbsp;&nbsp;&nbsp;종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제8조(개인정보의 안전성 확보 조치)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					< 신난다 >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
						<br>1. 정기적인 자체 감사 실시
							<br>&nbsp;&nbsp;개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.
						<br>2. 개인정보 취급 직원의 최소화 및 교육
							<br>&nbsp;&nbsp;개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
						<br>3. 내부관리계획의 수립 및 시행
							<br>&nbsp;&nbsp;개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.
						<br>4. 해킹 등에 대비한 기술적 대책
							<br>&nbsp;&nbsp;<신난다>('신난다')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.
						<br>5. 개인정보의 암호화
							<br>&nbsp;&nbsp;이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
						<br>6. 접속기록의 보관 및 위변조 방지
							<br>&nbsp;&nbsp;개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.
							<br>&nbsp;&nbsp;또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.
						<br>7. 개인정보에 대한 접근 제한
							<br>&nbsp;&nbsp;개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
						<br>8. 문서보안을 위한 잠금장치 사용
							<br>&nbsp;&nbsp;개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.
						<br>9. 비인가자에 대한 출입 통제
							<br>&nbsp;&nbsp;개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.
					
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					신난다 은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.
					
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제10조 (개인정보 보호책임자)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① 신난다 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
						<br>▶ 개인정보 보호책임자
							<br>&nbsp;&nbsp;성명 :이원희
							<br>&nbsp;&nbsp;직책 :팀장
							<br>&nbsp;&nbsp;직급 :과장
							<br>&nbsp;&nbsp;연락처 :010-1234-5678, leewonhee@sinnanda.com, 080-1234-5678
							<br>&nbsp;&nbsp;<span style="color: red;">※ 개인정보 보호 담당부서로 연결됩니다.</span>
						
						<br>▶ 개인정보 보호 담당부서
							<br>&nbsp;&nbsp;부서명 :
							<br>&nbsp;&nbsp;담당자 :
							<br>&nbsp;&nbsp;연락처 :, ,
					<br>② 정보주체께서는 신난다 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 신난다 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.
										
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제11조(개인정보 열람청구)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.
					<br>< 신난다 >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.
					
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제12조(권익침해 구제방법)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.

					<br>1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)
					<br>2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)
					<br>3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)
					<br>4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)
					
					<br>「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.
					
					<br><span style="color: red;">※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.</span>
										
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;">제13조(개인정보 처리방침 변경)</strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					① 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.
					<br>② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.
				</div>
			</div>
			
			<div style="padding: 10px;">
				<h3><strong style="color: #3c3c3c;"></strong></h3>
				<div style="padding-left: 20px; padding-right: 20px;">
					
				</div>
			</div>
			
			
			<div style="text-align: right;">출처 : <a href="https://www.privacy.go.kr/">개인정보보호 포털</a></div>
		</div>
	</section>
	<!-- [이승준] 본문 QnA 목록 부분 - END -->
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->
	
	<!-- [이승준] js 소스코드 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="direngine-master/js/google-map.js"></script>
	<script src="direngine-master/js/main.js"></script>
</body>
</html>