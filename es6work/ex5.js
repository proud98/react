let arr1 = [2, 4, 6];
let arr2 = [7, 8];
let arr3 = [11, 12, ...arr1, 22, ...arr2];

console.log(arr3.length); //8
console.dir(arr3); ///dir은 배열구조로 출력 [11,12,2,4,6,22,7,8]

let arr4 = [...[100, 200], ...arr2]; //100,200,7,8
console.log(arr4);

function fsum(arr) {
  let sum = 0;

  //방법1: for
  //   for (i = 0; i < arr.length; i++) {
  //     sum += arr[i];
  //   }

  //방법2: for each
  for (let a in arr) {
    sum += arr[a];
  }
  console.log("합계: " + sum); //72
}

fsum(arr3);
