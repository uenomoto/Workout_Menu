// すべてのチェックボックスがチェックされている場合に、ボタンをアクティブにする
$(function() {
// チェックボックスが変更されたときに処理を実行する
$(':checkbox').on('change', function() {
// チェックされていないチェックボックスの数が0より大きい場合は、ボタンを無効にする
$('#btn').prop('disabled', $(':checkbox:not(:checked)').length > 0);
}).eq(0).trigger('change'); // 初期化
});