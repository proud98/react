//비교 연산자
let a = 6;
let b = "6";

//타입은 비교하지 않고 값만 비교함
console.log(a == b); //true

//타입까지 비교함
console.log(a === b); //false
console.log(Object.is(a, b)); //===과 동일 false출력

console.log(`a의 타입은 ${typeof a}입니다`);
console.log(`b의 타입은 ${typeof b}입니다`);

