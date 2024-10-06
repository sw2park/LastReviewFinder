//function setupSlider(sliderId, prevBtnId, nextBtnId) {
//    let currentIndex = 0; // 현재 슬라이드 인덱스
//    const itemsPerPage = 5; // 한 페이지에 보여줄 아이템 수
//
//    const sliderWrapper = document.querySelector(`#${sliderId} .slider-wrapper`);
//    const slideItems = document.querySelectorAll(`#${sliderId} .slide-item`);
//
//    document.getElementById(prevBtnId).addEventListener('click', showPreviousSlide);
//    document.getElementById(nextBtnId).addEventListener('click', showNextSlide);
//
//    function updateSliderPosition() {
//        const slideWidth = slideItems[0].offsetWidth + parseInt(getComputedStyle(slideItems[0]).marginLeft) + parseInt(getComputedStyle(slideItems[0]).marginRight);
//        const newTranslateX = -(currentIndex * slideWidth * itemsPerPage);
//        sliderWrapper.style.transform = `translateX(${newTranslateX}px)`;
//    }
//
//    function showPreviousSlide() {
//        if (currentIndex > 0) {
//            currentIndex--;
//            updateSliderPosition();
//        }
//    }
//
//    function showNextSlide() {
//        if (currentIndex < Math.ceil(slideItems.length / itemsPerPage) - 1) {
//            currentIndex++;
//            updateSliderPosition();
//        }
//    }
//}
//
//// 각 슬라이더 초기화
//setupSlider('thisMonthSlider', 'prevBtnThisMonth', 'nextBtnThisMonth');
//setupSlider('lastMonthSlider', 'prevBtnLastMonth', 'nextBtnLastMonth');
//setupSlider('lastLastMonthSlider', 'prevBtnLastLastMonth', 'nextBtnLastLastMonth');


function setupSlider(sliderId, prevBtnId, nextBtnId) {
    let currentIndex = 0; // 현재 슬라이드 인덱스
    const itemsPerPage = 5; // 한 페이지에 보여줄 아이템 수를 5로 설정

    const sliderWrapper = document.querySelector(`#${sliderId} .slider-wrapper`);
    const slideItems = document.querySelectorAll(`#${sliderId} .slide-item`);

    document.getElementById(prevBtnId).addEventListener('click', showPreviousSlide);
    document.getElementById(nextBtnId).addEventListener('click', showNextSlide);

    function updateSliderPosition() {
        // 슬라이드 아이템의 너비와 좌우 마진을 계산하여 slideWidth를 설정합니다.
        const slideWidth = slideItems[0].offsetWidth + 
                           parseInt(getComputedStyle(slideItems[0]).marginLeft) + 
                           parseInt(getComputedStyle(slideItems[0]).marginRight);
        const newTranslateX = -(currentIndex * slideWidth * itemsPerPage); // 5개씩 이동
        sliderWrapper.style.transform = `translateX(${newTranslateX}px)`;
    }

    function showPreviousSlide() {
        if (currentIndex > 0) {
            currentIndex--;
            updateSliderPosition();
        }
    }

    function showNextSlide() {
        if (currentIndex < Math.ceil(slideItems.length / itemsPerPage) - 1) {
            currentIndex++;
            updateSliderPosition();
        }
    }
}

// 각 슬라이더 초기화
setupSlider('thisMonthSlider', 'prevBtnThisMonth', 'nextBtnThisMonth');
setupSlider('lastMonthSlider', 'prevBtnLastMonth', 'nextBtnLastMonth');
setupSlider('lastLastMonthSlider', 'prevBtnLastLastMonth', 'nextBtnLastLastMonth');
