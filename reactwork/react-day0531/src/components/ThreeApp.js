import React, { useState } from "react";

function ThreeApp(props) {
  const [photo, setPhoto] = useState("../image2/겨울왕국1.jpg");
  const changePhoto = (e) => {
    setPhoto(e.target.value);
  };

  return (
    <div>
      <h2 className="alert alert-info">ThreeApp 입니다</h2>
      <div style={{ fontSize: "20px" }}>
        <label>
          <input
            name="photo"
            type="radio"
            value="../image2/겨울왕국1.jpg"
            defaultChecked
            onClick={changePhoto}
          >
            겨울왕국1
          </input>
        </label>

        <label>
          <input
            name="photo"
            type="radio"
            value="../image2/겨울왕국2.jpg"
            onClick={changePhoto}
          >
            겨울왕국2
          </input>
        </label>

        <label>
          <input
            name="photo"
            type="radio"
            value="../image2/드림.jpg"
            onClick={changePhoto}
          >
            드림
          </input>
        </label>

        <label>
          <input
            name="photo"
            type="radio"
            value="../image2/브로커.jpg"
            onClick={changePhoto}
          >
            브로커
          </input>
        </label>
      </div>

      <img src={photo}></img>
    </div>
  );
}

export default ThreeApp;
