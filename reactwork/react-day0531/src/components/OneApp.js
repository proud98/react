import React, { useState } from "react";
import "../App.css";

function OneApp(props) {
  const [number, setNumber] = useState(0);
  const numberIncre = () => {
    if (number === 10) {
      alert("증가 불가능");
      return;
    }
    setNumber(number + 1);
  };

  const numberDce = () => {
    if (number === 0) {
      alert("감소 불가능");
      return;
    }
    setNumber(number - 1);
  };

  return (
    <div>
      <h2 className="alert alert-info">OneApp 입니다</h2>
      <div className="number">{number}</div>
      <button
        type="button"
        style={{ marginLeft: "20px" }}
        onClick={numberIncre}
      >
        증가
      </button>
      <button type="button" style={{ marginLeft: "20px" }} onClick={numberDce}>
        감소
      </button>
    </div>
  );
}

export default OneApp;
