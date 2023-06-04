//화살표 함수: 일반함수와의 차이점은 객체생성이 안되는 것 (new 사용 못 함)

//일반 함수
function f1() {
  console.log("일반함수 fi");
}
f1();

//화살표 함수
let f2 = () => console.log("화살표 함수 f2");
f2();

//일반 함수 (인자값이 있을 경우)
function f3(a, b) {
  return a + b;
}
let a = f3(5, 7);
console.log(a); //12

//화살표 함수 (인자값이 있을 경우)
let f4 = (a, b) => a + b; //한 줄일 경우는 return 생략 가능
let b = f4(11, 22);
console.log(b); //33

//f5 일반함수
function f5(x, y, z = 30) {
  return x + y + z;
}
console.log(f5(1, 2, 3)); //6
console.log(f5(10, 20)); //69

//f5를 화살표함수 f6으로 구현 후 호출
let f6 = (x, y, z = 30) => x + y + z;
console.log(f6(1, 2, 3)); //6
console.log(f6(10, 20)); //69

//오브젝트를 객체로 만들기
//f1안에 f2를 만들어서 f1 호출하기
let obj = {
  //한 줄 이상일 경우는 객체형 {} 사용
  f1: () => {
    console.log(1);

    let f2 = () => console.log(2);
    f2();

    setTimeout(f2, 1000);
  },
};
obj.f1;
