import React, { useState } from "react";

function FifthApp(props) {
  const [name, setName] = useState("");
  const [java, setJave] = useState(0);
  const [spring, setSpring] = useState(0);
  const [total, setTotal] = useState(0);
  const [avg, setAvg] = useState(0);

  return (
    <div>
      <h2 className="alert alert-warning">FifthApp 입니다</h2>

      <div style={{ display: "flex" }}>
        <input
          type="text"
          placeholder="이름 입력"
          style={{ fontSize: "25px" }}
          onChange={(e) => {
            //console.log(e.target.value); //입력 한 값
            //message변수에 입력값 넣기
            setName(e.target.value); //message 들어간 div에 그대로 나타남
          }}
        ></input>
        <h3 style={{ color: "green" }}>{name}</h3>
      </div>

      <div style={{ display: "flex" }}>
        <input
          type="text"
          placeholder="자바점수"
          style={{ fontSize: "25px" }}
          onChange={(e) => {
            //console.log(e.target.value); //입력 한 값
            //message변수에 입력값 넣기
            setJave(e.target.value); //message 들어간 div에 그대로 나타남
          }}
        ></input>
        <h3 style={{ color: "green" }}>{java}</h3>
      </div>

      <div style={{ display: "flex" }}>
        <input
          type="text"
          placeholder="스프링점수"
          style={{ fontSize: "25px" }}
          onChange={(e) => {
            //console.log(e.target.value); //입력 한 값
            //message변수에 입력값 넣기
            setSpring(e.target.value); //message 들어간 div에 그대로 나타남
          }}
        ></input>
        <h3 style={{ color: "green" }}>{spring}</h3>
      </div>

      <button
        type="button"
        className="btn btn-info"
        onClick={() => {
          setTotal(Number(java) + Number(spring));
          setAvg(Number(java) + Number(spring) / 2);
        }}
      >
        결과 확인
      </button>

      <div
        style={{
          marginTop: "10px",
          border: "1px solid gray",
          width: "300px",
          height: "100px",
        }}
      >
        {name}의 자바점수는 {java}, 스프링점수는 {spring}, 총점은 {total},
        평균은 {avg}
      </div>
    </div>
  );
}

export default FifthApp;
