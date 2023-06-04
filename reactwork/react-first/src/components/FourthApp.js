import React, { useState } from "react";

function FourthApp(props) {
  const [name, setName] = useState("어쩌고");
  const [age, setAge] = useState(20);
  return (
    <div>
      <h2 className="alert alert-info">FourthApp 입니다</h2>

      <b>
        이름:{name} <span style={{ marginLeft: "50px" }}></span>
        나이: {age}세
      </b>
      <br></br>
      <br></br>
      <button
        type="button"
        className="btn btn-info"
        style={{ marginLeft: "50px" }}
        onClick={() => {
          setName("주하랑");
          setAge(26);
        }}
      >
        자기 이름으로 변경
      </button>
      <button
        type="button"
        className="btn btn-info"
        style={{ marginLeft: "50px" }}
        onClick={() => {
          setName("xxx");
          setAge(0);
        }}
      >
        초기화
      </button>
    </div>
  );
}

export default FourthApp;
