import React, { useState } from "react";

function ThirdApp(props) {
  //모든 변수는 return 전에
  //상태관리를 위한 변수 설정하기
  const [message, setMessage] = useState("HappyDay!!");

  //엔터 치면 지워지는 이벤트 함수
  const handleEnter = (e) => {
    if (e.key == "Enter") {
      setMessage("");
      e.target.value = "";
    }
  };

  return (
    <div>
      <h2 className="alert alert-danger">ThirdApp 입니다</h2>
      <h3 style={{ color: "red" }}>{message}</h3>

      <hr />

      <h4>메세지를 입력해주세요</h4>
      <input
        type="text"
        style={{ width: "300px", fontSize: "35px", color: "green" }}
        defaultValue={message}
        onChange={(e) => {
          //console.log(e.target.value); //입력 한 값
          //message변수에 입력값 넣기
          setMessage(e.target.value); //message 들어간 div에 그대로 나타남
        }}
        onKeyUp={handleEnter}
      ></input>
    </div>
  );
}

export default ThirdApp;
