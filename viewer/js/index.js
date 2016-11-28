// バッテリー残量ボタンが押された場合
function onCurrentClicked(){
    // データ入力
    var data = csv3Array("../log/current_battery.txt", 0);
    var mdata = csv3Array("../log/max_battery.txt", 1);
    // 数値データを%値に
    data = currentDataPercent(data, mdata);
    // Google Visualization API ロード時のコールバック関数の設定と呼び出し
    google.setOnLoadCallback(drawChart(data, 0));
};

// 最大バッテリー容量ボタンが押された場合
function onMaxClicked(){
    // MaxCapacity data 作成
    var maxData = csv3Array("../log/max_battery.txt", 1);
    // 一回だけ実行
    if (maxData[1][1] > 100){
        // 最大バッテリー容量の場合は出荷時最大値との%値（小数点第2位まで）に変換
        // 6330はDesignCapacityの値です。環境によって違うと思うので適宜変更してください。
        for(var i = 1; i < maxData.length; i++){
            maxData[i][1] = maxData[i][1] / 6330 * 100 * 100;
            maxData[i][1] = Math.round(maxData[i][1]) / 100;
        }
    }
    google.setOnLoadCallback(drawChart(maxData, 1));
};

// 充放電回数ボタンが押された場合
function onCycleClicked(){
    var cycleData = csv3Array("../log/cycle_battery.txt", 2);
    // Google Visualization API ロード時のコールバック関数の設定と呼び出し
    google.setOnLoadCallback(drawChart(cycleData, 2));
};

// CSV出力関数
// flg 0 バッテリー残量
// flg 1 バッテリー最大値
// flg 2 充放電回数
function csv3Array(filePath, flg) {
    var csvData = [];
    var data = new XMLHttpRequest();

    if (flg === 0){
        csvData = [["時刻", "バッテリー残量"]];
    }else if (flg === 1){
        csvData = [["日付", "バッテリー最大値"]];
    }else{
        csvData = [["日付", "充放電回数"]];
    }

    data.open("GET", filePath, false); //true:非同期,false:同期
    data.send(null);

    var LF = String.fromCharCode(10); //改行ｺｰﾄﾞ
    var lines = data.responseText.split(LF);

    for (var i = 0; i < lines.length;++i) {
       var cells = lines[i].split(",");
       if( cells.length != 1 ) {
          csvData.push(cells);
        }
    }
    // 日付をDate型にし、実データを数値に変換
    for (var j = 1; j < csvData.length; j++){
        csvData[j][0] = new Date(csvData[j][0]);
        csvData[j][1] = Number(csvData[j][1]);
    }
    return csvData;
}

// CurrentCapacityのデータを%にする
// その日のMaxCapacityの値を取得して、その値を元に%表記にする（日毎にMaxの値が変わることがあるため）
function currentDataPercent(data, mdata){
    for (var i = 1; i < data.length; i++){
        // dataの月日を取得
        // getMonthでは0-11月になってしまうので、+1する
        var currentMonth = data[i][0].getMonth() + 1;
        var currentDate = data[i][0].getDate();

        for (var j = 1; j < mdata.length; j++){
            // maxDataの月日を取得
            var maxMonth = mdata[j][0].getMonth() + 1;
            var maxDate = mdata[j][0].getDate();
            // 二つの月日が一致しているか
            if (currentMonth === maxMonth && currentDate === maxDate){
                data[i][1] = Math.round(data[i][1] / mdata[j][1] * 100);
                break;
            }
        }
    }
    return data;
}

// グラフ作成関数
// flg 0 バッテリー残量
// flg 1 バッテリー最大値
// flg 2 充放電回数
function drawChart(data, flg){
    var title;
    var chartType;
    var vAxisTitle;
    var max;
    var min = new Date();
    var format;

    if (flg === 0){
        title = "バッテリー残量";
        chartType = 'AreaChart';
        vAxisTitle = "%";
        max = 100;
        // 最小値を現在から2週間前に（見やすさ考慮）
        min.setDate(min.getDate() - 14);
        format = "yyyy/MM/dd HH:mm"
    }else if (flg === 1){
        title = "最大バッテリー容量";
        chartType = 'LineChart';
        vAxisTitle = "%";
        max = 100;
        min = null;
        format = "yyyy/MM/dd"
    }else{
        title = "充放電回数";
        chartType = 'LineChart';
        vAxisTitle = "回";
        max = null;
        min = null;
        format = "yyyy/MM/dd"
    }

    var wrapper = new google.visualization.ChartWrapper({
        chartType: chartType,
        dataTable: data,
        options: {
            title: title,
            legend: {
                position: 'none'
            },
            hAxis: {
                format: format,
                viewWindow: {
                    min:min, 
                }
            },
            vAxis: {
                title: vAxisTitle,
                viewWindow:{
                    max: max,
                }
            }
        },
        containerId: 'chart_div'
    });
    wrapper.draw();
}
