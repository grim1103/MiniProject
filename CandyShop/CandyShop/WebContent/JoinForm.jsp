<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>

</style>
<script>
 
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddressEnglish; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('m_roadAddress').value = fullRoadAddr;
                document.getElementById('m_jibunAddress').value = data.jibunAddressEnglish;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddressEnglish + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddressEnglish;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<br><br><br>
<form action="JoinAction.jsp" method="post">
		<table border="1" align="center">
			<tr height="50">
				<td width="150" align="center">NAME</td>
				<td width="350" align="center">
				<input type="text" name="m_name" size="40" placeholder="NAME">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">I D</td>
				<td width="350" align="center">
				<input type="text" name="m_id" size="40" placeholder="I D">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">PASSWORD</td>
				<td width="350" align="center">
				<input type="password" name="m_pass" size="40" placeholder="PASSWORD">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">PASSWORD CONFIRM</td>
				<td width="350" align="center">
				<input type="password" name="m_pass2" size="40" placeholder="PASSWORD CONFIRM">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">TEL</td>
				<td width="350" align="center">
				<input type="tel" name="m_tel" size="40" placeholder="TEL">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">E-MAIL</td>
				<td width="350" align="center">
				<input type="email" name="m_email" size="40" placeholder="E-MAIL">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">Birth(ex.950826)</td>
				<td width="350" align="center">
				<input type="text" name="m_birth" size="40" placeholder="Birth">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">Address</td>
				<td width="350" align="center">
				<input type="text" name="m_post" id="m_post" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="m_roadAddress" name="m_roadAddress" placeholder="도로명주소">
				<input type="text" id="m_jibunAddress" name="m_jibunAddress" placeholder="지번주소">
				<input type="text" name="m_address" size="40" placeholder="Detail Addresss">
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
				<input type="reset" value="RESET">
				<input type="submit" value="JOIN">
				</td>
			</tr>
		</table>
	</form>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>