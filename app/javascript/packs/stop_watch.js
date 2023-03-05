'use strict';
const
  view     = document.getElementById('view'),
  startBtn = document.getElementById('start'),
  resetBtn = document.getElementById('reset');

let startTime = 0;

window.addEventListener('turbolinks:load', function() {
    const e = window.ontouchstart !== undefined ? 'touchstart' : 'mousedown';
    startBtn.addEventListener(e, clickStart);
    resetBtn.addEventListener(e, clickReset);
    view.value = timeFormat(0);
});

// STARTボタン押下時
function clickStart() {
    // 停止状態なら
    if(startTime <= 0) {
        // 計測開始
        startTime += Date.now();
        timePrint();
        startBtn.textContent = 'STOP';
        resetBtn.disabled = true;
    }
    // 計測中なら
    else {
        // 停止
        startTime -= Date.now();
        startBtn.textContent = 'START';
        resetBtn.disabled = false;
    }
}

// RESETボタン押下時
function clickReset() {
    // 停止状態なら
    if(startTime < 0) {
        // リセット
        startTime = 0;
        view.value = timeFormat(0);
    }
}

// 時間表示
function timePrint() {
    if(startTime > 0) {
        view.value = timeFormat(Date.now() - startTime);
        requestAnimationFrame(timePrint);
    }
}

// 表示フォーマット
function timeFormat(t) {
    return Math.floor(t / 36e5) + new Date(t).toISOString().slice(13, 23);
}