var trainingForm =document.querySelector("#training_name_form");

  var trainingNameField = document.querySelector("#trainingName");
  var trainingGenreField = document.querySelector("#trainingGenre");

  var trainingName = document.querySelector("#training_name_name");
  var trainingGenre = document.querySelector("#training_name_genre_id");

  var trainingSubmitBtn = document.querySelector("#trainingSubmit");

  var namePara = document.createElement('p');
  var genrePara = document.createElement('p');

  var activeName;
  var activeGenre;

  trainingSubmitBtn.disabled = true; // デフォルトでSubmitボタンを無効化
  trainingForm.addEventListener('input', ()=>{
    if(activeName === true && activeGenre === true){
      trainingSubmitBtn.disabled = false;
    }else{
      trainingSubmitBtn.disabled = true;
    }
  });

   trainingName.addEventListener('input', ()=>{
    if(trainingName.value === ""){ // 入力フォームが空の場合
      namePara.textContent = "トレ名を入力してください";
      namePara.style.color = "red";
      trainingName.parentElement.style.border = "2px solid red";
      activeName = false;
      }else{ // バリデーションチェック完了時（OK時）の処理
      trainingName.parentElement.style.border = "2px solid lightgreen";
      namePara.textContent = "OK!";
      namePara.style.color = "green";
      activeName = true;
    }
    // ：nickname用のバリデーションエラーメッセージを表示
    trainingNameField.appendChild(namePara);
  });

   trainingGenre.addEventListener('input', ()=>{
    if(trainingGenre.value === ""){ // 入力フォームが空の場合
      genrePara.textContent = "部位を選んでください";
      genrePara.style.color = "red";
      trainingGenre.parentElement.style.border = "2px solid red";
      activeGenre = false;
      }else{ // バリデーションチェック完了時（OK時）の処理
      trainingGenre.parentElement.style.border = "2px solid lightgreen";
      genrePara.textContent = "OK!";
      genrePara.style.color = "green";
      activeGenre = true;
    }
    // ：nickname用のバリデーションエラーメッセージを表示
    trainingGenreField.appendChild(genrePara);
  });
