import logo from "./logo.svg";
import "./App.css";
import { useState } from "react";
import OneApp from "./components/OneApp.js";
import TwoApp from "./components/TwoApp.js";
import ThreeApp from "./components/ThreeApp.js";
import FourApp from "./components/FourApp.js";
import FiveApp from "./components/FiveApp.js";

function App() {
  const [idx, setIdx] = useState(1);

  const selectComponents = (e) => {
    setIdx(Number(e.target.value));
  };

  return (
    <div>
      <div style={{ fontSize: "20px" }}>
        <label>
          <input
            type="radio"
            name="comp"
            defaultValue="1"
            defaultChecked
            onClick={selectComponents}
          />
          OneApp
        </label>
        &nbsp;
        <label>
          <input
            type="radio"
            name="comp"
            defaultValue="2"
            onClick={selectComponents}
          />
          TwoApp
        </label>
        &nbsp;
        <label>
          <input
            type="radio"
            name="comp"
            defaultValue="3"
            onClick={selectComponents}
          />
          ThreeApp
        </label>
        &nbsp;
        <label>
          <input
            type="radio"
            name="comp"
            defaultValue="4"
            onClick={selectComponents}
          />
          FourApp
        </label>
        &nbsp;
        <label>
          <input
            type="radio"
            name="comp"
            defaultValue="5"
            onClick={selectComponents}
          />
          FiveApp
        </label>
        &nbsp;
      </div>

      <hr />
      {idx === 1 ? (
        <OneApp />
      ) : idx === 2 ? (
        <TwoApp />
      ) : idx === 3 ? (
        <ThreeApp />
      ) : idx === 4 ? (
        <FourApp />
      ) : (
        <FiveApp />
      )}
    </div>
  );
}

export default App;
