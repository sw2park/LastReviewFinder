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




