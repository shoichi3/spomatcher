function review(){
  const stars = document.querySelectorAll('#star');
  const ratingValue = document.getElementById('rating-value');
  const ratingValueDisplay = document.getElementById('rating-value-display');
  let index;
  
  for(let i = 0; i < stars.length; i++) {
    stars[i].addEventListener('mouseover', function(){
      for(let j = 0; j < stars.length; j++) {
        stars[j].removeAttribute('class', 'fas fa-star')
        stars[j].setAttribute('class', 'far fa-star')
      }
      for(let j = 0; j <= i; j++) {
        stars[j].removeAttribute('class', 'far fa-star')
        stars[j].setAttribute('class', 'fas fa-star')
      }
    });

    stars[i].addEventListener('click', function(){
      ratingValue.value = i + 1;
      ratingValueDisplay.textContent = ratingValue.value;
      index = i;
    });

    stars[i].addEventListener('mouseout', function(){
      for(let j = 0; j < stars.length; j++) {
        stars[j].removeAttribute('class', 'fas fa-star')
        stars[j].setAttribute('class', 'far fa-star')
      }
      for(let j = 0; j <= index; j++) {
        stars[j].removeAttribute('class', 'far fa-star')
        stars[j].setAttribute('class', 'fas fa-star')
      }
    });
  }
}

window.addEventListener('load', review);