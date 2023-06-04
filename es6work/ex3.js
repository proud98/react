//const: 상수

const PI = 3.14;
let r = 3;

let area = r * r * PI;
console.log("반지름이 %d인 원의 너비:%f", r, area);

//PI = 1.23564; const는 상수기 때문에 값 못바꿈
//근데 const를 객체로 선언하면 바꿀 수 있음
const pp = {
  name: "주하랑",
  addr: "서울 강남",
};

console.log("이름: " + pp.name);
console.log("주소: " + pp.addr);

//객체 타입 변경
pp.name = "최보현";
pp.addr = "제주시";
console.log("이름: " + pp.name);
console.log("주소: " + pp.addr);

/*
pp={
    
}
이런식으로 객체값 자체 변경은 안됨
*/
