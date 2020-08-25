const fwStars = document.querySelector(".free_weight .ratings").children;
const fwRatingValue = document.querySelector(".free_weight .rating-value");
const fwRatingValueDisplay = document.querySelector(".free_weight .rating-value-display");

let fwIndex;


for(let i=0; i<fwStars.length; i++){
	console.log(fwStars.length)
	fwStars[i].addEventListener("mouseover",function(){
		for(let j=0; j<fwStars.length; j++){
			console.log(fwStars.length)
			fwStars[j].classList.remove("fa-star");
			fwStars[j].classList.add("fa-star-o");
		}
		for(let j=0; j<=i; j++){
			console.log(fwStars.length)
			fwStars[j].classList.remove("fa-star-o");
			fwStars[j].classList.add("fa-star");
		}
	})
  fwStars[i].addEventListener("click", function(){
    fwRatingValue.value = i + 1;
    fwRatingValueDisplay.textContent = fwRatingValue.value;
    fwIndex = i;
  })
  fwStars[i].addEventListener("mouseout",function(){
		for(let j=0; j<fwStars.length; j++){
			console.log(fwStars.length)
			fwStars[j].classList.remove("fa-star");
			fwStars[j].classList.add("fa-star-o");
		}
		for(let j=0; j<=fwIndex; j++){
			console.log(fwStars.length)
			fwStars[j].classList.remove("fa-star-o");
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
	machineStars[i].addEventListener("mouseover",function(){
		for(let j=0; j<machineStars.length; j++){
			console.log(machineStars.length)
			machineStars[j].classList.remove("fa-star");
			machineStars[j].classList.add("fa-star-o");
		}
		for(let j=0; j<=i; j++){
			console.log(machineStars.length)
			machineStars[j].classList.remove("fa-star-o");
			machineStars[j].classList.add("fa-star");
		}
	})
  machineStars[i].addEventListener("click", function(){
    machineRatingValue.value = i + 1;
    machineRatingValueDisplay.textContent = machineRatingValue.value;
    machineIndex = i;
  })
  machineStars[i].addEventListener("mouseout",function(){
		for(let j=0; j<machineStars.length; j++){
			console.log(machineStars.length)
			machineStars[j].classList.remove("fa-star");
			machineStars[j].classList.add("fa-star-o");
		}
		for(let j=0; j<=machineIndex; j++){
			console.log(machineStars.length)
			machineStars[j].classList.remove("fa-star-o");
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
	caedioStars[i].addEventListener("mouseover",function(){
		for(let j=0; j<caedioStars.length; j++){
			console.log(caedioStars.length)
			caedioStars[j].classList.remove("fa-star");
			caedioStars[j].classList.add("fa-star-o");
		}
		for(let j=0; j<=i; j++){
			console.log(caedioStars.length)
			caedioStars[j].classList.remove("fa-star-o");
			caedioStars[j].classList.add("fa-star");
		}
	})
  caedioStars[i].addEventListener("click", function(){
    caedioRatingValue.value = i + 1;
    caedioRatingValueDisplay.textContent = caedioRatingValue.value;
    caedioIndex = i;
  })
  caedioStars[i].addEventListener("mouseout",function(){
		for(let j=0; j<caedioStars.length; j++){
			console.log(caedioStars.length)
			caedioStars[j].classList.remove("fa-star");
			caedioStars[j].classList.add("fa-star-o");
		}
		for(let j=0; j<=caedioIndex; j++){
			console.log(caedioStars.length)
			caedioStars[j].classList.remove("fa-star-o");
			caedioStars[j].classList.add("fa-star");
		}
	})
}
