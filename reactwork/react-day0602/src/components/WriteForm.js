import React, { useState } from "react";

function WriteForm({ onSave }) {
  const [writer, setWriter] = useState("");
  const [photo, setPhoto] = useState("최고심1");
  const [subject, setSubject] = useState("잉잉");

  //버튼이벤트
  const addDataEvent = () => {
    //부모컴포넌트의 onSave이벤트 호출
    onSave({ writer, photo, subject });
  };
  return (
    <div>
      <b>이름: </b>
      <input
        type="text"
        style={{ width: "100px" }}
        onChange={(e) => {
          setWriter(e.target.value);
        }}
      ></input>

      <b>제목: </b>
      <input
        type="text"
        style={{ width: "100px" }}
        onChange={(e) => {
          setSubject(e.target.value);
        }}
      ></input>

      <b>이미지: </b>
      <select
        onChange={(e) => {
          setPhoto(e.target.value);
        }}
      >
        {
          //1~10까지 map
          [...new Array(10)].map((a, idx) => (
            <option>{`최고심${idx + 1}`}</option>
          ))
        }
      </select>

      <button
        type="button"
        className="btn btn-info"
        style={{ marginLeft: "20px" }}
        onClick={addDataEvent}
      >
        추가
      </button>
    </div>
  );
}

export default WriteForm;
