const fwStars = document.querySelector(".free_weight .ratings").children;
const fwRatingValue = document.querySelector(".free_weight .rating-value");
const fwRatingValueDisplay = document.querySelector(".free_weight .rating-value-display");

let fwIndex;


for(let i=0; i<fwStars.length; i++){
	console.log(fwStars.length)
	// 星にカーソルが乗ったときに実行する関数を定義
	fwStars[i].addEventListener("mouseover",function(){
		// fwStars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<fwStars.length; j++){
			console.log(fwStars.length)
			// まず全て星をくり抜く
			fwStars[j].classList.remove("fa-star");
			fwStars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=i; j++){
			console.log(fwStars.length)
			fwStars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			fwStars[j].classList.add("fa-star");
		}
	})
  fwStars[i].addEventListener("click", function(){
    fwRatingValue.value = i + 1;
    fwRatingValueDisplay.textContent = fwRatingValue.value;
    fwIndex = i;
  })
  fwStars[i].addEventListener("mouseout",function(){
		// fwStars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<fwStars.length; j++){
			console.log(fwStars.length)
			// まず全て星をくり抜く
			fwStars[j].classList.remove("fa-star");
			fwStars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=fwIndex; j++){
			console.log(fwStars.length)
			fwStars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			fwStars[j].classList.add("fa-star");
		}
	})
}

const machineStars = document.querySelector(".machine .ratings").children;
const machineRatingValue = document.querySelector(".machine .rating-value");
const machineRatingValueDisplay = document.querySelector(".machine .rating-value-display");

let machineIndex;


for(let i=0; i<machineStars.length; i++){
	console.log(machineStars.length)
	// 星にカーソルが乗ったときに実行する関数を定義
	machineStars[i].addEventListener("mouseover",function(){
		// machineStars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<machineStars.length; j++){
			console.log(machineStars.length)
			// まず全て星をくり抜く
			machineStars[j].classList.remove("fa-star");
			machineStars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=i; j++){
			console.log(machineStars.length)
			machineStars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			machineStars[j].classList.add("fa-star");
		}
	})
  machineStars[i].addEventListener("click", function(){
    machineRatingValue.value = i + 1;
    machineRatingValueDisplay.textContent = machineRatingValue.value;
    machineIndex = i;
  })
  machineStars[i].addEventListener("mouseout",function(){
		// machineStars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<machineStars.length; j++){
			console.log(machineStars.length)
			// まず全て星をくり抜く
			machineStars[j].classList.remove("fa-star");
			machineStars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=machineIndex; j++){
			console.log(machineStars.length)
			machineStars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			machineStars[j].classList.add("fa-star");
		}
	})
}

const caedioStars = document.querySelector(".caedio .ratings").children;
const caedioRatingValue = document.querySelector(".caedio .rating-value");
const caedioRatingValueDisplay = document.querySelector(".caedio .rating-value-display");

let caedioIndex;


for(let i=0; i<caedioStars.length; i++){
	console.log(caedioStars.length)
	// 星にカーソルが乗ったときに実行する関数を定義
	caedioStars[i].addEventListener("mouseover",function(){
		// caedioStars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<caedioStars.length; j++){
			console.log(caedioStars.length)
			// まず全て星をくり抜く
			caedioStars[j].classList.remove("fa-star");
			caedioStars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=i; j++){
			console.log(caedioStars.length)
			caedioStars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			caedioStars[j].classList.add("fa-star");
		}
	})
  caedioStars[i].addEventListener("click", function(){
    caedioRatingValue.value = i + 1;
    caedioRatingValueDisplay.textContent = caedioRatingValue.value;
    caedioIndex = i;
  })
  caedioStars[i].addEventListener("mouseout",function(){
		// caedioStars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<caedioStars.length; j++){
			console.log(caedioStars.length)
			// まず全て星をくり抜く
			caedioStars[j].classList.remove("fa-star");
			caedioStars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=caedioIndex; j++){
			console.log(caedioStars.length)
			caedioStars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			caedioStars[j].classList.add("fa-star");
		}
	})
}

// ここからは下書き
// const arr = [
//   {checkpoint: free_weight},{checkpoint: machine},{checkpoint: caedio}
// ]
//
// for(let i=0; i<fwStars.length; i++){
//   const fwStars = document.querySelector(".free_weight .ratings").children;
//   const fwRatingValue = document.querySelector(".free_weight .rating-value");
//   const fwRatingValueDisplay = document.querySelector(".free_weight .rating-value-display");
// }
//
//
//
// let index;
//
// for(let i=0; j<fwStars.length; j++){
// 	console.log(fwStars.length)
// 	// 星にカーソルが乗ったときに実行する関数を定義
// 	fwStars[j].addEventListener("mouseover",function(){
// 		// fwStars.lengthの値（5）だけ繰り返し
// 		// つまり、星カーソルが乗った時、5回繰り返される
// 		for(let k=0; k<fwStars.length; k++){
// 			console.log(fwStars.length)
// 			// まず全て星をくり抜く
// 			fwStars[k].classList.remove("fa-star");
// 			fwStars[k].classList.add("fa-star-o")k
// 		}
// 		// そのあと星の数だけ以下の関数が繰り返される。
// 		for(let k=0; k<=j; k++){
// 			console.log(fwStars.length)
// 			fwStars[k].classList.remove("fa-star-o");
// 			// カーソルが乗った星まで星を塗りつぶす
// 			fwStars[k].classList.add("fa-star");
// 		}
// 	})
//   fwStars[k].addEventListener("click", function(){
//     fwRatingValue.value = j + 1;
//     fwRatingValueDisplay.textContent = fwRatingValue.value;
//     index = j;
//   })
//   fwStars[i].addEventListener("mouseout",function(){
// 		// fwStars.lengthの値（5）だけ繰り返し
// 		// つまり、星カーソルが乗った時、5回繰り返される
// 		for(let k=0; k<fwStars.length; k++){
// 			console.log(fwStars.length)
// 			// まず全て星をくり抜く
// 			fwStars[k].classList.remove("fa-star");
// 			fwStars[k].classList.add("fa-star-o");
// 		}
// 		// そのあと星の数だけ以下の関数が繰り返される。
// 		for(let k=0; k<=index; k++){
// 			console.log(fwStars.length)
// 			fwStars[k].classList.remove("fa-star-o");
// 			// カーソルが乗った星まで星を塗りつぶす
// 			fwStars[k].classList.add("fa-star");
// 		}
// 	})
// }
