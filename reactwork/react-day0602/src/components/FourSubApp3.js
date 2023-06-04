import React from 'react';

function FourSubApp3(props) {
    return (
        <div>
            <button type='button' onClick={()=>{
                props.incre();
            }} className='btn btn-info'>증가</button>

            <button type='button' onClick={()=>{
                props.decre(); //부모컴포넌트의 이벤트 발생 - props가 가진 decre 호출
            }} className='btn btn-info'>감소</button>
        </div>
    );
}

export default FourSubApp3;