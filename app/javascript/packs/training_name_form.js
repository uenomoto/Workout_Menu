const trainingForm = document.querySelector("#training_name_form");

const trainingNameField = document.querySelector("#trainingName");
const trainingGenreField = document.querySelector("#trainingGenre");

const trainingName = document.querySelector("#training_name_name");
const trainingGenre = document.querySelector("#training_name_genre_id");

const trainingSubmitBtn = document.querySelector("#trainingSubmit");

const namePara = document.createElement("p");
const genrePara = document.createElement("p");

let activeName = false;
let activeGenre = false;

trainingSubmitBtn.disabled = true;

// 入力があるたびにバリデーションを行う
trainingForm.addEventListener("input", () => {
  if (activeName && activeGenre) {
    trainingSubmitBtn.disabled = false;
  } else {
    trainingSubmitBtn.disabled = true;
  }
});

// トレーニング名フィールドのバリデーション
trainingName.addEventListener("input", () => {
  if (trainingName.value === "") {
    namePara.textContent = "トレ名を入力してください";
    namePara.style.color = "red";
    trainingName.parentElement.style.border = "2px solid red";
    activeName = false;
  } else {
    trainingName.parentElement.style.border = "2px solid lightgreen";
    namePara.textContent = "OK!";
    namePara.style.color = "green";
    activeName = true;
  }
  // バリデーションエラーメッセージを表示
  trainingNameField.appendChild(namePara);
});

// トレーニングジャンルフィールドのバリデーション
trainingGenre.addEventListener("input", () => {
  if (trainingGenre.value === "") {
    genrePara.textContent = "部位を選んでください";
    genrePara.style.color = "red";
    trainingGenre.parentElement.style.border = "2px solid red";
    activeGenre = false;
  } else {
    trainingGenre.parentElement.style.border = "2px solid lightgreen";
    genrePara.textContent = "OK!";
    genrePara.style.color = "green";
    activeGenre = true;
  }
  // バリデーションエラーメッセージを表示
  trainingGenreField.appendChild(genrePara);
});
