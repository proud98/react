//es6에서는 class 기능이 추가 됨

class Student {
  //생성자 클래스 명은 무조건 constructor
  constructor(name) {
    this.name = name;
  }

  //멤버함수
  writeName() {
    console.log(`내이름은 ${this.name} 입니다`);
  }
}

//클래스 생성
let s1 = new Student("주하랑");
console.log("이름: " + s1.name); //이름: 주하랑
s1.writeName(); //내이름은 주하랑 입니다

let s2 = new Student("최보현");
console.log(`이름: ${s2.name}`); //이름: 최보현
s2.writeName(); //내이름은 최보현 입니다
