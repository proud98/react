import React from "react";
import img01 from "../image/최고심12.jpg";
import img02 from "../image/최고심5.jpg";

function SecondApp(props) {
  //스타일 변수 지정
  const styleImg = {
    width: "200px",
    border: "5px solid gray",
    marginLeft: "100px",
    marginTop: "20px",
  };
  return (
    <div>
      <h2 className="alert alert-danger">SecondApp</h2>

      <div
        style={{ fontSize: "25px", fontWeight: "bold", marginLeft: "100px" }}
      >
        이미지 연습: src 영역은 반드시 import, public 영역은 직접호출 가
      </div>
      <img
        src={img01}
        style={{
          width: "200px",
          height: "200px",
          marginLeft: "100px",
          marginTop: "20px",
        }}
      ></img>

      <div style={styleImg}>public 영역 이미지</div>
      <img src="../보현이그림.png" style={styleImg}></img>
    </div>
  );
}

export default SecondApp;
