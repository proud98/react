import React, { useState } from "react";
import RowItem from "./RowItem";
import WriteForm from "./WriteForm";

function FiveApp(props) {
  const [board, setBoard] = useState([
    {
      no: 1,
      writer: "주하랑",
      subject: "안녕~~",
      photo: "최고심1",
      tobody: new Date(),
    },

    {
      no: 2,
      writer: "최보현",
      subject: "샌드위치맛낭~~",
      photo: "최고심2",
      tobody: new Date(),
    },

    {
      no: 3,
      writer: "박재승",
      subject: "하하호호~",
      photo: "최고심3",
      tobody: new Date(),
    },

    {
      no: 4,
      writer: "장환라",
      subject: "꽃등에가 뭐야?",
      photo: "최고심4",
      tobody: new Date(),
    },
  ]);

  //데이터 추가하는 함수 이벤트
  //board를 바꾸면 랜더링이 다시 되면서 추가

  const dataSave = (data) => {
    setBoard(
      board.concat({
        // writer: data.writer,
        // photo: data.photo,
        // subject: data.subject,
        ...data,
        today: new Date(),
      })
    );
  };
  return (
    <div>
      <h2>FiveApp_부모테이블</h2>

      {/* 데이터를 보냄(저장) */}
      <WriteForm onSave={dataSave} />

      <table className="table table-bordered" style={{ width: "600px" }}>
        <thead>
          <tr style={{ backgroundColor: "#ddd" }}>
            <th width="100">이름</th>
            <th width="100">사진</th>
            <th width="250">제목</th>
            <th width="150">날짜</th>
            <th width="100">삭제</th>
          </tr>
        </thead>
        <tbody>
          {
            //데이터 개수만큼 호출, 출력은 안됨, 자식 RowItem에서 출력
            board.map((row, index) => (
              <RowItem row={row} />
            ))
          }
        </tbody>
      </table>
    </div>
  );
}

export default FiveApp;
