import React from "react";
import "../App.css";
import Alert from "@mui/material/Alert";
import img1 from "../image/최고심1.jpg";
import img2 from "../image/최고심2.jpg";
import img3 from "../image/최고심3.jpg";
import img4 from "../image/최고심4.jpg";
import img5 from "../image/최고심5.jpg";

function FiveApp(props) {
  //이미지를 배열 변수에 넣기
  const imgArr = [img1, img2, img3, img4, img5];

  //public 이미지
  const imgArr2 = [
    "6번 칸",
    "라라랜드",
    "곤지암",
    "드림",
    "브로커",
    "마션",
  ];
  return (
    <div>
      <Alert severity="info">FiveApp 입니다</Alert>

      <h4>src의 이미지를 배열로 넣어 반복하기</h4>
      {imgArr.map((myimg) => (
        <img src={myimg} style={{ width: "100px" }} />
      ))}

      <h4>public의 이미지를 배열로 넣어 반복하기</h4>
      {imgArr2.map((photo) => (
        <img src={`../image2/${photo}.jpg`} />
      ))}
    </div>
  );
}

export default FiveApp;
