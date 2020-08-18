const stars = document.querySelector(".ratings").children;
const ratingValue = document.getElementById("rating-value");
const ratingValueDisplay = document.getElementById("rating-value-display");

let index;

for(let i=0; i<stars.length; i++){
	console.log(stars.length)
	// 星にカーソルが乗ったときに実行する関数を定義
	stars[i].addEventListener("mouseover",function(){
		// stars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<stars.length; j++){
			console.log(stars.length)
			// まず全て星をくり抜く
			stars[j].classList.remove("fa-star");
			stars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=i; j++){
			console.log(stars.length)
			stars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			stars[j].classList.add("fa-star");
		}
	})
  stars[i].addEventListener("click", function(){
    ratingValue.value = i + 1;
    ratingValueDisplay.textContent = ratingValue.value;
    index = i;
  })
  stars[i].addEventListener("mouseout",function(){
		// stars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<stars.length; j++){
			console.log(stars.length)
			// まず全て星をくり抜く
			stars[j].classList.remove("fa-star");
			stars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=index; j++){
			console.log(stars.length)
			stars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			stars[j].classList.add("fa-star");
		}
	})
}
