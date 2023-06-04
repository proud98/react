import React from "react";
import "./MyStyle.css";

const FirstApp = () => {
  return (
    <div>
      <h2 className="line">First App Component</h2>
      <div style={{ fontSize: "25px", color: "green", marginLeft: "100px" }}>
        안녕 반갑다
      </div>
    </div>
  );
};

export default FirstApp;
