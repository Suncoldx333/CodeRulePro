webpackJsonp([1],{

/***/ 291:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("Object.defineProperty(__webpack_exports__, \"__esModule\", { value: true });\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__common__ = __webpack_require__(543);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__errors__ = __webpack_require__(545);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ee_socket__ = __webpack_require__(544);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__socket_multi__ = __webpack_require__(547);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__lamp__ = __webpack_require__(546);\n\n\n\n\n\n\n/* harmony default export */ __webpack_exports__[\"default\"] = ({ common: __WEBPACK_IMPORTED_MODULE_0__common__[\"a\" /* default */], errors: __WEBPACK_IMPORTED_MODULE_1__errors__[\"a\" /* default */], eeSocket: __WEBPACK_IMPORTED_MODULE_2__ee_socket__[\"a\" /* default */], socketMulti: __WEBPACK_IMPORTED_MODULE_3__socket_multi__[\"a\" /* default */], lamp: __WEBPACK_IMPORTED_MODULE_4__lamp__[\"a\" /* default */] });\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/ja/index.js\n// module id = 291\n// module chunks = 1\n\n//# sourceURL=webpack:///./src/i18n/ja/index.js?");

/***/ }),

/***/ 543:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("/* harmony default export */ __webpack_exports__[\"a\"] = ({\n    loading: 'ロード中',\n    modalConfirm: '確定',\n    modalCancel: '取消',\n\n    confirm: '確定',\n    confirmSave: '保存しますか？',\n    confirmDelete: '削除しますか？',\n    noTimer: '登録がありません',\n    addTimer: 'タイマー追加',\n    delete: '削除',\n    date: '日付',\n    operation: '動作',\n    dateError: 'エラー',\n    setDataFirst: '登録を行ってください',\n    reachLimit0: '登録件数が上限に達しました。',\n    reachLimit2: '登録件数が上限に達しました。',\n    reachLimit3: '登録件数が上限に達しました。',\n    timerSave: '保存',\n    isoWeekday: ['', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日'],\n    isoWeekdayRepeat: ['', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日'],\n    months: ['1月 ', '2月 ', '3月 ', '4月 ', '5月 ', '6月 ', '7月 ', '8月 ', '9月 ', '10月 ', '11月 ', '12月 '],\n    repeatSetting: '繰り返し',\n    repeatSettingTitle: 'Repeat Setting', // 回头看\n    onceRepeat: '一回実行',\n    everydayRepeat: '毎日',\n    weekdayRepeat: '平日',\n    weekendRepeat: '土日',\n    customRepeat: 'カスタム',\n    customRepeatTitle: 'カスタム',\n    today: '今日',\n    tomorrow: '明日',\n    timeInvalid: '再度選択してください',\n    timeOverdue: 'タイムアウト',\n    unitHour: '時',\n    unitMinute: '分',\n    unitHours: '時',\n    unitMinutes: '分',\n    unitHour2: '時間',\n    unitMinute2: '分',\n    unitHours2: '時間',\n    unitMinutes2: '分',\n    unitDays: '日',\n    unitDay: '日',\n    unitDate: '',\n    later: ' 後 ',\n    selectExecute: '動作を選択してください',\n    commandOn: 'オン',\n    commandOff: 'オフ',\n    startTime: '開始時間',\n    endTime: '終了時間',\n    operateOne: \"動作１\",\n    operateTwo: \"動作２\",\n    recycleTiming: '繰り返し',\n    recycleRightBtn: '繰り返し',\n    recycleTimingTitle: '繰り返し', // 回头看\n    loopAction: '繰り返し',\n    commonTiming: 'タイマー',\n    recycleChangeText: '時間を指定してON/OFFを繰り返し実行します。例．18時〜23時の間で加湿器を1時間ごとにON/OFF',\n    // recycleChangeText:\"Set two operation loops for a period of time.For example:between 8:00 and 12:00, turn on for 20 minutes, close for 5 minutes, drive 20 minutes ,and so on\",\n    setTowMost: '1件のみ繰り返しタイマーを登録できます',\n    durationTime: '期間',\n    timeSetError: 'ON/OFFの実行間隔は設定期間より短くしてください',\n    delaySet: 'カウントダウン',\n    cancelDelay: '取消',\n    getTimingFail: '取得失敗',\n    reachMaximum: '登録件数が上限に達しました',\n    pickerHour: '時',\n    pickerMinute: '分',\n    delConfirm: \"タイマーを削除しますか？\",\n    deleteSuccess: 'Delete Success',\n    complete: '確定',\n    second: '秒',\n    Millisecond: 'ミリ秒',\n\n    randMode: 'Anti-theft mode',\n    randModeOn: 'Anti-theft mode on',\n    randModeOnTip: 'All the timers will not take effect during the period',\n    randModeIntroduce: 'Random function(on and off randomly)',\n    randTimeSetError: \"開始時間は終了時間より前に設定してください\",\n    monthText: '月',\n    yearText: '日',\n    dayText: '年',\n    selectTime: \"タイマー設定\",\n    getTimerFailed: \"エラー。ネットワーク状況を確認してください\",\n    reload: \"再読み込み\",\n    selectOperation: '動作',\n    timingSet: 'タイマー設定'\n});\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/ja/common.js\n// module id = 543\n// module chunks = 1\n\n//# sourceURL=webpack:///./src/i18n/ja/common.js?");

/***/ }),

/***/ 544:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("var eeSocket = {\n    // loading:'loading',\n    hour: '時間',\n    hours: '時間',\n    minute: '分',\n    minutes: '分',\n    // open:'open',\n    // close:'close',\n    // power:'power',\n    delayStart: 'カウントダウン',\n    delayStop: 'カウントダウン取消',\n    delayCancelAlert: '取消しますか？',\n    userDefine: 'カスタム',\n    cancelDelay: '取消',\n    closePower: '電源OFF',\n    openPower: '電源ON',\n    mainSwitch: 'Main Switch',\n    switch: '電源',\n    usbSwitch: \"USB\",\n    indicatorLight: \"Open Indicator Light\",\n    openIndicatorDesc: \"When the device is opened, the indicator light is on, indicating the state of the device's opening\",\n    colseIndicatorDesc: \"The indicator light will turn off, no matter whether the device is opened or not\",\n    ngLight: \"ライト\",\n    timer: 'タイマー',\n    delay: '秒読み',\n    delayTitleOn: 'カウントダウン',\n    delayTitleOff: 'カウントダウン',\n    powerIsOn: '電源ON',\n    powerIsOff: '電源OFF',\n\n    //timer info\n    timerSetting: 'タイマー設定',\n    repeatSetting: '繰り返し',\n    customize: 'カスタム',\n    chooseDate: '日付選択',\n    chooseSwich: 'Swich',\n    delayClose: 'OFF延長',\n    delayOpen: 'ON延長',\n    commandOn: 'ON',\n    commandOff: 'OFF',\n    socket: '電源',\n    defaultOn: 'プラグON',\n    defaultOff: 'プラグOFF',\n    defaultUnknown: '不明',\n    defaultUnset: '未設定',\n    timerPwr1: 'ON',\n    timerPwr0: 'OFF',\n    turnOnPwr1: '電源ON',\n    turnOnPwr0: '電源OFF',\n    turnOn: '電源ON',\n    turnOff: '電源OFF',\n    delayTitle: function delayTitle(name, state) {\n        return 'Turn ' + (state === 1 ? ' On ' : ' Off ') + name;\n    },\n    chooseOperation: '実行を選択してください',\n    maxWorkTime: \"Max Work Time\",\n    setMaxWorkTime: \"Set Max Work Time\",\n    functionSet: '詳細',\n    history: '履歴',\n    maxTimeDesc: \"After opening, every time the device reaches the time limit, it will automatically turn off the power and avoid the safety hazards caused by the long working hours\",\n    electricStatistics: '電力量集計',\n    deviceName: 'Electric Socket',\n    statistrics: '集計',\n    powrStatistics: '電力集計',\n    mainIcon: 'Main',\n    lightIcon: 'ライト',\n    electricIcon: '消費電力量',\n    powerBtn: '電力',\n    powerDesc: '電力',\n    titleDesc: function titleDesc(unit) {\n        return 'Electricity on the ' + unit;\n    },\n    KWH: 'kWh',\n    everyHour: '毎時',\n    everyDay: '毎日',\n    everyMonth: '毎月',\n    emptyData: 'データがありません',\n    currentHour: '時間',\n    currentDay: '日',\n    currentMonth: '月',\n    attribute: '設定',\n    requestError: '取得失敗',\n    unitHour: '時',\n    unitMonth: '月',\n    unitDay: '日',\n    timeSafeSetting: 'Time Safe Setting',\n\n    \"selectDate\": \"日付を選択\",\n    \"previousDay\": \"前日\",\n    \"nextDay\": \"翌日\",\n    \"noUsingHistory\": \"履歴がありません\",\n    \"selectValidDate\": \"今日または今日より前の日付を選択してください\",\n    \"today\": \"今日\",\n    \"useHistory\": \"使用履歴\",\n    \"currentPower\": \"現在の消費電力\",\n    'willClosePwr': 'XX後電源OFF',\n    'willOpenPwr': 'XX後電源ON',\n    delayTipOpen: 'XX後電源ON',\n    delayTipClose: 'XX後電源OFF'\n};\n\n/* harmony default export */ __webpack_exports__[\"a\"] = (eeSocket);\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/ja/ee-socket.js\n// module id = 544\n// module chunks = 1\n\n//# sourceURL=webpack:///./src/i18n/ja/ee-socket.js?");

/***/ }),

/***/ 545:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("/* harmony default export */ __webpack_exports__[\"a\"] = ({\n\t\"-10\": \"READ_ERROR\",\n\t\"-9\": \"WRITE_ERROR\",\n\t\"-8\": \"SEND_ERROR\",\n\t\"-7\": \"AES AUTH FAIL, FOR LOCAL DEVICE, should call add new again\",\n\t\"-6\": \"システムエラー\",\n\t\"-5\": \"容量不足\",\n\t\"-4\": \"サポートされていない動作です\",\n\t\"-3\": \"デバイスはオフラインです。ネットワーク接続を確認してください。\",\n\t\"-2\": \"他の端末からログインがあったためログアウトされました\",\n\t\"-1\": \"認証エラー。デバイスを再起動してください。\",\n\t\"-4043\": \"暗号化タイプエラー\",\n\t\"-4042\": \"データの読み取り失敗\",\n\t\"-4041\": \"データヘッダーの読み取り失敗\",\n\t\"-4040\": \"データの書き込み失敗\",\n\t\"-4039\": \"証明書が無効です\",\n\t\"-4038\": \"サーバー通信失敗\",\n\t\"-4037\": \"サーバー接続失敗\",\n\t\"-4036\": \"ライセンス無効\",\n\t\"-4035\": \"サーバー認証エラー\",\n\t\"-4034\": \"ただいま登録中です。完了までお待ちください。\",\n\t\"-4033\": \"システムの呼び出しに失敗しました\",\n\t\"-4032\": \"スクリプト解析失敗\",\n\t\"-4031\": \"データ無効\",\n\t\"-4030\": \"データ容量が不足しています。\",\n\t\"-4029\": \"関連する通信アドレスが存在しません\",\n\t\"-4028\": \"タイムアウト\",\n\t\"-4027\": \"The evice does not support IFTTT\",\n\t\"-4026\": \"データ　エラー\",\n\t\"-4025\": \"このバージョンはリモート操作非対応です\",\n\t\"-4024\": \"連続操作エラー\",\n\t\"-4023\": \"ライセンス無効\",\n\t\"-4022\": \"この設定はサポートされていません\",\n\t\"-4021\": \"ユーザータイプ　エラー\",\n\t\"-4020\": \"スクリプトファイル　エラー\",\n\t\"-4019\": \"パットファイル　エラー\",\n\t\"-4018\": \"メモリー配置失敗\",\n\t\"-4017\": \"入力デバイス情報エラー\",\n\t\"-4016\": \"Jsonタイプエラー\",\n\t\"-4015\": \"Jsonエラー\",\n\t\"-4014\": \"ネットワークライブラリ初期化失敗\",\n\t\"-4013\": \"ドメイン名解析失敗\",\n\t\"-4012\": \"デバイスコントロールIDエラー。デバイスはリッセトされ、スマホとペアリング失敗。\",\n\t\"-4011\": \"受信データ暗号化認証失敗\",\n\t\"-4010\": \"受信データ暗号が長すぎます\",\n\t\"-4009\": \"ネットワークメッセージタイプ　エラー\",\n\t\"-4008\": \"受信データパケット認証失敗\",\n\t\"-4007\": \"受信データパケットが長すぎます\",\n\t\"-4006\": \"ソケットオペレーション失敗\",\n\t\"-4005\": \"ソケット発信失敗\",\n\t\"-4004\": \"ソケット設置失敗\",\n\t\"-4003\": \"ソケット新規登録失敗\",\n\t\"-4002\": \"設定キャンセル\",\n\t\"-4001\": \"デバイスはオフライン\",\n\t\"-4000\": \"タイムアウト\",\n\t\"-1028\": \"携帯電話番号エラー\",\n\t\"-1029\": \"イメージ画像エラー\",\n\t\"-1030\": \"認証コードの送信が頻繁すぎます\",\n\t\"-1031\": \"認証コードタイムアウトあるいは存在しない\",\n\t\"-1032\": \"既に登録済みの番号です\",\n\t\"-1033\": \"携帯電話番号またはパスワードが正しくありません\",\n\t\"-1034\": \"携帯電話認証コードが無効です\",\n\t\"-1035\": \"アカウントが存在しません\",\n\t\"-1036\": \"しばらく経ってからお試しください\",\n\t\"-1037\": \"ログイン情報が正しくありません\",\n\t\"-1038\": \"既に登録済みのメールアドレスです\",\n\t\"-1039\": \"この認証コードは無効です\",\n\t\"-1040\": \"ショートメッセージの送信が頻繁すぎます\",\n\t\"-1041\": \"データが長すぎます\",\n\t\"-1042\": \"権限フォーマット　エラー\",\n\t\"-1043\": \"権限は既に登録されています\",\n\t\"-1044\": \"ロールフォーマット　エラー\",\n\t\"-1045\": \"ロールは既に登録されています\",\n\t\"-1046\": \"構成は既に登録されています\",\n\t\"-1049\": \"このアカウントは無効です\",\n\t\"-1050\": \"パスワードがリセットされました。パスワードを変更してください。\",\n\t\"-1051\": \"Oauth認証をサポートしていません\",\n\t\"-1052\": \"Oauth認証失敗\",\n\t\"-1099\": \"連続操作エラー\",\n\t\"-3001\": \"不明なエラー\",\n\t\"-3002\": \"設定エラー\",\n\t\"-3003\": \"ログインされていません\",\n\t\"-3004\": \"ネットワークが異常です\",\n\t\"-3005\": \"ネットワークリクエストが速すぎます\",\n\t\"-3006\": \"サーバー応答なし\",\n\t\"-3101\": \"不明なエラー\",\n\t\"-3102\": \"未登録です\",\n\t\"-3103\": \"デバイスは正常です\",\n\t\"-3104\": \"トークン取得エラー\",\n\t\"-3105\": \"リソース照会エラー\",\n\t\"-3106\": \"リソースが見つかりませんでした\",\n\t\"-3107\": \"本文JSONフォーマット　エラー\",\n\t\"-3108\": \"データ領域が不足しています\",\n\t\"-3109\": \"トークンの期限切れ\",\n\t\"-3110\": \"リクエスト方法エラー\",\n\t\"-3111\": \"停止要求\",\n\t\"-3112\": \"ファイルの解凍に失敗しました\",\n\t\"-3113\": \"ファイルが存在しません\",\n\t\"-3115\": \"アクセスキーは無効\",\n\t\"-3201\": \"位置エラー\",\n\t\"-3202\": \"入力パラメータが正しくありません\",\n\t\"-3203\": \"ログインされていません\",\n\t\"-14001\": \"サーバーが混雑しています\",\n\t\"-14002\": \"データ　エラー\",\n\t\"-14003\": \"このデバイスのIRコードが見つかりません\",\n\t\"-14004\": \"IRコードは登録されています\",\n\t\"-14005\": \"少々お待ち下さい\",\n\t\"-14006\": \"このデバイスのIRコードIDがありません\",\n\t\"-14007\": \"失敗しました\",\n\t\"-14008\": \"他の地域を選択してください\",\n\t\"-14009\": \"入力が一致しません\",\n\t\"-14010\": \"追加内容は既に登録されています\",\n\t\"-14011\": \"登録されていません\",\n\t\"-14012\": \"IRコード未学習\",\n\t\"-14013\": \"この地域では使用できません\",\n\t\"-14014\": \"学習データがありません。アップロードしてください。\",\n\t\"-14015\": \"地域IDが一致しません\",\n\t\"-14016\": \"地域名が既に登録されています\",\n\t\"-14017\": \"存在しない製品IDです\",\n\t\"-14018\": \"タイプが存在しません\",\n\t\"-14019\": \"グループが登録されていません\",\n\t\"-14020\": \"転送失敗\",\n\t\"-14021\": \"権限がありません\",\n\t\"-14022\": \"IRコードが長すぎます\",\n\t\"-14023\": \"画像が大きすぎます\",\n\t\"-14024\": \"許可されていません\",\n\t\"-14025\": \"メーカーが登録されていません\",\n\t\"-14026\": \"家電タイプが登録されていません\",\n\t\"-14027\": \"メーカーが登録されていません\",\n\t\"-14028\": \"家電の型番が登録されていません\",\n\t\"-14029\": \"追加できるユーザー数が上限に達しました\",\n\t\"-14030\": \"Kitから取得したデバイスは無効です。\",\n\t\"-14031\": \"取得失敗\",\n\t\"-14032\": \"新製品なし\",\n\t\"-14033\": \"既存デバイス\",\n\t\"-14034\": \"Kit製品が更新され、再承認が必要です。\",\n\t\"-14035\": \"取得した製品フォーマットが一致しません\",\n\t\"-14036\": \"ユーザーグループが存在しません\",\n\t\"-14037\": \"製品の規則過多\",\n\t\"-14038\": \"しばらく経ってからお試しください\",\n\t\"-14039\": \"リクエストが存在しません\",\n\t\"-14040\": \"ユーザーグループが上限に達しました\",\n\t\"-14041\": \"ユーザーが見つかりません\",\n\t\"-14042\": \"エラー\",\n\t\"-14043\": \"この名前は既に使用されています\",\n\t\"-14044\": \"許可されていません\",\n\t\"-14045\": \"見つかりません\",\n\t\"-14046\": \"製品カテゴリは存在しません\",\n\t\"-14047\": \"失敗しました\",\n\t\"-14048\": \"ファイルが長すぎます\",\n\t\"-14049\": \"存在しません\",\n\t\"-14050\": \"この地域は存在しません\",\n\t\"-14051\": \"サブカテゴリーにデータがあります\",\n\t\"-14052\": \"エラー\",\n\t\"-14053\": \"このカテゴリのギャラリーにデータがあります\",\n\t\"-14054\": \"許可されていません\",\n\t\"-14055\": \"ダウンロード回数が上限に達しました\",\n\t\"-14056\": \"認証失敗\",\n\t\"-14057\": \"エラー\",\n\t\"-2016\": \"デバイスを削除してからホームを削除してください\",\n\t\"-2017\": \"エラーコード（-2017）\",\n\t\"-2018\": \"デバイスが存在しません\",\n\t\"-2019\": \"データエラー\",\n\t\"-2020\": \"このアカウントは許可されていません\",\n\t\"-2021\": \"この名前は既に使用されています\",\n\t\"-2022\": \"この端末は登録されている端末ではありません\",\n\t\"-2023\": \"データが長すぎます\",\n\t\"-2024\": \"退出できません\",\n\t\"-2025\": \"許可されていません\",\n\t\"-2026\": \"デバイス数が上限に達しました\",\n\t\"-2027\": \"メンバーの登録がありません\",\n\t\"-2028\": \"許可されていません\",\n\t\"-2029\": \"パラメータが一致しません\",\n\t\"-2030\": \"デバイスがホームに登録されていません\",\n\t\"-2031\": \"デバイスが登録されていません\",\n\t\"-2032\": \"一度に追加するモジュールが多すぎます\",\n\t\"-2033\": \"デバイスを削除してからホームを削除してください\",\n\t\"-2034\": \"登録されていません\",\n\t\"-2035\": \"VTが登録されています\",\n\t\"-2036\": \"VTが登録されていません\",\n\t\"-2037\": \"VT操作リストがありません\",\n\t\"-2038\": \"VT操作過多\",\n\t\"-2039\": \"繰り返し操作\",\n\t\"-2040\": \"デバイス情報を追加してください\"\n});\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/ja/errors.js\n// module id = 545\n// module chunks = 1\n\n//# sourceURL=webpack:///./src/i18n/ja/errors.js?");

/***/ }),

/***/ 546:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("/**\n * Created by Administrator on 2018/1/15 0015.\n */\n/* harmony default export */ __webpack_exports__[\"a\"] = ({\n    attribute: 'Attribute',\n    deviceName: 'lamp',\n    defaultUnset: 'Unset',\n    turnOnDesc: 'turn on',\n    turnOffDesc: 'turn off',\n    switch: 'Switch',\n    powerIsOn: 'Power is on',\n    powerIsOff: 'Power is off',\n    brightness: \"Brightness\",\n    scene: 'Scene',\n    timer: 'Timer',\n    openPower: 'open power',\n    closePower: 'close power',\n    commandOn: 'On',\n    commandOff: 'Off',\n    nightLight: 'Night Light',\n    cinema: \"Cinema\",\n    cloudySky: 'Cloudy Sky',\n    dusk: 'Dusk',\n    soft: 'Soft',\n    read: 'Read',\n    light: 'Light',\n    define: 'Define',\n    advancedMode: 'Advanced Mode',\n    reset: 'Reset',\n    whiteLightMode: 'White Light Mode',\n    colorLightMode: 'Color Light Mode',\n    colorTemperature: 'Color Temperature',\n    cold: 'Cold',\n    warm: 'Warm',\n    noSet: 'No Set',\n    brightnessSet: 'Set Brightness',\n    sceneSet: 'Set Scene',\n    selectSceneFirst: 'Please select scene first!',\n    adjust: 'Adjust',\n    openSwitcher: 'Open Switcher First��',\n    lighting: 'light',\n    edit: 'Edit',\n    colorTempAdjust: 'White',\n    colorAdjust: 'Color',\n    lightAdjust: 'Brightness',\n    saturation: 'Saturation',\n    setting: 'Settings',\n    dynamicScene: 'Dynamic Scene',\n    staticScene: 'Static Scene',\n    editScene: 'Edit',\n    confirmDeleteTip: 'Remove \"XXX\"?',\n    characterTooLong: 'Your input is too long.',\n    previewTips: \"You cann't control the device in preview mode.\",\n    placeholderSceneName: 'Scene name',\n    confrimSaveTips: 'You have edit the scene, save it?',\n    saveSuccessTips: 'Save successfully.',\n    saveErrorTips: 'Save failed, please try again',\n    transition_ease: 'Slow',\n    transition_nature: 'Normal',\n    transition_intense: 'Fast',\n    showTime_slow: 'Long (5s)',\n    showTime_nature: 'Normal (3s)',\n    showTime_quick: 'Short (0.5s)',\n    randomMode: 'Random Mode',\n    dynamicSceneDesc: 'Dynamic scene can make the light show the frames you set one by one, to create dynamic effect.',\n    dynamicSceneStatus: 'Frame',\n    stateTransitionLabel: 'Transition duration',\n    durationLabel: 'Duration Time',\n    preview: 'Preview',\n    cancelPreview: 'Cancel Preview',\n    settingTitle: 'Settings',\n    RestoreTheDefaultScene: 'Restore Default Scenes',\n    RestoreTheDefaultSceneDesc: 'Restore the data will remove all your customized scenes.',\n    RestoreTheDefaultSceneTips: 'Restore the data will remove all your customized scenes, restore?',\n    RestoreTheDefaultSceneSuccess: 'The default scenes has been restored.',\n    addImages: 'Add picture',\n    random_colortemp: 'Random CCT',\n    random_color: 'Random color',\n    random_brightness: 'Random brightness',\n    selectScene: 'Please select a scene',\n    selectOperation: 'Aktion wählen',\n    timingSet: 'Einstellung',\n    timerSlotTip: '0 means forever',\n    avaterTip: 'Please select the picture'\n});\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/ja/lamp.js\n// module id = 546\n// module chunks = 1\n\n//# sourceURL=webpack:///./src/i18n/ja/lamp.js?");

/***/ }),

/***/ 547:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("var _hours$mins$turnOn$tu;\n\nfunction _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }\n\n/* harmony default export */ __webpack_exports__[\"a\"] = (_hours$mins$turnOn$tu = {\n\n   hours: 'hours',\n   mins: 'mins',\n   turnOn: 'turn on',\n   turnOff: 'turn off',\n   turnOnDesc: ' turn on ',\n   turnOffDesc: ' turn off ',\n\n   chooseOperation: 'Set delay',\n   mainSwitch: 'Main Switch',\n   switch: 'Switch',\n   usbSwitch: 'USB',\n   timer: 'Timer',\n   delayButton: 'Delay',\n   will: 'will',\n   power: 'power',\n   timerConfirm: 'confirm',\n   delayTitle: function delayTitle(name, state) {\n      return 'Turn ' + (state === 1 ? ' On' : ' Off') + name;\n   },\n\n   delayStarted: 'カウントダウン開始',\n   confirmDelay: '取消しますか？',\n   delayCanceled: 'カウントダウン取消',\n   hour: 'hour'\n}, _defineProperty(_hours$mins$turnOn$tu, 'hours', 'hours'), _defineProperty(_hours$mins$turnOn$tu, 'minute', 'min'), _defineProperty(_hours$mins$turnOn$tu, 'minutes', 'mins'), _defineProperty(_hours$mins$turnOn$tu, 'closePower', 'close power'), _defineProperty(_hours$mins$turnOn$tu, 'openPower', 'open power'), _defineProperty(_hours$mins$turnOn$tu, 'delayTipOpen', 'power on after XX'), _defineProperty(_hours$mins$turnOn$tu, 'delayTipClose', 'power off after XX'), _defineProperty(_hours$mins$turnOn$tu, 'cancelDelay', 'Cancel delay'), _defineProperty(_hours$mins$turnOn$tu, 'defaultUnset', 'Unset'), _defineProperty(_hours$mins$turnOn$tu, 'userDefine', 'customize'), _defineProperty(_hours$mins$turnOn$tu, 'funcSetting', 'FuncSetting'), _defineProperty(_hours$mins$turnOn$tu, 'property', 'Property'), _defineProperty(_hours$mins$turnOn$tu, 'defaultName', 'Socket'), _defineProperty(_hours$mins$turnOn$tu, 'curPower', 'Real time power'), _defineProperty(_hours$mins$turnOn$tu, 'totalPower', 'Total power consumption'), _defineProperty(_hours$mins$turnOn$tu, 'safeModeOn', 'Safe mode on'), _defineProperty(_hours$mins$turnOn$tu, 'overloadTip', 'Device is automatically closed due to overload. Please check whether the total power of the electrical appliances is higher than the maximum power.'), _defineProperty(_hours$mins$turnOn$tu, 'nightlight', 'Light'), _defineProperty(_hours$mins$turnOn$tu, 'powerOn', 'Power On'), _defineProperty(_hours$mins$turnOn$tu, 'powerOff', 'Power Off'), _defineProperty(_hours$mins$turnOn$tu, 'socket', 'Socket'), _defineProperty(_hours$mins$turnOn$tu, 'safeTimeSetting', 'Max Work Time'), _defineProperty(_hours$mins$turnOn$tu, 'safeTimeSettingTitle', 'Max Work Time Setting'), _defineProperty(_hours$mins$turnOn$tu, 'safeTimeTip', 'After opening, every time the device reaches the time limit, it will automatically turn off the power and avoid the safety hazards caused by the long working hours'), _defineProperty(_hours$mins$turnOn$tu, 'indicatorLight', \"Indicator Light\"), _hours$mins$turnOn$tu);\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/ja/socket-multi.js\n// module id = 547\n// module chunks = 1\n\n//# sourceURL=webpack:///./src/i18n/ja/socket-multi.js?");

/***/ })

});