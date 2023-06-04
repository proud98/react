import React, { useEffect, useState } from "react";

function OneApp(props) {
  const [name, setName] = useState("홍길동");
  const [addr, setAddr] = useState("서울시");

  //1
  useEffect(() => {
    console.log("state변수가 값 변경 될 때마다 호출"); //변경시마다 list가 호출 될 때
  });

  //2
  useEffect(() => {
    console.log("처음 렌더링시 한 번만 호출"); //생성자처럼 사용 할 때
  }, []);

  //3
  useEffect(() => {
    console.log("이름 변경 할때만 호출");
  }, [name]);
  return (
    <div>
      <h2>OneApp_useEffect</h2>
      <h3>
        이름:{" "}
        <input
          type="text"
          defaultValue={name}
          onChange={(e) => {
            setName(e.target.value);
          }}
        ></input>
      </h3>
      <h3>
        주소:{" "}
        <input
          type="text"
          defaultValue={addr}
          onChange={(e) => {
            setAddr(e.target.value);
          }}
        ></input>
      </h3>

      <hr></hr>

      <h2>이름: {name}</h2>
      <h2>주소: {addr}</h2>
    </div>
  );
}

export default OneApp;
