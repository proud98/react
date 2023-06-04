//es6는 좀 더 언어적으로 바뀌었음 (set, Map 가능)

let set = new Set("abcdeffffghijk"); //중복문자 걸러냄

console.log(set); //Set(11) { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k' }

//set에 추가 (add)
set.add("z"); //없으니까 추가 됨
console.log(set);

console.log(set.has("d")); //포함하면 true
console.log(set.has("s")); //포함 안하면 false
console.log("길이: " + set.size); //12
console.log(...set); //배열처럼 따로 출력 a b c d e f g h i j k z

set.delete("a"); //하나씩 삭제
console.log(...set); //b c d e f g h i j k z

set.clear(); //전체삭제
console.log("길이: " + set.size); //0

//Map
let map = new Map();
let a = { n: 1 };

map.set(a, "A");
map.set("2", 9);
map.set("2", 11);
console.log(map); //Map(2) { { n: 1 } => 'A', '2' => 11 }
console.log(map.has("2")); //true

map.delete("2");
console.log(map); //Map(1) { { n: 1 } => 'A' }

map.clear();
console.log(map); //Map(0) {}
