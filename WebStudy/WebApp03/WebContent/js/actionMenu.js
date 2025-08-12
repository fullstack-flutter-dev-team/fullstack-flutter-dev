/**
 * actionMenu.js
 */

 function actionMenu(status) {
    console.log("actionMenu() , status :  " + status);

    var menu = document.getElementById("menuTable");

    if (status == 1) {
        console.log("1번 : 메뉴보이기 확인~!!!");
        menu.style.display = "block"; // 블럭 단위로 렌더링...
    } else {
        console.log("2번 : 메뉴숨기기 확인~!!!");
        menu.style.display = "none"; // 화면 숨기기
    }
    
 }