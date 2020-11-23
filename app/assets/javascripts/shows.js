var score1 = document.getElementById("p120");
var score2 = document.getElementById("p220");

score1.innerHTML = score1.value;
score2.innerHTML = score2.value;

function addOne (score) {
  score.value++;
  score.innerHTML = score.value;
}

function minusOne (score) {
  score.value--;
  score.innerHTML = score.value;
}
