$(document).on('turbolinks:load', function() {
  // 復活させるダミーの中カテゴリのセレクトボックス
  const defaultTrainingNameSelect = `
    <div id="training_name">
      <div class="field">
        <div class="form-group">
          <label for="training_menu_トレ名">トレ名（必須）部位をお選びください</label>
            <option value>---</option>
          </select>
        </div>
      </div>
    </div>
  `;

  // 中カテゴリの処理
  $(document).on('change', '#training_menu_genre_id', function() {
    const categoryVal = $('#training_menu_genre_id').val();

    // 大カテゴリが変更されてvalueに値が入った場合の処理
    if (categoryVal !== "") {
      const selectedTemplate = $(`#training_name_${categoryVal}`); // 呼び出すtamplateのidセット

      $('#training_name').remove(); // デフォルト表示用の中カテゴリを削除
      $('#selected_training_name').remove(); // 前に選択した中カテゴリがある場合に削除
      $('#training_name_insert_point').after(selectedTemplate.html()); // 大カテゴリに紐づいた中カテゴリセレクトを追加
    } else {
      // 親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
      $('#selected_training_name').remove(); // 前に選択した中カテゴリがある場合に削除
      $('#training_name').remove(); // デフォルト表示用の中カテゴリを削除
      $('#training_name_insert_point').after(defaultTrainingNameSelect); // デフォルト表示の中カテゴリを追加
    }
  });
});
