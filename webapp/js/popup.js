//결제버튼을 눌렀을때 팝업
document.addEventListener("DOMContentLoaded", function() {
document.getElementById("money").addEventListener("click", function() {
    if(confirm("결제하시겠습니까?")){
    	alert("결제가 완료되었습니다.");
		window.location.href = 'coupon2.jsp';
    }
    else{
    	alert("결제가 취소되었습니다.");
    }
});
});