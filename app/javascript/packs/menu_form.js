const menuForm = document.querySelector("#menuForm");

const menuGenreField = document.querySelector("#menuGenre");
const menuDateField = document.querySelector("#menuDate");
const menuCountField = document.querySelector("#menuCount");
const menuSetField = document.querySelector("#menuSet");

const menuGenre = document.querySelector("#training_menu_genre_id");
const menuDate = document.querySelector("#training_menu_date");
const menuCount = document.querySelector("#training_menu_count");
const menuSet = document.querySelector("#training_menu_set");

const menuSubmitBtn = document.querySelector("#menuSubmit");

const genrePara = document.createElement('p');
const datePara = document.createElement('p');
const countPara = document.createElement('p');
const setPara = document.createElement('p');

let activeGenre;
let activeDate;
let activeCount;
let activeSet;

menuSubmitBtn.disabled = true;
menuForm.addEventListener('input', () => {
  if (activeGenre && activeDate && activeCount && activeSet) {
    menuSubmitBtn.disabled = false;
  } else {
    menuSubmitBtn.disabled = true;
  }
});

menuGenre.addEventListener('input', () => {
  if (menuGenre.value === "") {
    genrePara.textContent = "部位をお選びください";
    genrePara.style.color = "red";
    menuGenre.parentElement.style.border = "2px solid red";
    activeGenre = false;
  } else {
    genrePara.textContent = "OK!";
    genrePara.style.color = "green";
    menuGenre.parentElement.style.border = "2px solid lightgreen";
    activeGenre = true;
  }
  menuGenreField.appendChild(genrePara);
});

menuDate.addEventListener('input', () => {
  if (menuDate.value === "") {
    datePara.textContent = "日付をお選びください";
    datePara.style.color = "red";
    menuDate.parentElement.style.border = "2px solid red";
    activeDate = false;
  } else {
    datePara.textContent = "OK!";
    datePara.style.color = "green";
    menuDate.parentElement.style.border = "2px solid lightgreen";
    activeDate = true;
  }
  menuDateField.appendChild(datePara);
});

menuCount.addEventListener('input', () => {
  const countRegex = /^[0-9]+$/;

  if (menuCount.value === "") {
    countPara.textContent = "半角数字で記入してください";
    countPara.style.color = "red";
    menuCount.parentElement.style.border = "2px solid red";
    activeCount = false;
  } else if (!countRegex.test(menuCount.value)) {
    countPara.textContent = "半角数字で記入してください"
    countPara.style.color = "red"
    menuCount.parentElement.style.border = "2px solid red";
    activeCount = false;
  } else {
    countPara.textContent = "OK!";
    countPara.style.color = "green";
    menuCount.parentElement.style.border = "2px solid lightgreen";
    activeCount = true;
  }
  menuCountField.appendChild(countPara);
});

menuSet.addEventListener('input', () => {
  if (menuSet.value === "") {
    setPara.textContent = "半角数字で入力してください";
    setPara.style.color = "red";
    menuSet.parentElement.style.border = "2px solid red";
    activeSet = false;
  } else {
    setPara.textContent = "OK!";
    setPara.style.color = "green";
    menuSet.parentElement.style.border = "2px solid lightgreen";
    activeSet = true;
  }
});
