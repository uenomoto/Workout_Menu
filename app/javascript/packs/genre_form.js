const genreForm = document.querySelector("#genreform");
const genreNameField = document.querySelector("#genre_Name");
const genreName = document.querySelector("#genreName");
const genreSubmitBtn = document.querySelector("#btnSubmit");
const namePara = document.createElement('p');

// 入力があるかないか
let activeName = false;
// ボタンを無効化
genreSubmitBtn.disabled = true;
// 条件式反転、有効化(false)だったら入力がある(true)
genreForm.addEventListener('input', () => {
  genreSubmitBtn.disabled = !activeName;
});

genreName.addEventListener("input", () => {
  if(genreName.value === "") {
    namePara.textContent = "部位を入力してください";
    namePara.style.color = "red";
    genreName.parentElement.style.border = "2px solid red";
    activeName = false;
  } else {
    genreName.parentElement.style.border = "2px solid lightgreen";
    namePara.textContent = "";
    namePara.style.color = "green";
    activeName = true;
  }
  genreNameField.appendChild(namePara);
});