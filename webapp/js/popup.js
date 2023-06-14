//결제버튼을 눌렀을때 팝업
document.addEventListener("DOMContentLoaded", function() {
document.getElementById("money").addEventListener("click", function() {
    if(confirm("결제하시겠습니까?")){
      //결제하시겠습니까? 라는 confirm 창에서 확인을 누르면
      //결제가 완료되었다는 alert창이 나오고 또 확인을 누르면 coupon2.jsp페이지로 넘어감
    	alert("결제가 완료되었습니다.");
		window.location.href = 'coupon2.jsp';
    }
    //결제하시겠습니까? 에서 취소를 누르면 취소되었다는 alert창이 나옴
    else{
    	alert("결제가 취소되었습니다.");
    }
});
});