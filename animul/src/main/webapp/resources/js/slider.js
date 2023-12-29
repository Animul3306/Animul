var slideIndex = 1;

showSlides(slideIndex);

// 이전/다음 버튼 클릭 시 호출되는 함수
function plusSlides(n) {
    showSlides(slideIndex += n);
}

// 현재 슬라이드 인덱스를 갱신하고 화면에 보여주는 함수
function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");

    if (n > slides.length) {
        slideIndex = 1;
    }

    if (n < 1) {
        slideIndex = slides.length;
    }

    // 모든 슬라이드를 숨김
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    // 현재 인덱스의 슬라이드를 보여줌
    slides[slideIndex - 1].style.display = "block";
}