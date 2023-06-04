//배열연습 Map

var numbers = [1, 2, 3, 4, 5];

var processd = numbers.map(function (num) {
  return num * num;
});

console.log(processd); //1,4,9,16...

var colors = ["red", "blue", "black", "pink", "gray"];

colors.map((color, index) => {
  console.log(color, index); //red, 0
});
