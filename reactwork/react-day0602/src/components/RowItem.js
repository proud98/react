import React from "react";

function RowItem({ row }) {
  console.dir();
  return (
    <tr>
      <td>{row.writer}</td>
      <td>
        <img src={`../image/${row.photo}.jpg`} style={{ width: "60px" }} />
      </td>
      <td>{row.subject}</td>
      <td>{row.today ? row.today.toLocaleDateString("ko-kr") : ""}</td>
      <td>
        <button type="button" className="btn btn-danger">
          삭제
        </button>
      </td>
    </tr>
  );
}

export default RowItem;
