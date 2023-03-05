const tweetForm = document.querySelector("#tweetForm");
const tweetTextField = document.querySelector("#tweetText");
const tweettext = document.querySelector("#tweet_text");
const tweetSubmitBtn = document.querySelector("#tweetSubmit");
const textPara = document.createElement('p');

let activeTweet = false;

tweetSubmitBtn.disabled = true;

tweetForm.addEventListener('input', () => {
  tweetSubmitBtn.disabled = !activeTweet;
});

tweettext.addEventListener('input', () => {
  if (tweettext.value === "") {
    textPara.textContent = "つぶやきを入力してください";
    textPara.style.color = "red";
    tweettext.parentElement.style.border = "2px solid red";
    activeTweet = false;
  } else {
    tweettext.parentElement.style.border = "2px solid lightgreen";
    textPara.textContent = "OK!";
    textPara.style.color = "green";
    activeTweet = true;
  }
  tweetTextField.appendChild(textPara);
});