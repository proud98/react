import React from "react";
import Alert from "@mui/material/Alert";
import Stack from "@mui/material/Stack";
import AddAlertIcon from "@mui/icons-material/AddAlert";

function FourApp(props) {
  //배열 변수 선언
  const names = ["주하랑", "최보현", "박재승", "장환라", "성한경", "안정빈"];

  //반복문을 뱐수에 저장 후 출력해도 됨 (리턴문을 받아서 직접 주는 경우가 더 많긴 함)
  const nameList = names.map((name) => <li>{name}</li>); //map을 li가 return 받음(한 줄이면 자동 리턴)

  //색상을 배열로
  const colors = ["red", "cyan", "gray", "blue"];
  return (
    <div>
      <Alert severity="error">FourApp 입니다💜</Alert>

      <div>
        <h3>map 반복문 연습</h3>
        <ol>{nameList}</ol>

        <hr></hr>

        <ul>
          {
            //반복문 리턴을 직접 주는 경우
            names.map((name, index) => (
              <b style={{ color: "red" }}>
                {index}:{name}
              </b>
            ))
          }
        </ul>

        <hr></hr>
        {colors.map((color) => (
          <div className="box" style={{ backgroundColor: color }} />
        ))}
      </div>
    </div>
  );
}

export default FourApp;
