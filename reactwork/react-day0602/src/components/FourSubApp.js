import React from "react";

function FourSubApp(props) {
  console.dir(props);
  return (
    <div>
      <h3>Four의 자식</h3>

      <div>
        {props.name}님의 나이는 {props.age}세 입니다
      </div>
    </div>
  );
}

export default FourSubApp;
