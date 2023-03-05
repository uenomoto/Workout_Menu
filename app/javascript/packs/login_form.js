const userForm = document.querySelector("#userform");

const userNameField = document.querySelector("#userNickname");
const userPasswordField = document.querySelector("#userPassword");

const userName = document.querySelector("#user_nickname");
const userPassword = document.querySelector("#user_password");

const userSubmitBtn = document.querySelector("#userSubmit");
const namePara = document.createElement('p');
const passwordPara = document.createElement('p');

let activeName;
let activePassword;

userSubmitBtn.disabled = true; // デフォルトでSubmitボタンを無効化

userForm.addEventListener('input', () => {
  userSubmitBtn.disabled = !(activeName && activePassword);
});

userName.addEventListener('input', () => {
  if (userName.value === "") {
    // 入力フォームが空の場合
    namePara.textContent = "ニックネームを入力してください";
    namePara.style.color = "red";
    userName.parentElement.style.border = "2px solid red";
    activeName = false;
  } else {
    // バリデーションチェック完了時（OK時）の処理
    userName.parentElement.style.border = "2px solid lightgreen";
    namePara.textContent = "OK!";
    namePara.style.color = "green";
    activeName = true;
  }
  // ：nickname用のバリデーションエラーメッセージを表示
  userNameField.appendChild(namePara);
});

userPassword.addEventListener('input', () => {
  const passwordRegex = /^([a-zA-Z0-9]{6,})$/; // 半角英数字6文字以上を表す正規表現

  if (!passwordRegex.test(userPassword.value)) {
    if (userPassword.value === "") {
      // 入力フォーム(userPassword)が空の場合
      passwordPara.textContent = "パスワードを入力してください";
      passwordPara.style.color = "red";
      userPassword.parentElement.style.border = "2px solid red";
      activePassword = false;
    } else {
      // 入力した値が1文字以上6文字未満である場合
      passwordPara.textContent = "6文字以上の半角英数字を入力してください";
      passwordPara.style.color = "red";
      userPassword.parentElement.style.border = "2px solid red";
      activePassword = false;
    }
  } else {
    if (userPassword.value === userPassword.value) {
      // パスワードOKの場合
      passwordPara.textContent = "OK!";
      passwordPara.style.color = "green";
      userPassword.parentElement.style.border = "2px solid lightgreen";
      activePassword = true;
    }
  }
  userPasswordField.appendChild(passwordPara);
});