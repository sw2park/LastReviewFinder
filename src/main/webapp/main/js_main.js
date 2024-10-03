/**
 * 
 */
// 현재 슬라이드 인덱스 (0부터 시작)
// 현재 슬라이드 인덱스 (0부터 시작)
let currentIndex = 0;
const itemsPerPage = 5; // 한 페이지에 보여줄 아이템 수

// 슬라이드 래퍼와 슬라이드 아이템들을 가져옴
const sliderWrapper = document.querySelector('.slider-wrapper');
const slideItems = document.querySelectorAll('.slide-item');

// 버튼 이벤트 리스너 추가
document.getElementById('prevBtn').addEventListener('click', showPreviousSlide);
document.getElementById('nextBtn').addEventListener('click', showNextSlide);

// 슬라이드 이동 함수 (좌우로 슬라이드할 때)
function updateSliderPosition() {
    const slideWidth = slideItems[0].offsetWidth + 550; // 슬라이드 아이템 폭 + 마진
    const newTranslateX = -(currentIndex * slideWidth);
    sliderWrapper.style.transform = `translateX(${newTranslateX}px)`;
}

// 이전 슬라이드 표시
function showPreviousSlide() {
    if (currentIndex > 0) {
        currentIndex--;
        updateSliderPosition();
    }
}

// 다음 슬라이드 표시
function showNextSlide() {
    if (currentIndex < Math.floor(slideItems.length / itemsPerPage)) {
        currentIndex++;
        updateSliderPosition();
    }
}