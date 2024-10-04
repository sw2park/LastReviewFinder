/**
 * 
 *//**
* 
*/
$(document).ready(function () {
	var rating = 0;

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

	/* 평점 매기기 클릭 시 ajax로 통신 */
	$("#total-rating").on('click', function () {
		$.ajax({
			type: "POST",
			data: {rating: rating},
			url: "/movie/SetMovieRating.mv",
			success: function(response){
				$("#rating-score").html(response);
			},
			error: function(xhr, status, error){
				alert("AJAX 오류: " + error);
			}
		});
	});
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
