import React, { useState } from "react";

function TwoApp(props) {
  const [board, setBoard] = useState([
    {
      no: 1,
      writer: "주하랑",
      subject: "안녕~~",
      photo: "최고심1",
    },

    {
      no: 2,
      writer: "최보현",
      subject: "샌드위치맛낭~~",
      photo: "최고심2",
    },

    {
      no: 3,
      writer: "박재승",
      subject: "하하호호~",
      photo: "최고심3",
    },

    {
      no: 4,
      writer: "장환라",
      subject: "꽃등에가 뭐야?",
      photo: "최고심4",
    }
  ]);
  return (
    <div>
      <h2>TwoApp_객체공총변수로 테이블 만들기_배열 안에 객체 출력</h2>
      <table className="table table-bordered" style={{ width: "500px" }}>
        <caption>
          <b>배열객체출력</b>
        </caption>
        <thead>
          <tr style={{ backgroundColor: "#ddd" }}>
            <th width="60">번호</th>
            <th width="100">이미지</th>
            <th width="260">제목</th>
            <th width="120">작성자</th>
          </tr>
        </thead>

        <tbody>
          {board.map((row, index) => (
            <tr>
              <td>{row.no}</td>
              <td>
                <img
                  src={`../image/${row.photo}.jpg`}
                  style={{ width: "60px" }}
                ></img>
              </td>
              <td>{row.subject}</td>
              <td>{row.writer}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default TwoApp;
