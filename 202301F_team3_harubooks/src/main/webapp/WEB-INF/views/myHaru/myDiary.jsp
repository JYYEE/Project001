<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 일기</title>
<link rel="stylesheet" href="/resources/asset/css/myDiary.css">

<style>
div #diarySelect{
	display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}
div#nothing.title{
	font-weight: bold;
	font-family: 'Nanum Pen Script', cursive;
	text-align: center;
	font-size: 50px;
	width: 100%;
    margin-top: 23%;
    margin-bottom: 30%;
}
#myDiary{
	font-family: 'Nanum Pen Script', cursive;
	font-size: 26px;
}
input#searchWord{
	height: 100%;
	border: none;
	background: none;
}
button#search{
	height: 100%;
    width: 55px;
    background: #71cd5ad9;
    border: none;
    color: #fff;
    font-weight: bold;
}
div#diaryInput{
	display: flex;
    border: 1px solid gray;
    border-radius: 5px;
}
select#diaryOption{
 	font-size: 17px;
    margin-top: 6px;
    font-family: 'Nanum Gothic';
}
</style>
<input type="hidden" value="<sec:authentication property="name"/>" id="secName">
<div id="listBody">
    <div class="board_wrap">
        <div class="board_title">
            <!-- <strong>나의 일기</strong> -->
            <div class="bt_wrap">
            	<p>일기부터 독후감, 한줄평까지 자유롭게</p>
                <a href="/myHaru/insertform" class="on">일기작성</a>
        	</div>
        </div>
            <div id="diarySelect">
           		<div id="myDiary">
           			총 : <span id="diaryCount"></span>건 
           		</div>
				<input type="hidden" name="page" id="page"> 
				<div id="diaryInput">
					<input type="text" name="searchWord" value="" id="searchWord" placeholder=" Search">
					<button type="button" id="search">검색</button>
				</div>
				<div id="diaryOptions">
					<select id="diaryOption" name="searchType">
						<option value="order-old" selected>최근순</option>
						<option value="order-young">오래된순</option>
					</select> 
				</div>
            </div>
            <div id="diaryList"></div>
            <div id="pagingArea"></div>
    </div>
</div>
<!-- <div id="detailBody"></div> -->
<script type="text/javascript">
 	var name = document.querySelector("#secName").value;
 	var diaryList = document.querySelector("#diaryList");
    var diaryCount = document.querySelector("#diaryCount");
    var search = document.querySelector("#search");
    diaryOption = document.querySelector("#diaryOption");
    searchWord = document.querySelector("#searchWord").value;
    searchType = document.querySelector("#diaryOption").value;
    page = 1;
	
    // 페이지에 a태그 링크 설정
    $(function(){
    	var pagingArea = $("#pagingArea");
    	diaryLists();
    	
    	pagingArea.on("click", function (event) {
            if (event.target.tagName === "A") {
                event.preventDefault();
                page = event.target.getAttribute("data-page");
                diaryLists();
            }
        });
    })
    
    // 검색 버튼 value 값 가져와서 검색
	search.addEventListener("click", function(){
	   searchWord = document.querySelector("#searchWord").value;
	   diaryLists();
   	});  
   
    // 최근 순 오래된 순으로 변경
    diaryOption.addEventListener("change", function(){
	   searchType = document.querySelector("#diaryOption").value;
	   diaryLists();
  	});
    
    function diaryLists(){
    	var diaryList = document.querySelector("#diaryList");
    	var detailBody = document.querySelector("#detailBody");
    	
        diaryList.innerHTML = "";
        $.ajax({
            type : "get",
            url : "/myHaru/mydiarys",
            data : {
                id:name,
                searchWord:searchWord,
                searchType:searchType,
                page:page
            },
            contentType : 'application/json',
            beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
            success: function(res){
                 if(res.diary.dataList.length != 0){
                     var list = "";
                     list += ` <div class='board_list_wrap'>`;
                     list += `      <div class='board_list'>`;
                     list += `	        <div class='top'>`;
                     list += `              <div class='num'>번호</div>`;
                     list += `              <div class='title'>한줄평</div>`;
                     list += `              <div class='date'>작성일</div>`;
                     list += `          </div>`
                   	 for(let i=0; i < res.diary.dataList.length; i++){
                     var title = res.diary.dataList[i].diary_title.replaceAll(/<script>/gi, "");
                        list += `       <div class='diary_rnum'>`;
                        list += "           <div class='num'>"+res.diary.dataList[i].rnum+"</div>";
                        list += "           <input type='hidden' class='diaryNo' value='"+res.diary.dataList[i].diary_no+"'/>";                        
                        if(res.diary.dataList[i].diary_title.length > 20){
                            list += "       <div class='title'>";
                            list += "			<a href='/myHaru/detaildiary?diary_no="+res.diary.dataList[i].diary_no+"'>"+title.substring(0,20)+"...</a>";
                            list += "		</div>";
                        }else{
                        	list += "       <div class='title'>";
                                list += "			<a href='/myHaru/detaildiary?diary_no="+res.diary.dataList[i].diary_no+"'>"+title+"</a>";
                                list += "	</div>";
                        }
                        list += "           <div class='date'>"+res.diary.dataList[i].diary_ymd+"</div>";
                        list += `       </div>`;
                     }
                     list += `      </div>`;
                     list += `</div>`;
                 	 diaryList.innerHTML += list;
                 }else{
                	 var list = "";
                	 list += ` <div class='board_list_wrap'>`;
                     list += `    <div class='board_list'>`;
                     list += `	     <div class='top'>`;
                     list += `          <div class='num'>번호</div>`;
                     list += `          <div class='title'>한줄평</div>`;
                     list += `          <div class='date'>작성일</div>`;
                     list += `       </div>`
                     list += `       <div>`
                	 list += `      <div id='nothing' class='title'> 일기가 존재하지 않아요! </div>`;
                     list += `       </div>`
                     list += `    </div>`
                     list += ` </div>`
                     diaryList.innerHTML += list;       
                 }
                 pagingArea.innerHTML = res.diary.pagingHTML;
                 diaryCount.innerHTML = res.diary.totalRecord;
            },
            error : function(err){
                console.log("errpr :  "+err.toString());
            }
        })
    }
</script>
