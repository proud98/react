import React, { useState } from "react";
import "../App.css";
//이미지 import
import img1 from "../image/최고심1.jpg";
import img2 from "../image/최고심2.jpg";
import img3 from "../image/최고심3.jpg";
import img4 from "../image/최고심4.jpg";
import img5 from "../image/최고심5.jpg";

function TwoApp(props) {
  const [hp1, setHp1] = useState("02");
  const [hp2, setHp2] = useState("1234");
  const [hp3, setHp3] = useState("1234");
  const [photo, setPhoto] = useState(1);

  const changeHp1 = (e) => {
    setHp1(e.target.value);
    setHp2(e.target.value);
    setHp3(e.target.value);
  };

  const changeHp2 = (e) => {
    setHp2(e.target.value);
  };

  const changeHp3 = (e) => {
    setHp3(e.target.value);
  };

  const changPhoto = (e) => {
    setPhoto(Number(e.target.value));
  };

  return (
    <div>
      <h2 className="alert alert-info">TwoApp 입니다</h2>
      <div className="form-inline" style={{ display: "flex", padding: "30px" }}>
        <select className="form-control" style={{ width: "70px" }}>
          <option>02</option>
          <option>031</option>
          <option>054</option>
          <option>010</option>
        </select>
        <b>-</b>
        <input
          type="text"
          className="form-control"
          maxLength="4"
          style={{ width: "100px" }}
          defaultValue={hp2}
          onKeyUp={changeHp2}
        ></input>
        <b>-</b>
        <input
          type="text"
          className="form-control"
          maxLength="4"
          style={{ width: "100px" }}
          defaultValue={hp3}
          onKeyUp={changeHp3}
        ></input>

        <b style={{ marginLeft: "30px" }}>이미지</b>
        <select>
          <option value="1">최고심1</option>
          <option value="2">최고삼2</option>
          <option value="3">촤고심3</option>
          <option value="4">최고심4</option>
          <option value="5">최고심5</option>
        </select>
      </div>

      <h1>결과값 보기</h1>
      <hp2>
        {hp1}-{hp2}-{hp3}
      </hp2>
      <img
        style={{ width: "300px" }}
        className="photo"
        src={
          photo === 1
            ? img1
            : photo === 2
            ? img2
            : photo === 3
            ? img3
            : photo === 4
            ? img4
            : img5
        }
      ></img>
    </div>
  );
}

export default TwoApp;
