import React, { useState } from "react";
import FourSubApp from "./FourSubApp";
import FourSubApp2 from "./FourSubApp2";
import FourSubApp3 from "./FourSubApp3";

function FourApp(props) {
  const [number, setNumber] = useState(10);

  //증가
  const numberIncre = () => {
    setNumber(number + 1);
  };

  //감소
  const numberDcre = () => {
    setNumber(number - 1);
  };

  //감소

  return (
    <div>
      <h4 className="alert alert-info">
        FourApp_부모가 자식에세 전달할때 (props) 이건 자식 입장에서는 읽기전용
        (출력은가능, 뱐걍은 불가능) 만약 자식 컴포넌트에서 부모에게 전달하고자
        할 때 이벤트를 통해서 부모 데이터 변경가능 (props는 이벤트도 전달가능)
      </h4>

      {/* 연속으로 자식 컴포넌트 호출 가능 */}
      <FourSubApp name="하랑" age="26" />
      <FourSubApp name="보현" age="26" />
      <FourSubApp name="종수" age="26" />
      {/* props 변수로 name과 age 전달 가능 */}
      <br></br>
      <FourSubApp2 food="마라탕" price="5000" />
      <FourSubApp2 food="피자" price="7000" />
      <FourSubApp2 food="야채곱창" price="3000" />
      <br></br>
      <h1>{number}</h1>
      <FourSubApp3 incre={numberIncre} decre={numberDcre}/>
    </div>
  );
}

export default FourApp;
