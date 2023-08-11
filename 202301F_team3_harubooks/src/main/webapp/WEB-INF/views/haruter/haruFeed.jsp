<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--게시물 나오는곳-->
<link rel="stylesheet" href="/resources/asset/css/haruFeed.css">

<!--스토리 내용-->
<div class="stories">
	<div id="story-info">
		<span id="si1">하루하루 설레는 독서인의 쉼터 </span><span id="si2">하루터</span>
	</div>
	<!-- <img id="si-img" src="/resources/asset/image/남녀.png"> -->
</div>
<!--메인 피드 -->
<div class="feed">
	<div id="feed-tex">
		<h1>하루피드</h1>
	</div>
	<div id="feed-search">
		<select id="feed-search-select">
			<option value="board_title">제목</option>
			<option value="board_writer">작성자</option>
		</select>
		<input id="feed-search-input" type="text" placeholder="찾을 게시물을 입력하세요" maxlength="30">
		<button type="button" id="feed-search-input-btn">검색</button>
	</div>
	<div id="feed-select-list">
		<select id="feed-select">
			<option value="order-inq" selected="selected">조회 순</option>
<!-- 			<option value="order-like" >좋아요 순</option> -->
			<option value="order-recent">최신작성 순</option>
		</select>		
	</div>
	<div id="feed-upload-btn" onclick="fModalOpen()">
          <i class="ri-add-circle-fill"></i>
          <div class="btn-text">피드 작성하기</div>
    </div>
</div>

<!-- 게시글 작성 모달 -->
<div id="modal">
	<i onclick="modalClose()" class="ri-close-line mbtn"></i>
	<div class="mcontainer">
			<input type="hidden" id="id" value="<sec:authentication property="name"/>"/>
			<!-- 모달 header  -->
			<div id="mheader">
				<div id="mheader-before" class="mheader-btns"><i id="left-arrow" class="ri-arrow-left-line"></i></div>
				<div id="mheader-text">사진 추가</div>
				<div id="mheader-next" class="mheader-btns">다음</div>
			</div>			

			<!-- 모달 첫번째 DIV -->
			<div id="mimages-div">
				<input type="file" id="mimages-file" accept="image/jpeg, image/png, image/jpeg" multiple="multiple" >
				<img alt="" src="../resources/asset/image/fileUpload.png" width="130px" height="130px">
				<h2>공유할 사진을 선택하세요! (최대 5개)</h2>
				<button id="mimages-select">파일 선택</button>
			</div>
			
			<!-- 모달 두번째 DIV -->
			<div id="img-filter-div">
				<div id="img-select-div">
					<div id="img-select-before-div">
						<div id="img-select-before"><i class="ri-arrow-left-circle-fill green-color"></i></div>
					</div>
					<div id="img-select-div2">
						<img id="img-select" src="" >
					</div>
					<div id="img-select-next-div">
						<div id="img-select-next"><i class="ri-arrow-right-circle-fill green-color"></i></div>
					</div>
				</div>
				<!-- 두번째에만 나올 필터 모달창 -->
				<div id="img-filter"> 
				    <div class="img-filters-row">
					    <div class="img-filters-div">
					      <img class='img-filters grayscale' alt="grayscale" src="../resources/asset/image/exImage2.png" >
						  <h4 class="img-filters-h3">grayscale</h4>
					    </div>
					    <div class="img-filters-div">
					      <img class='img-filters sepia' alt="sepia" src="../resources/asset/image/exImage2.png">
					      <h4 class="img-filters-h3">sepia</h4>
					    </div>
					    <div class="img-filters-div">
					      <img class='img-filters saturate' alt="saturate" src="../resources/asset/image/exImage2.png">
					      <h4 class="img-filters-h3">saturate</h4>
					    </div>
				    </div>
				    <div class="img-filters-row">
				        <div class="img-filters-div">
				          <img class='img-filters contrast' alt="contrast" src="../resources/asset/image/exImage2.png">
				          <h4 class="img-filters-h3">contrast</h4>
				        </div>
				        <div class="img-filters-div">
				          <img class='img-filters brightness' alt="brightness" src="../resources/asset/image/exImage2.png">
				          <h4 class="img-filters-h3">brightness</h4>
				        </div>
				        <div class="img-filters-div">
				          <img class='img-filters hue-rotate' alt="hue-rotate" src="../resources/asset/image/exImage2.png">
				          <h4 class="img-filters-h3">hue-rotate</h4>
				        </div>
				    </div>
				    <div class="img-filters-row">
				        <div class="img-filters-div">
				          <img class='img-filters ruby' alt="ruby" src="../resources/asset/image/exImage2.png">
				          <h4 class="img-filters-h3">ruby</h4>
				        </div>
				        <div class="img-filters-div">
				          <img class='img-filters aquamarine' alt="aquamarine" src="../resources/asset/image/exImage2.png">
				          <h4 class="img-filters-h3">aquamarine</h4>
				        </div>
				        <div class="img-filters-div">
				          <img class='img-filters emerald' alt="emerald" src="../resources/asset/image/exImage2.png">
				          <h4 class="img-filters-h3">emerald</h4>
				        </div>
				    </div>
				    <div id="remove-filter-div">
				    	<button id="remove-filter" type="button">필터 제거</button>
				    </div>
				</div>
				<!-- 제목과 내용을 입력할 세번째 모달 -->
				<div id="text-div">
					<div id="text-div-title">
						<input id="text-title" type="text" placeholder="제목을 입력하세요" maxlength="40">
					</div>
					<div id="text-div-content">
						<textarea id="text-content" rows="300" cols="600" placeholder="내용을 입력하세요" maxlength="1500"></textarea>
					</div>
				</div>
			</div>
			
	</div>
</div>



<!-- 게시글 수정 모달 -->
<div id="uModal">
	<div class='uContainer'>
		<i id='uHeader' class="ri-close-line" onclick="MmodalClose()"></i>
		<div class='uTitle'>
			<input type="text" id="uText" placeholder="제목을 입력하세요"  maxlength="40" />
		</div>
		<div class='uContent'>
			<textarea rows="" cols="" id="uContent" placeholder="내용을 입력하세요" maxlength="1500"></textarea>	
		</div>
		<div id="uBtns">
			<input type='button' id="uUpdateBtn" value='수정'>
			<input type='button' id="uCancleBtn" value='취소'>
		</div>
	</div>
</div>

<!-- 게시글 상세 모달 -->
<div id="dModal"></div>

<!-- 게시글 리스트 -->
<div id="list" class='main-posts'></div>


<!-- 댓글 수정 모달 -->
<div id="rModal">
	<div class='rContainer'>
		<i id='rHeader' class="ri-close-line" onclick="RmodalClose()"></i>
		<div class='rTitle'>
			<input type="text" id="rText" placeholder="댓글을 수정하세요"   maxlength = '100' />
		</div>
		<div id="rBtns">
			<input type='button' id="rUpdateBtn" value='수정'>
			<input type='button' id="rCancleBtn" value='취소'>
		</div>
	</div>
</div>

<script type="text/javascript">
var ae_id = document.querySelector("#id").value;

const mHeader = document.querySelector("#mheader"); 
const feedSearchSelect = document.querySelector("#feed-search-select");			// searchSelect(검색할 셀렉트)
const feedSearchInput = document.querySelector("#feed-search-input");			// searchWord(찾을 검색어 input)
const feedSearchInputBtn = document.querySelector("#feed-search-input-btn");	// 검색어 검색 버튼
const feedSelect = document.querySelector("#feed-select");						// searchType(정렬할 셀렉트)


const mimagesDiv = document.querySelector("#mimages-div");				// 게시글 생성 첫 모달 화면
const mimagesSelect = document.querySelector("#mimages-select");		// 사진 선택 버튼
const mheaderText = document.querySelector("#mheader-text");			// 타이틀(변경을 위해)
const mimagesFile = document.querySelector("#mimages-file");			// 실제 사진이 들어가는 input:file

const mheaderBefore = document.querySelector("#mheader-before")			// 모달 top 이전 버튼
const mheaderNext = document.querySelector("#mheader-next")				// 모달 top 다음 버튼

const imgFilterDiv = document.querySelector("#img-filter-div");			// 사진들이 나올 두번째 모달 화면
const imgFilter = document.querySelector("#img-filter");				// 사진들의 필터들이 나올 두번째 모달 화면
const imgSelect = document.querySelector("#img-select"); 				// 확인할 이미지
const imgSelectBeforeDiv = document.querySelector("#img-select-before-div");    // 사진 이전 버튼
const imgSelectNextDiv = document.querySelector("#img-select-next-div"); 	    // 사진 다음 버튼
const filteredImage = document.querySelector("#filtered-image");				// 필터 적용
const removeFilter = document.querySelector("#remove-filter");					// 필터 제거  
const imgFilters = document.querySelectorAll(".img-filters");					// 적용할 필터 부분

const textDiv = document.querySelector("#text-div");					// 제목과 내용을 입력할 세번째 모달 화면
const textTitle = document.querySelector("#text-title");				// 제목
const textContent = document.querySelector("#text-content");			// 내용

const postBox = document.querySelectorAll(".post-box");						// 각각의 게시물들

const myList = document.querySelector("#list");
const Modal = document.querySelector("#modal");
const myForm = document.forms[0];
const mForm = document.querySelector("#mForm");
const mContainer = document.querySelector(".mcontainer");
const dModal = document.querySelector("#dModal");							// 게시글 상세모달

const uModal = document.querySelector("#uModal");							// 게시글 수정모달
const uText	= document.querySelector("#uText");								// 게시글 수정 제목
const uContent = document.querySelector("#uContent");						// 게시글 수정 내용
const uCancleBtn = document.querySelector("#uCancleBtn");					// 게시글 취소
const uUpdateBtn = document.querySelector("#uUpdateBtn");					// 최종 업데이트 버튼

const rModal = document.querySelector("#rModal");							// 댓글 수정 모달
const rText = document.querySelector("#rText");							    // 댓글 수정 내용
const rCancleBtn = document.querySelector("#rCancleBtn");				    // 댓글 취소
const rUpdateBtn = document.querySelector("#rUpdateBtn");					// 댓글 업데이트

currentPage = 1;														// 무한스크롤 처음에 1로 시작			
nowPage = 1;															// 현재 페이지가 무엇인지 저장		
replyPage = 1;															// 보여줄 댓글 목록 1로 시작		
subReplyPage = 1;														// 보여줄 대댓글 목록 1로 시작

maxFile = 5;															// 최대 담을 수 있는 파일 갯수
inputFileNum = 0; 														// 선택한 파일
tempEvent='';															// 파일 event 저장														
page=0;																	// 현재 페이지
inputModal = false;														// 모달창 닫기 버튼
filterInfo = [];														// 각 사진들의 필터 정보를 담는다.
inputDetila = false;													// 상세보기에서 수정/삭제 div버튼 눌렀는지 체크

detilaCheck = false;													// 상세페이지로 갔는지 확인									
boardTemp = "";															// 게시판 임시 저장								
replyTemp = "";															// 댓글 임시 저장								
boardAeId = "";															// 게시판 작성자 임시 저장

//각각의 이미지들을 보여주기 위한 변수선언
var dImgCount = 0;		// 선언된 파일들의 갯수저장
var dImgNowCount = 0;	// 현재 위치 저장	
var dImgSrc = [];		// src 위치 저장
var dImgFilter = [];	// 필터 저장

window.onload = function() {

	//리스트, 디테일
	storyList();					// 리스트
	filterReset();					// 필터 초기화
	likeHeart();					// 하트 클릭

	
//								   							리스트 부분

// 검색 버튼을 눌렀을 때
feedSearchInputBtn.addEventListener("click", function(){
	storyReset();	
})

// 정렬할 때마다
feedSelect.addEventListener("change", function(){
	storyReset();	
})

// enter 눌러도 검색 가능
$("#feed-search-input").keyup((event) => {
	if(event.keyCode == 13){
		$("#feed-search-input-btn").click();
	}
});	


//가져올 데이터가 없으면 스크롤 내려도 반복되지 않게 저장
scrollCheck = true;

// 스크롤바를 모두 내렸을 때 무한 스크롤를 위한 함수
window.onscroll = function(){
    let scrollTop = document.documentElement.scrollTop;
    let clientHeight = document.documentElement.clientHeight;
    let scrollHeight = document.documentElement.scrollHeight;
    
    const tunningVal = 50; // 60px 전에 발생시키려 함
    if((scrollTop + clientHeight) >= (scrollHeight - tunningVal)) {
    	if(scrollCheck){
    		currentPage++;
    		storyList();
    	}
    }
}

	
//                                							디테일 부분(수정, 삭제)


// 상세 페이지 소환
$(document).on("click", ".click-board",function() {
   var boardNo = $(this).parent().attr("data-no");
   var countEye = $(this).parent().find(".eye_count");
   countEye.text(parseInt(countEye.text()) + 1)
   boardDetail(boardNo);

 });


// 수정삭제 상세 모달 열기/닫기
$(document).on("click", "#detail-btn", function(event){
	event.preventDefault();
	if(inputDetila==false){
	    $("#detail-modal").css("display", "grid");
		inputDetila = true;		
	}else{
	    $("#detail-modal").css("display", "none");
		inputDetila = false;	
	}
})

// 삭제 눌렀을 때
$(document).on("click", "#delete-span", function(event){
	Swal.fire({
		  title: '정말 게시글을 삭제하시겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  if (result.isConfirmed) {
			  var boardNo = $(this).attr("data-no");
			  var boardId = $(this).attr("data-id");
				$.ajax({
					type : "post",
					url : "/haruter/deleteHarustory",
					data : {
						"board_no":boardNo,
						"ae_id" : ae_id,
						"ua_no" : boardId
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(res){
					   if(res == "OK"){
						   Swal.fire({
							   title: '삭제 완료',
							   icon: 'success',
							   showCancelButton: false,
							   confirmButtonColor: '#3085d6',
							   confirmButtonText: '확인'
							 }).then((result) => {
							   if (result.isConfirmed) {
								  dModal.style.display = "none";
								  inputDetila = false;
								  storyReset();
							   }
							 });
					   }else{
						  Swal.fire('삭제 실패! 다시 시도하세요');
					   }
			     	},
			     	error: function(ex){
			     		console.log("error", ex);
			     	}
				});	
		  }
		})
})
	
// 수정 눌렀을 때 수정 폼 나옴
$(document).on("click","#update-span", function(){
	uModal.style.display = "block"; // 보이게
	uText.value = document.querySelector("#dProfil-title").textContent;
	uContent.value = document.querySelector("#content-span").textContent;
})

//수정 폼 이후 취소버튼
uCancleBtn.addEventListener("click", function(){
	Swal.fire({
		  title: '수정을 취소하시겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			 uModal.style.display = "none";
		  }
	})
})

//수정 폼 이후 수정버튼
uUpdateBtn.addEventListener("click", function(){
	Swal.fire({
		  title: '피드를 수정하시겠습니까??',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			  var updateText = uText.value
			  var updateContent = uContent.value
			  var boardNo = $("#update-span").attr('data-no');
			  
			  if(updateText.trim() == ""){
				  Swal.fire("제목을 입력하세요!")
				  return false;
			  }

			  if(updateContent.trim() == ""){
				  Swal.fire("내용을 입력하세요!")
				  return false;
			  }

			  $.ajax({
					type : "post",
					url : "/haruter/updateHarustory",
					data : {
						"board_no":boardNo,
						"ae_id" : ae_id,
						"board_title" : updateText,
						"board_content" : updateContent
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(res){
					   console.log(res+"res")
					   if(res == "OK"){
						   Swal.fire({
							   title: '수정 완료',
							   icon: 'success',
							   showCancelButton: false,
							   confirmButtonColor: '#3085d6',
							   confirmButtonText: '확인'
							 }).then((result) => {
							   if (result.isConfirmed) {
								   uModal.style.display = "none";
								   storyReset();
								   boardDetail(boardNo);
							   }
							 });
					   }else{
						  Swal.fire('삭제 실패! 다시 시도하세요');
					   }
			     	},
			     	error: function(ex){
			     		console.log("error", ex);
			     	}
				});	
			  	 
		  }
	})
})

// 클릭 시 내용(Content)을 연다
$(document).on("click","#dContent-open-all", function (event) {
	  $("#dContent-content").slideDown(); 
	  $("#dContent-content").css("display", "block");
	  $("#dContent-open-all").css("display", "none");
	  $("#dReplyList").css("height", "488px")
});


// 클릭 시 내용(Content)을 닫는다
$(document).on("click","#dContent-close-all", function (event) {
	  $("#dContent-content").slideUp();
	  $("#dContent-open-all").css("display", "grid");
	  $("#dContent-content").css("display", "none");
	  $("#dReplyList").css("height", "465px")
});


// 상세에 다음 사진을 보여준다
$(document).on("click", "#dImg-right", function(){
	$("#dImgs").removeClass();
	dImgNowCount++;
	$("#dImgs").attr("src", "/upload/images/s_" + dImgSrc[dImgNowCount]);
	$("#dImgs").addClass(dImgFilter[dImgNowCount]);
	$("#dImgs").addClass("dimg"); 
	$("#dImg-left").css("display", "block");
	if(dImgNowCount < (dImgCount-1)){
		$("#dImg-right").css("display", "block");					
	}else{
		$("#dImg-right").css("display", "none");										
	}
})

// 상세에 이전 사진을 보여준다
$(document).on("click", "#dImg-left", function(){
	$("#dImgs").removeClass();
	dImgNowCount--;
	$("#dImgs").attr("src", "/upload/images/s_" + dImgSrc[dImgNowCount]);
	$("#dImgs").addClass(dImgFilter[dImgNowCount]);
	$("#dImgs").addClass("dimg"); 
	if(dImgNowCount > 0){
		$("#dImg-left").css("display", "block");					
	}else{
		$("#dImg-left").css("display", "none");										
	}
	if(dImgNowCount < (dImgCount-1)){
		$("#dImg-right").css("display", "block");					
	}
})


//                                							디테일 부분(수정, 삭제) 끝

//                                							댓글 시작

//댓글 입력 상태일 때 게시가 나오게 한다
$(document).on("focus", "#dApplyText", function(event){
	$("#reply-insert").css("display", "block");
})

// 댓글 입력 상태가 아닐 때 게시를 지운다.
$(document).on("blur", "#dApplyText", function(event){
	if($("#dApplyText").val().trim()==""){
		$("#reply-insert").css("display", "none");		
	}
})


// enter 눌러도 검색 가능
$(document).on("keyup", "#dApplyText", function(event){
	if(event.keyCode == 13){
		$("#reply-insert").click();
	}
})	

// 댓글 게시를 눌렀을 때 / 댓글 작성
$(document).on("click", "#reply-insert", function(){
	if($("#dApplyText").val().trim() == ""){
		Swal.fire('댓글을 입력하세요!');
		return false;
	}
	$.ajax({
		type : "post",
		url : "/haruter/replyInsert",
		async : false,
		data : {
			"reply_content":$("#dApplyText").val(),
			"board_no":$("#dApplyBoardNo").val(),
			"ae_id":ae_id,
			"reply_type":$("#big-comment").attr("data-nick"),
			"ccg_r003":'공개',
			"board_ae_id":boardAeId
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
	 		console.log("res", res)
	 		if(res == "OK"){
		 		Swal.fire('작성 완료'); 			
	 		}
	 		replyPage = 1;
	 		boardDetail(boardTemp);
	 		
	 		// 만약 게시판 작성자와 댓글 작성자가 같지 않을 때에만 메세지 알림을 보낸다.
// 	 		if(ae_id != boardAeId){
// 				messageObj = { message : "OK",
// 			   		    			my : ae_id,
// 			   		   			   you : boardAeId
// 				};	 			
// 				websocket.send(JSON.stringify(messageObj));
// 	 		}

     	},
     	error: function(ex){
     		console.log("error", ex);
     	
     	}
	   });	
     $("#dApplyText").val("");
})

// 댓글리스트 초기화
$(document).on("click", ".commnet-append", function() {
	addView = $(this).parent();
	addView.css("display", "none");
	
	replyPage++;
    getReplyList(boardTemp);
});

// 대댓글리스트 초기화
$(document).on("click", ".sub-reply-append", function(){
	addView = $(this).parent();
	addView.css("display", "none");

	var dList = $(this).parent().parent().parent().find("[data-subReply='" + replyTemp + "']");
	
	subReplyPage++;
	getBigComment(replyTemp, dList);
})

//대댓글 작성하기
$(document).on("click", "#dReplyInsert", function(){
	var no = $(this).parent().attr("data-no");
	var no1 = $(this).parent().attr("data-nick");
	$("#all-cancle").css("display", "inline");
	$("#big-comment").attr("data-nick", no);
	$("#big-comment").text(no1);
})

//대댓글 작성취소
$(document).on("click","#all-cancle", function(){
	$("#all-cancle").css("display", "none");
	$("#big-comment").attr("data-nick", "all");
	$("#big-comment").text("all");
})

//대댓글 보기
$(document).on("click", "#dReplyView", function(){
	var no = $(this).parent().attr("data-no");
	var dList = $(this).parent().parent().parent().parent().find("[data-subReply='" + no + "']");
	
	var close = $(this).parent().find("#dReplyClose")
	var open = $(this);
	close.css("display", "contents");
	open.css("display", "none");
	getBigComment(no,dList);		// 대댓글 보기
})

//대댓글 닫기
$(document).on("click", "#dReplyClose", function(){
	subReplyPage = 1
	var no = $(this).parent().attr("data-no");
	var dList = $(this).parent().parent().parent().parent().find("[data-subReply='" + no + "']");
	dList.html("");
	
	var open = $(this).parent().find("#dReplyView")
	var close = $(this);
	
	close.css("display", "none");
	open.css("display", "contents");
})

//댓글 삭제
$(document).on("click", "#dReplyDelete", function(){
	replyTemp = $(this).parent().attr("data-reply");
	Swal.fire({
		  title: '댓글을 삭제하시겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			  $.ajax({
					type : "post",
					url : "/haruter/replyDelete",
					async : false,
					data : {
						"reply_no" : replyTemp,
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(res){
				 		replyPage = 1;
				 		boardDetail(boardTemp);
			     	},
			     	error: function(ex){
			     		console.log("error", ex);
			     	
			     	}
				 });
		  }
		})
	
})

//댓글 수정
$(document).on("click", "#dReplyUpdate", function(){
	replyTemp = $(this).parent().attr("data-reply");
	rModal.style.display = "block";
	rText.value = $(this).parent().parent().find("#dReplyProfile-content").text();
	if(rText.value.trim()==""){
		rText.value = $(this).parent().parent().parent().find("#dReplyProfile-content").text();	
	}
})

//댓글 수정 폼 이후 취소버튼
rCancleBtn.addEventListener("click", function(){
	Swal.fire({
		  title: '수정을 취소하시겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			 rModal.style.display = "none";
		  }
	})
})

//댓글 수정 폼 이후 수정버튼
rUpdateBtn.addEventListener("click", function(){
	Swal.fire({
		  title: '댓글을 수정하시겠습니까??',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			  var updateText = rText.value
			  
			  if(updateText.trim() == ""){
				  Swal.fire("수정할 댓글을 입력하세요!")
				  return false;
			  }

			  $.ajax({
					type : "post",
					url : "/haruter/updateApply",
					data : {
						"reply_no":replyTemp,
						"ae_id" : ae_id,
						"reply_content" : updateText,
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(res){
					   if(res == "OK"){
						   Swal.fire({
							   title: '수정 완료',
							   icon: 'success',
							   showCancelButton: false,
							   confirmButtonColor: '#3085d6',
							   confirmButtonText: '확인'
							 }).then((result) => {
							   if (result.isConfirmed) {
								   rModal.style.display = "none";
							 	   replyPage = 1;
							 	   boardDetail(boardTemp);
							   }
							 });
					   }else{
						  Swal.fire('삭제 실패! 다시 시도하세요');
					   }
			     	},
			     	error: function(ex){
			     		console.log("error", ex);
			     	}
				});	
			  	 
		  }
	})
})


//															삽입(작성) 부분

// 뒤로가기 누르기
mheaderBefore.addEventListener("click", function(){
	goBefore();
	page = page - 1;
})

// 다음으로 버튼 누르기
mheaderNext.addEventListener("click", function(){
	goNext();
	page = page + 1;
})

// 파일 선택 버튼 클릭
mimagesSelect.addEventListener("click", function(event){
	event.preventDefault();
	mimagesFile.click();
	page = page + 1;
})	

// 파일이 바뀌었을 때
mimagesFile.addEventListener("change", function(){
	tempEvent = event;
	
	imageLoad();
})


// 다음 이미지를 보여준다
imgSelectNextDiv.addEventListener("click", function(){
	classReset();
	inputFileNum = inputFileNum + 1; 
	imgSelect.classList.add(filterInfo[inputFileNum]);
	imageLoad();
})

// 이전 이미지를 보여준다.
imgSelectBeforeDiv.addEventListener("click", function(){
	classReset();
	inputFileNum = inputFileNum - 1; 
	imgSelect.classList.add(filterInfo[inputFileNum]);
	imageLoad();
})

// 필터를 클릭했을 때
imgFilters.forEach(img => {
  img.addEventListener("click", function() {
    const altText = img.getAttribute("alt");
    classReset();
    filterInfo[inputFileNum] = altText
    imgSelect.classList.add(filterInfo[inputFileNum]);
  });
});

// 필터 제거 클릭했을 때
removeFilter.addEventListener("click", function(){
	filterInfo[inputFileNum] = '0';
	classReset();	
})

//															알림 부분

// 각각의 알림 부분 눌렀을 때
$(document).on("click", "#echo-reply",function(){
	var boardNo = $(this).attr("data-board");
	boardDetail(boardNo);
})

};


//피드 목록 출력
function storyList() {
	console.log("currentPage : " + currentPage)
	console.log("searchSelect : " + feedSearchSelect.value)
	console.log("searchWord : " + feedSearchInput.value)
	console.log("searchType : " + feedSelect.value)
	console.log("ae_id : " + ae_id)
	$.ajax({
		type : "get",
		url : "/haruter/harustory",
		async : false,
		data : {
			"currentPage":currentPage,
			"searchSelect":feedSearchSelect.value,
			"searchWord":feedSearchInput.value,
			"searchType":feedSelect.value,
			"ae_id":ae_id
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			 for (let i = 0; i < res.length; i++) {
				    let postBox = document.createElement("div");
				    postBox.classList.add("post-box");
				    postBox.setAttribute("data-no", res[i].board_no);
	
				    let image = document.createElement("img");
				    image.classList.add(res[i].ua_etc);
				    image.classList.add("click-board")
				    image.src = "/upload/images/s_" + res[i].ua_stre_nm;
					
				    let postTitle = document.createElement("div");
				    postTitle.classList.add("post-title")
				    postTitle.classList.add("click-board")
				    let postTitleSpan = document.createElement("span")
					
				    var title = res[i].board_title.replaceAll(/<script>/gi, "");
				    
					if (res[i].board_title.length > 14) {
					   postTitleSpan.textContent = title.substring(0, 14) + "...";
			        }else{
					   postTitleSpan.textContent = title;
			        }
				    
				    postTitle.appendChild(postTitleSpan);
				    
				    let postInfo = document.createElement("div");
				    postInfo.classList.add("post-info");
	
				    let postProfile = document.createElement("div");
				    postProfile.classList.add("post-profile");
	
				    let postImg = document.createElement("div");
				    postImg.classList.add("post-img");
	
				    let profileImage = document.createElement("img");
				    profileImage.src = "/upload/images/" + res[i].mem_profile;
	
				    let profileName = document.createElement("h3");
				    profileName.textContent = res[i].mem_nicknm;
	
				    postImg.appendChild(profileImage);
				    postProfile.appendChild(postImg);
				    postProfile.appendChild(profileName);
	
				    let likes = document.createElement("div");
				    likes.classList.add("likes");
				    
				    let heartFilled = document.createElement("i");
	
					
				    if(res[i].rl_yn != null && res[i].rl_yn == "Y"){
					    heartFilled.classList.add("ri-heart-fill", "my-heart");	
				    }else{
				    	heartFilled.classList.add("ri-heart-line", "my-heart");
				    }
	
				    let likesCount = document.createElement("span");
				    likesCount.classList.add("add-heart-count");
				    likesCount.textContent = res[i].like_count
	
				    let eyeIcon = document.createElement("i");
				    eyeIcon.classList.add("ri-eye-line");
	
				    let viewsCount = document.createElement("span");
				    viewsCount.classList.add("eye_count");
				    viewsCount.textContent = res[i].inq_cnt;
	
				    likes.appendChild(heartFilled);
				    likes.appendChild(likesCount);
				    likes.appendChild(eyeIcon);
				    likes.appendChild(viewsCount);
				    
				    postInfo.appendChild(postProfile);
				    postInfo.appendChild(likes);
	
				    postBox.appendChild(image);
				    postBox.appendChild(postTitle);
				    postBox.appendChild(postInfo);
					
					myList.appendChild(postBox);
				};
				if(res.length < 8){
					scrollCheck = false;
				}else{
					scrollCheck = true;
				}
	    	},
	     	error: function(ex){
	     		console.log("error", ex);
	     	}
		});	
}

//처음에 적용된 모든 필터 제거
function classReset(){
	imgSelect.classList.value = "";
}

//상세모달 창 닫기
function dmodalClose(){
	dModal.style.display = "none";
	replyPage = 1
	replyList = "";
	detilaCheck = false;
	inputDetila = false;
	dImgCount = 0;		// 선언된 파일들의 갯수저장
	dImgNowCount = 0;	// 현재 위치 저장	
	dImgSrc = [];		// src 위치 저장
	dImgFilter = [];	// 필터 저장
}

//수정 폼 닫기
function MmodalClose(){
	uModal.style.display = "none";
}

//댓글 수정 폼 닫기
function RmodalClose(){
	rModal.style.display = "none"
}

//이미지 파일인지 체크(확장자를 이용해서)
function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 가져온다.
	return ($.inArray(ext, ["jpg","jpeg","png"]) === -1 ) ? false : true;
}

//피드 모두 초기화
function storyReset(){
	 while (myList.firstChild) {
	     myList.removeChild(myList.firstChild);
	 }
	 currentPage = 1;
	 storyList();
}

// 상세클릭 했을 때
function boardDetail(boardNo){
			detilaCheck = true;
			boardTemp = boardNo;
			
			var elementsWithDataBoard1 = $("#bell-div").find("[data-board='"+boardTemp+"']");

			// 원하는 작업을 수행합니다.
			elementsWithDataBoard1.each(function() {
				$(this).remove();
			});
			
			if($(".echo-count").length <= 0 && $("#bell-div").html() == ""){
				$("#yellow-bell").css("display", "none");
				$("#black-bell").css("display", "block");	
				$("#bell-div").css("display", "none");
				tempDiv =  "<div id='echo-reply'>"
				tempDiv += "		<span>알림이 없습니다.222</span>"
				tempDiv += "</div>";
				$("#bell-div").append(tempDiv);
			}
			
			$.ajax({
				type : "get",
				url : "/haruter/harustorys",
				async : false,
				data : {
					"board_no":boardTemp,
					"ae_id":ae_id
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(res){
					boardAeId = res.board.ae_id;
			 		dModal.style.display = "block"; // 보이게
					let tblStr = "";
					var title = res.board.board_title.replaceAll(/<script>/gi, "");
					var content = res.board.board_content.replaceAll(/<script>/gi, "");
					tblStr += "		<i onclick='dmodalClose()' class='ri-close-line mbtn'></i>";
					tblStr += "		<div class='dMcontainer'>";
					tblStr += "				<div id='dContent'>"
					tblStr += "					<div id='dImg'>"
					if(res.file.length >= 2){
						dImgCount = res.file.length;	
					for(let i = 0; i < res.file.length; i++){
						dImgSrc[i] = res.file[i].ua_stre_nm;
						dImgFilter[i] = res.file[i].ua_etc;						
					}
					tblStr += "						<i id='dImg-left' class=ri-arrow-left-circle-fill></i>"
					}else{
						dImgSrc[0] = res.file[0].ua_stre_nm;
						dImgFilter[0] = res.file[0].ua_etc;
					}						
					tblStr += "						<div id='dContent-img'><img id='dImgs' class='dimg "+dImgFilter[0]+"'src='/upload/images/s_"+dImgSrc[0]+"'/></div>";
					if(res.file.length >= 2){
					tblStr += "						<i id='dImg-right' class=ri-arrow-right-circle-fill></i>"
					}						
					tblStr += "					</div>"					
					tblStr += "					<div id='all-intro'>";
					tblStr += "						<div id='dMy-all'>";
					tblStr += "							<div id='dTitle'>";
					tblStr += "								<div id='dProfil'>";
					tblStr += "									<img class='dproimg' src='/upload/images/"+res.board.mem_profile+"'/>";					
					tblStr += "									<div id='dProfil-all'>";
					tblStr += "										<span id='dProfil-nick'>"+res.board.mem_nicknm+"</span>";
					tblStr += "										<div id='dProfil-title'>"+title+"</div>";					
					tblStr += "									</div>";
					tblStr += "								</div>";
					tblStr += "								<div id='detail-modal-div'>";
					if(ae_id == res.board.ae_id){
					tblStr += "									<a href='#' id='detail-btn'>:</a>";					
					}
					tblStr += "									<div id ='detail-modal'>";
					tblStr += "										<span id='update-span' data-no='"+boardNo+"' data-id='"+res.board.ua_no+"'>수정</span>";
					tblStr += "										<span id='delete-span' data-no='"+boardNo+"' data-id='"+res.board.ua_no+"'>삭제</span>";
					tblStr += "									</div>";
					tblStr += "								</div>";
					tblStr += "							</div>";
					tblStr += "							<div id='dContent-date'>";
					if(res.board.last_mdfcn_ymd != 0){						
					tblStr += "								<span id='write-date'>수정: "+res.board.last_mdfcn_ymd+"</span>";
					}else{
					tblStr += "								<span id='write-date'>"+res.board.wrt_ymd+"</span>";					
					}
					tblStr += "							</div>";
					tblStr += "							<div id='dContent-open'>";
					tblStr += "								<div id='dContent-open-all'>";
					tblStr += "									<span>내용펼치기</span>";
					tblStr += "									<img src='../resources/asset/image/bottom-arrow.png'>";
					tblStr += "								</div>";
					tblStr += "							</div>";
					tblStr += "							<div id='dContent-content'>";
					tblStr += "								<div id='dContent-span-div'>";					
					tblStr += " 								<span id='content-span'>"+content+"</span>";
					tblStr += "								</div>";
					tblStr += "								<div id='dContent-close'>";					
					tblStr += "									<div id='dContent-close-all'>";
					tblStr += "										<span>내용닫기</span>";
					tblStr += "										<img src='../resources/asset/image/up-arrow.png'>";
					tblStr += "									</div>";
					tblStr += "								</div>";
					tblStr += "							</div>";
					tblStr += "						</div>";
					tblStr += "						<div id='dReplyList'>";					
					tblStr += "						</div>";
					tblStr += "						<div id='dLike'>";
					tblStr += "							<div id='reply-status'>댓글 :<span id='big-comment' data-nick='all'>all</span>";
					tblStr += "							</div>";
					tblStr += "							<div id='like-status'>";
					tblStr += "								<span id='all-cancle'><i class='ri-close-line xBtn'></i></span>";					
					if(res.board.rl_yn != null && res.board.rl_yn == 'Y'){
					tblStr += "								<i class='ri-heart-fill my-heart i-size-set'></i>";				
					}else{
					tblStr += "								<i class='ri-heart-line my-heart i-size-set'></i>";				
					}			
					tblStr += "								<span class='add-heart-count'>"+res.board.like_count+"</span>";									
					tblStr += "								<i class='ri-eye-line i-size-set'></i>";
					tblStr += "								<span>"+res.board.inq_cnt+"</span>";
					tblStr += "							</div>";
					tblStr += "						</div>";
					tblStr += "						<div id='dApplyInput-div'>";
					tblStr += "							<div id='dApplyInput'>";
					tblStr += "								<input type='hidden' id='dApplyBoardNo' value='"+res.board.board_no+"'>";
					tblStr += "								<input type='text' id='dApplyText' placeholder='댓글을 작성하세요' maxlength = '100'/>";
					tblStr += "								<span id='reply-insert'>게시</span> " 
					tblStr += "							</div>";
					tblStr += "						</div>";
					tblStr += "					</div>";
					tblStr += "				</div>";
					tblStr += "		</div>";
					dModal.innerHTML = tblStr;
					getReplyList(boardNo); // 댓글리스트	
		     	},
		     	error: function(ex){
		     		console.log("error", ex); 	
		     	}
			   });	
		
}

// 댓글 리스트를 따로 뽑아오는 ajax
function getReplyList(boardNo){
	$.ajax({
			type : "get",
			url : "/haruter/getReplyList",
			async : false,
			data : {
				"board_no":boardNo,
				"currentPage": replyPage 
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				replyList = "";
				for(let j = 0; j < res.length; j++){
				var content = res[j].reply_content.replaceAll(/<script>/gi, "");
				replyList += "							<div class='dReplyTitleList'>";
				replyList += "								<div id='dReplyTitle'>";						
				replyList += "									<div id='dReplyProfile'>";						
				replyList += "										<img class='dReplyProimg' src='/upload/images/"+res[j].mem_profile+"'/>";					
				replyList += "										<div id='dReplyProfile-all'>";
				replyList += "											<span id='dReplyProfile-nick'>"+res[j].mem_nicknm+"</span>";
				replyList += "											<div id='dReplyProfile-content'>"+content+"</div>";					
				replyList += "										</div>";
				replyList += "									</div>";
				if(res[j].ae_id == ae_id){						
				replyList += "									<div id='dReplyStatus' data-reply ="+res[j].reply_no+">";
				replyList += "										<span id='dReplyUpdate'>수정</span>";
				replyList += "										<span id='dReplyDelete'>삭제</span>";					
				replyList += "									</div>";
				}
				replyList += "								</div>";					
				replyList += "								<div id='digComent-div'>";					
				replyList += "									<div id='allDate'>";
				if(res[j].reply_mdfcn_ymd != 0){						
				replyList += "										<span id='write-date'>수정: "+res[j].reply_mdfcn_ymd+"</span>";
				}else{
				replyList += "										<span id='write-date'>"+res[j].reply_wrt_ymd+"</span>";					
				}
				replyList += "									</div>";
				replyList += "									<div id='allComent-div' data-nick="+res[j].mem_nicknm+" data-no="+res[j].reply_no+">";
				if(res[j].reply_count != 0){
				replyList += "										<span id='dReplyView'>대댓글 "+res[j].reply_count+"개 보기</span>";
				replyList += "										<span id='dReplyClose' style='display: none;'>대댓글 닫기</span>";					
				}
				replyList += "										<span id='dReplyInsert'>대댓글 작성</span>";
				replyList += "									</div>";
				replyList += "								</div>";					
				replyList += "							</div>";
				replyList += "							<div class='dSubReplyTitleList' data-subReply="+res[j].reply_no+">";
				replyList += "							</div>";
				}
				if(res.length >= 8){						
				replyList += "							<div class='dReplyTitleList' style='text-align: center;'>";					
				replyList += "								<span class='commnet-append'>댓글 더보기</span>";
				replyList += "							</div>";
				}

	     	},
	     	error: function(ex){
	     		console.log("error", ex);
	     	
	     	}
	   });	
	$("#dReplyList").append(replyList);		
}

// 대댓글 보기
function getBigComment(replyNo, dList){
	replyTemp = replyNo;
	$.ajax({
		type : "get",
		url : "/haruter/getSubReplyList",
		async : false,
		data : {
			"reply_type":replyNo,
			"currentPage": subReplyPage 
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
				replyList = "";
			for(let j = 0; j < res.length; j++){
				var content = res[j].reply_content.replaceAll(/<script>/gi, "");
				replyList += "							<div class='dReplyTitleList' style='margin-left: 10px;''>";
				replyList += "								<div id='dReplyTitle'>";						
				replyList += "									<div id='dReplyProfile'>";				
				replyList += "										<span id='dSubReplyIcon'>└</span>";					
				replyList += "										<img class='dReplyProimg' src='/upload/images/"+res[j].mem_profile+"'/>";					
				replyList += "										<div id='dReplyProfile-all'>";
				replyList += "											<span id='dReplyProfile-nick'>"+res[j].mem_nicknm+"</span>";
				replyList += "											<div id='dReplyProfile-content'>"+content+"</div>";					
				replyList += "										</div>";
				replyList += "									</div>";
				replyList += "								</div>";
				replyList += "								<div id='allDate' class='dSubReplyDate'>";
				if(res[j].reply_mdfcn_ymd != 0){						
				replyList += "									<span id='write-date'>수정: "+res[j].reply_mdfcn_ymd+"</span>";
				}else{
				replyList += "									<span id='write-date'>"+res[j].reply_wrt_ymd+"</span>";					
				}
				if(res[j].ae_id == ae_id){						
				replyList += "									<div id='dReplyStatus' data-reply ="+res[j].reply_no+">";
				replyList += "										<span id='dReplyUpdate'>수정</span>";
				replyList += "										<span id='dReplyDelete'>삭제</span>";					
				replyList += "									</div>";
				}
				replyList += "								</div>";
				replyList += "							</div>";
			}
				if(res.length >= 5){						
				replyList += "							<div class='dReplyTitleList' style='text-align: center;'>";					
				replyList += "								<span class='sub-reply-append'>대댓글 더보기</span>";
				replyList += "							</div>";
				}
     	},
     	error: function(ex){
     		console.log("error", ex);
     	
     	}
   });		
	dList.append(replyList);	
}

// 좋아요 누르기
function likeHeart(){
	$(document).on("click", ".my-heart", function(){
		var clickedHeart = $(this);
		var addHeartCount = $(this).parent().find(".add-heart-count");
		var boardNo = clickedHeart.parent().parent().parent().attr("data-no");
		if(boardNo == null){
			boardNo = $("#update-span").attr("data-no");
		}		

		var detilaHeartCount = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find("[data-no="+boardNo+"]")
// 		.find("[data-no='"+boardNo+"]'");
		
		var heart = detilaHeartCount.find(".my-heart")
		var heartCount = detilaHeartCount.find(".add-heart-count")
		console.log("heartCount"+ heartCount.text())
	
		$.ajax({
			type : "post",
			url : "/haruter/likeCehck",
			data : {
				"board_no":boardNo,
				"ae_id" : ae_id,
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
			   if(res == "Y"){
				   if(detilaCheck){
					   clickedHeart.addClass("ri-heart-fill");
					   clickedHeart.removeClass("ri-heart-line");					   
					   heartCount.text(parseInt(heartCount.text()) + 1);
					   addHeartCount.text(parseInt(addHeartCount.text()) + 1);
					   heart.addClass("ri-heart-fill");
					   heart.removeClass("ri-heart-line");
				   }else{
					   addHeartCount.text(parseInt(addHeartCount.text()) + 1);
					   heart.addClass("ri-heart-fill");
					   heart.removeClass("ri-heart-line");					   
				   }
			   }else if(res == "N"){
				   if(detilaCheck){
					   clickedHeart.removeClass("ri-heart-fill");
					   clickedHeart.addClass("ri-heart-line");				   
					   heartCount.text(parseInt(heartCount.text()) - 1);
					   addHeartCount.text(parseInt(addHeartCount.text()) - 1);
					   heart.removeClass("ri-heart-fill");
					   heart.addClass("ri-heart-line");
				   }else{
					   heart.addClass("ri-heart-line");
					   heart.removeClass("ri-heart-fill");					   
					   addHeartCount.text(parseInt(addHeartCount.text()) - 1);
				   }
			   }
	     	},
	     	error: function(ex){
	     		console.log("error Y", ex);
	     	}
		});	
	})
}

//필터 초기화
function filterReset(){
	for(let i = 0; i < maxFile; i++){
		filterInfo[i] = "0";
	}
}

// 모달 열기
function fModalOpen() {
	Modal.style.display = "block"; // 보이게
	document.body.style.overflowY = "hidden";
	page = 0;
	inputModal = false;
}

// 모달 닫기
function modalClose(){
	inputModal = true;												// 닫을 때는 상태 10으로
	goBefore();
}

// 	insert 모달 창 닫기 전 초기화
function fmodalReset() {
	if(inputModal == true){
		Modal.style.display = "none"; // 안보이게	
		inputModal = false;
	}
	
	page = 0;
	// 첫번째 화면 제외하고 모두 초기화
	mimagesDiv.style.display = "block";							// 첫번째 화면으로 보이기
	mheaderText.textContent = "사진 추가";						// 타이틀 사진 추가로 초기화	
	mheaderNext.style.display = "none";							// 다음가기 버튼 안보이기
	mheaderBefore.style.display = "none";						// 이전가기 버튼 안보이기
	mContainer.style.width = "40%";								// 크기 40으로 초기화
	classReset();												// img에 적용된 필터 모두 제거
	imgFilterDiv.style.display = "none";						// 두번째 화면 안보이기
	imgFilter.style.display = "block";
	textDiv.style.display = "none";								// 세번째 화면 안보이기
	textTitle.value = ""											// 제목 리셋
	textContent.value = ""
	mheaderNext.textContent = "다음";							// 두번째의 페이지에 바로 다음 보이게 하기
	document.body.style.overflowY = "unset";					// 드래그 안보이게
	mimagesFile.value = "";										// 선택한 파일들 초기화
	inputFileNum = 0;											// 선택 파일 초기화
	tempEvent = '';												// 임시 저장 파일들 초기화(event 초기화);
	filterReset();												// 필터 초기화
	storyReset();
}	


//뒤로가기 눌렀을 때 다양한 상황들 처리
function goBefore(){
	var tempTitle = "";
	if(page==1 && inputModal == false){
		tempTitle = '게시글 작성을 멈추겠습니까?'			
	}else if(page == 2 && inputModal == false){
		textDiv.style.display = "none";
		imgFilter.style.display = "block";
		mheaderText.textContent = "필터 적용";
		mheaderNext.textContent = "다음";
	}else if(inputModal == true){
		tempTitle = '작성 기록이 사라집니다. 그래도 나가겠습니까?';
	}
	if(page == 1 || inputModal == true){
		Swal.fire({
			  title: tempTitle,
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			  width: '800px'
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  fmodalReset()
			  } else{
				  if(inputModal == true){
					  inputModal = false;					  
				  }else{
					  page = page + 1;				  
				  }
				  return false;
			  }
		})	
	}
}

//다음버튼 눌렀을 때 다양한 상황들 처리 (3번째 모달 이동 / 게시글 공유)
function goNext(){
	if(page==1){
		textDiv.style.display = "block";
		imgFilter.style.display = "none";
		mheaderText.textContent = "제목/내용 입력";
		mheaderNext.textContent = "공유하기";
	}else if(page==2){
		if(textTitle.value.trim() == ""){
			Swal.fire("제목을 작성해주세요!");
			page = page - 1;
			textTitle.focus();
			return false;
		}
		
		if(textContent.value.trim() == ""){
			Swal.fire("내용을 작성해주세요!");
			page = page - 1;
			textContent.focus();
			return false;			
		}
		insertFeed();
	}
}

// 피드 추가하기
function insertFeed(){
	Swal.fire({
		  title: "게시물을 공유하시겠습니까?",
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
			var form = new FormData();
		
			form.append("board_title",textTitle.value);
			form.append("board_content",textContent.value);
			form.append("ccg_b004", "자유게시판");
			for (var i = 0; i < mimagesFile.files.length; i++) {
			   form.append("imgFile", mimagesFile.files[i]);
			 }
			form.append("ae_id", ae_id);
			form.append("filters", filterInfo);
			
			$.ajax({
				type : "post",
				url : "/haruter/insertFeed",
				data: form,
			    processData: false,
			    contentType: false,
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(res){
					if(res=='OK'){
						Swal.fire({
							  icon: 'success',
							  title: '피드가 공유되었습니다!',
							})  
						inputModal = true;
						fmodalReset();
						storyReset();
					}else{
						Swal.fire({
							  icon: 'error',
							  title: '서버 에러! 다시 공유해주세요!',
						})	
						page = page - 1;
						inputModal = false;
						return false;
					}
		     	},
		     	error: function(ex){
		     		console.log("error", ex);
		     		inputModal = true;
					page = page - 1;
		     	}
			});	
		  } else{
			  page = page - 1;
			  return false;
		  }

	});
}

//선택한 이미지 하나 보여주기
function imageLoad(){
	if(mimagesFile.files.length > maxFile){
		Swal.fire({
			  icon: 'error',
			  title: '사진은 최대 '+maxFile+'개까지만 가능합니다!',
			})
	}
	var fileTempNm = tempEvent.target.files[inputFileNum];	// 보여줄 이미지만 보여준다.

	if(mimagesFile.files.length > 1 && (inputFileNum+1) < mimagesFile.files.length){
		imgSelectNextDiv.style.display = "block";
	}else{
		imgSelectNextDiv.style.display = "none";		
	}
	
	if(mimagesFile.files.length > 1 && inputFileNum > 0){
		imgSelectBeforeDiv.style.display = "block";
	}else{
		imgSelectBeforeDiv.style.display = "none";		
	}
	
	if (mimagesFile.files.length > 0 && mimagesFile.files.length < 6) { // 파일이 선택되었는지 확인
	
		// 선택한 파일을 썸네일로 onload될 때 효과
	    if (isImageFile(fileTempNm)) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	    	mContainer.style.width = "60%";				
	    	mHeader.style.justifyContent = "space-between"
	        mimagesDiv.style.display = "none";
	    	imgFilterDiv.style.display = "flex";
	
	        mheaderBefore.style.display = "block";
	        mheaderNext.style.display = "block";
	        imgSelect.src = e.target.result;
	    	mheaderText.textContent = "필터 적용";
	      }
	      reader.readAsDataURL(fileTempNm);
	    } else {
	    	Swal.fire("이미지 파일을 선택해주세요!")
	    }
	 }
}
</script>