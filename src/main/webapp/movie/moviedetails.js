/**
 * 
 *//**
* 
*/
$(document).ready(function () {
	var rating = 0;
	let movie_num = $("#movie_num").val();
	
	// 마우스가 별 위로 올라갔을 때
	$('.star').on('mouseenter', function () {
		var value = $(this).data('value');
		highlightStars(value);
	});

	// 마우스가 별에서 벗어났을 때
	$('.star').on('mouseleave', function () {
		highlightStars(rating); // 현재 선택된 별로 돌아가기
	});

	// 별 클릭 시 선택된 별로 고정
	$('.star').on('click', function () {
		rating = $(this).data('value');
		highlightStars(rating);
	});

	// 별을 하이라이트하는 함수
	function highlightStars(value) {
		$('.star').each(function () {
			if ($(this).data('value') <= value) {
				$(this).addClass('hovered');
			} else {
				$(this).removeClass('hovered');
			}
		});
	}
	$("#n-total-rating").on('click',function(){
		alert("로그인 후 이용 가능합니다.");
	});
	/* 평점 매기기 클릭 시 ajax로 통신 */
	$("#total-rating").on('click', function () {
		alert(rating+" 점이 반영되었습니다.");
		$.ajax({
			type: "POST",
			data: {
				rating: rating,
				movie_num: movie_num
			},
			url: "/movie/SetMovieRating.mv",
			success: function(response){
				$("#rating-score").html(response);
			},
			error: function(xhr, status, error){
				alert("AJAX 오류: " + error);
			}
		});
		$(this).off('click').on('click', function() {
		       alert("이미 평가하셨습니다.");
		   });
	});
	function adjustMargin() {
        // 각각의 movie-banner 요소에 대해 처리
        $('.movie-banner').each(function() {
            let banner = $(this); // 현재 movie-banner 요소
            let movieStill = banner.find('.movie-still'); // 해당 banner 안의 movie-still 이미지

            // 높이 비교 후 overflow 여부 확인
            if (movieStill.height() > banner.height()) {
                // 가운데 정렬을 위한 margin-top 계산식
                let marginTopValue = -( (movieStill.height() - banner.height()) / 2 ) + 'px';
                movieStill.css('margin-top', marginTopValue);
            } else {
                // overflow가 발생하지 않으면 margin-top을 0으로 설정
                movieStill.css('margin-top', '0');
            }
        });
    }
	adjustMargin();
	$(window).resize(adjustMargin);
});

let currentIndex = 0;

const sliderContainer = document.querySelector('.slider-container');
const sliderWrapper = document.querySelector('.slider-wrapper');
const slideItems = document.querySelectorAll('.slide-item');

document.getElementById('prevBtn').addEventListener('click', showPreviousSlide);
document.getElementById('nextBtn').addEventListener('click', showNextSlide);

function calculateItemsPerPage() {
	const slideItem = slideItems[0];
	const slideWidth = slideItem.getBoundingClientRect().width
		+ parseFloat(getComputedStyle(slideItem).marginLeft)
		+ parseFloat(getComputedStyle(slideItem).marginRight);
	const containerWidth = sliderContainer.getBoundingClientRect().width;
	return Math.max(Math.floor(containerWidth / slideWidth), 1); // 최소 1개
}

function updateSliderPosition() {
	const slideItem = slideItems[0];
	const slideWidth = slideItem.getBoundingClientRect().width
		+ parseFloat(getComputedStyle(slideItem).marginLeft)
		+ parseFloat(getComputedStyle(slideItem).marginRight);

	const totalSlides = slideItems.length;
	const itemsPerPage = calculateItemsPerPage();

	const maxIndex = totalSlides - itemsPerPage;

	// currentIndex가 범위를 벗어나지 않도록 조정
	if (currentIndex > maxIndex) {
		currentIndex = maxIndex;
	} else if (currentIndex < 0) {
		currentIndex = 0;
	}

	// 슬라이더 위치 업데이트
	let translateX = -(currentIndex * slideWidth);

	// 마지막 슬라이드에서 오버스크롤링 방지
	const maxTranslateX = -(totalSlides * slideWidth - sliderContainer.getBoundingClientRect().width);
	if (translateX < maxTranslateX) {
		translateX = maxTranslateX;
	}

	sliderWrapper.style.transform = `translateX(${translateX}px)`;

	updateButtons(maxIndex);
}

function showPreviousSlide() {
	currentIndex--;
	updateSliderPosition();
}

function showNextSlide() {
	currentIndex++;
	updateSliderPosition();
}

function updateButtons(maxIndex) {
	document.getElementById('prevBtn').disabled = currentIndex === 0;
	document.getElementById('nextBtn').disabled = currentIndex >= maxIndex;
	// 이전 버튼 숨기기/보이기
	if (currentIndex === 0) {
		prevBtn.style.display = 'none';
	} else {
		prevBtn.style.display = 'block';
	}

	// 다음 버튼 숨기기/보이기
	if (currentIndex >= maxIndex) {
		nextBtn.style.display = 'none';
	} else {
		nextBtn.style.display = 'block';
	}
}

// 창 크기가 변경될 때 슬라이더 업데이트
window.addEventListener('resize', updateSliderPosition);

// 초기 슬라이더 위치 설정
window.onload = function () {
	updateSliderPosition();
};

// 유저가 null인 경우
function user_null(){
	alert("로그인 후 이용 가능합니다.");	
};

function wishlist(){
	let movie_num = $("#movie_num").val();
	let userid = $("#userid").val();
	$.ajax({
		type: "POST",
		data: {movie_num: movie_num, userid: userid},
		url: "/movie/WishList.fv",
		success: function(response){
			alert(response);
		},
		error: function(xhr, status, error){
			alert("AJAX 오류: " + error);
		}
	});
}

/*function comment(){
	
		
}
*/
function comment(){
	let movie_num = $("#movie_num").val();
	let userid = $("#userid").val();
	$.ajax({
		type: "POST",
		data: {movie_num: movie_num, userid: userid},
		url: "/movie/Comment.cm",
		success: function(response){
			alert(response);
		},
		error: function(xhr, status, error){
			alert("AJAX 오류: " + error);
		}
	});
}

// 코멘트 모달 요소 선택
const commentModal = document.getElementById("commentModal");
const closeModal = document.getElementsByClassName("close")[0];

// 모달 열기 후 textarea 크기 조정
function comment() {
    $.ajax({
        url: "/qnaboard/comment-write.jsp",
        type: "GET",
        success: function (data) {
            // 코멘트 작성 폼을 모달 콘텐츠에 삽입
            $("#commentFormContainer").html(data);
            // 모달 보이기
            commentModal.style.display = "block";
            
			// textarea 크기 동적 조정
			const textarea = document.querySelector(".write textarea");
			if (textarea) {
			    const modalContent = document.querySelector(".modal-content");
			    
			    // 모달 콘텐츠의 너비와 높이 가져오기
			    const modalHeight = modalContent.clientHeight;
			    const modalWidth = modalContent.clientWidth;

			    // 모달 콘텐츠 높이의 70%를 textarea 높이로 설정
			    textarea.style.height = (modalHeight * 0.7) + "px";
			    
			    // 모달 콘텐츠 너비의 90%를 textarea 너비로 설정
			    textarea.style.width = (modalWidth * 0.87) + "px";
			}
        },
        error: function () {
            alert("코멘트 작성 페이지를 불러오는 데 실패했습니다.");
        }
    });
};

// 모달 닫기 버튼 클릭 시 모달 닫기
closeModal.onclick = function() {
    commentModal.style.display = "none";
};

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
    if (event.target === commentModal) {
        commentModal.style.display = "none";
    }
};

function reset(){
	commentModal.style.display = "none";
}

function write_comment(){
	let comment_contents = $("#comment_contents").val();
	if(comment_contents==null || comment_contents.trim()==""){
		alert("내용을 입력해 주세요");
	}
	else{
		$.ajax({
			type: "POST",
			data: {
				comment_contents: comment_contents
			},
			url: "/comment/Comment.cm",
			success: function(response){
				$("#rating-score").html(response);
			},
			error: function(xhr, status, error){
				alert("AJAX 오류: " + error);
			}
		});
	}
}
