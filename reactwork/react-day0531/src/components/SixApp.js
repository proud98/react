import React, { useState } from "react";

function SixApp(props) {
  const [names, setNames] = useState([
    "최고심",
    "짱이심",
    "멋지심",
    "슬프심",
    "좋으심",
  ]);

  //추가 할 이름 변수
  const [irum, setIrum] = useState("");

  //추가 버튼 이벤트
  const btnInsert = () => {
    setNames(names.concat(irum)); //기존 배열에 irum 데이터를 추가 (concat 메서드)
    setIrum("");
  };

  //더블 클릭하면 삭제
  const dataRemove = (index) => {
    console.log("remove: " + index);

    //filter
    setNames(names.filter((item, i) => i !== index));
  };

  //입력 change 이벤트
  const txtInput = (e) => {
    setIrum(e.target.value);
  };

  return (
    <div>
      <h2 className="alert alert-info">SixApp 입니다</h2>

      <input value={irum} onChange={txtInput} />
      <button onClick={btnInsert}>추가</button>
      <br />
      <h5>이름을 더블 클릭하면 삭제 됩니다</h5>
      <ul>
        {names.map((name, index) => (
          <li key={index} onDoubleClick={() => dataRemove(index)}>
            {name}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default SixApp;
