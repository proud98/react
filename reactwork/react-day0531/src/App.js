import logo from "./logo.svg";
import "./App.css";
import { useState } from "react";
import OneApp from "./components/OneApp";
import FourApp from "./components/FourApp";
import ThreeApp from "./components/ThreeApp";
import FiveApp from "./components/FiveApp";
import SixApp from "./components/SixApp";
import TwoApp from "./components/TwoApp";

function App() {
  const [index, setIndex] = useState(6);
  return (
    <div className="App">
      <b style={{ fontSize: "20px" }}>컴포넌트 선택하기</b>
      <select
        onChange={(e) => {
          setIndex(Number(e.target.value));
        }}
      >
        <option value={1} selected>
          OneApp 확인
        </option>
        <option value={2}>TwoApp 확인</option>
        <option value={3}>ThreeApp 확인</option>
        <option value={4}>FourApp 확인</option>
        <option value={5}>FiveApp 확인</option>
        <option value={6}>SixApp 확인</option>
      </select>

      {index === 1 ? (
        <OneApp />
      ) : index === 2 ? (
        <TwoApp />
      ) : index === 3 ? (
        <ThreeApp />
      ) : index === 4 ? (
        <FourApp />
      ) : index === 5 ? (
        <FiveApp />
      ) : (
        <SixApp />
      )}
    </div>
  );
}

export default App;
