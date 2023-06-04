//함수파라미터에 기본값 가능
function func1(x, y = 200, z = 300) {
  console.log(x, y, z);
}

func1(3, 4, 5);
func1(100);
func1(2, 5);
func1();

function func2(a, b) {
  return a + b;
}

let r1 = func2(5, 6); //11
console.log(r1);

let arr = [2, 5, 9];
let r2 = func2(arr[0], arr[1]);
console.log(r2); //7

//es6에서 추가된 기능인 펼침연산자(...)
func1(...arr); //arr에 있는 2,5,9 배열 변수를 function 안에 담아줌
func1(arr[0], arr[1], arr[2]); //이거와 같음

let r3 = func2(...arr);
console.log(r3); //7
