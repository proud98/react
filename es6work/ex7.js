// ``리터럴

let name = "주하랑";
let birth = 1998;
let food = "삼겹살";

let curYear = new Date().getFullYear();

//예전 출력방식
let result =
  "이름: " +
  name +
  "\n태어난 년도: " +
  birth +
  "\n나이: " +
  (curYear - birth) +
  "\n좋아하는 음식: " +
  food;

console.log(result);

// ``리터럴 방식 출력: 중간변수는 $ 사용
let result2 = `이름: ${name}
태어난 년도: ${birth}
나이: ${curYear - birth}
좋아하는 음식: ${food}`;

console.log(result2);
