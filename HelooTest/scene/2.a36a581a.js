webpackJsonp([2],{

/***/ 290:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("Object.defineProperty(__webpack_exports__, \"__esModule\", { value: true });\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__common__ = __webpack_require__(538);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__errors__ = __webpack_require__(540);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ee_socket__ = __webpack_require__(539);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__socket_multi__ = __webpack_require__(542);\n/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__lamp__ = __webpack_require__(541);\n\n\n\n\n\n\n/* harmony default export */ __webpack_exports__[\"default\"] = ({ common: __WEBPACK_IMPORTED_MODULE_0__common__[\"a\" /* default */], errors: __WEBPACK_IMPORTED_MODULE_1__errors__[\"a\" /* default */], eeSocket: __WEBPACK_IMPORTED_MODULE_2__ee_socket__[\"a\" /* default */], socketMulti: __WEBPACK_IMPORTED_MODULE_3__socket_multi__[\"a\" /* default */], lamp: __WEBPACK_IMPORTED_MODULE_4__lamp__[\"a\" /* default */] });\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/en/index.js\n// module id = 290\n// module chunks = 2\n\n//# sourceURL=webpack:///./src/i18n/en/index.js?");

/***/ }),

/***/ 538:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("/* harmony default export */ __webpack_exports__[\"a\"] = ({\n    loading: 'Loading',\n    modalConfirm: 'Confirm',\n    modalCancel: 'Cancel',\n\n    confirm: 'Confirm',\n    confirmSave: 'Confirm save?',\n    confirmDelete: 'Delete Timer?',\n    noTimer: 'No timer added',\n    addTimer: 'Add Timer',\n    delete: 'Delete',\n    date: 'Date',\n    operation: 'Action',\n    dateError: 'Incorrect data',\n    setDataFirst: 'Please add data first',\n    reachLimit0: 'The number of simple timers has reached the upper limit',\n    reachLimit2: 'The number of period timers has reached the upper limit',\n    reachLimit3: 'The number of recycle timers has reached the upper limit',\n    timerSave: 'Save',\n    isoWeekday: ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],\n    isoWeekdayRepeat: ['', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],\n    months: ['Jan ', 'Feb ', 'Mar ', 'Apr ', 'May ', 'Jun ', 'Jul ', 'Aug ', 'Sept ', 'Oct ', 'Nov ', 'Dec '],\n    repeatSetting: 'Repeat',\n    repeatSettingTitle: 'Repeat Setting',\n    onceRepeat: 'Only once',\n    everydayRepeat: 'Everyday',\n    weekdayRepeat: 'Weekday',\n    weekendRepeat: 'Weekend',\n    customRepeat: 'Custom',\n    customRepeatTitle: 'Custom Repeat Setting',\n    today: 'Today',\n    tomorrow: 'Tomorrow',\n    timeInvalid: 'Please choose a time after current moment',\n    timeOverdue: 'timer is overdue',\n    unitHour: 'hour',\n    unitMinute: 'min',\n    unitHours: 'hours',\n    unitMinutes: 'mins',\n    unitHour2: 'hour',\n    unitMinute2: 'minute',\n    unitHours2: 'hours',\n    unitMinutes2: 'minutes',\n    unitDays: 'days',\n    unitDay: 'day',\n    unitDate: '',\n    later: ' later ',\n    selectExecute: 'Please select the operation to execute',\n    commandOn: 'On',\n    commandOff: 'Off',\n    startTime: 'Start Time',\n    endTime: 'End Time',\n    operateOne: \"Action One\",\n    operateTwo: \"Action Two\",\n    recycleTiming: 'Cycle Timing',\n    recycleRightBtn: 'Cycle',\n    recycleTimingTitle: 'Set Timer',\n    loopAction: 'Advanced',\n    commonTiming: 'Basic',\n    recycleChangeText: 'Loop 2 actions with individually defined duration within a specific time period. Example: Turn on plug switch for 20 minutes, and then turn off plug switch for 30 minutes, and turn on plug switch for 20 minutes, and turn off plug switch for 30 minutes between 8:00 pm and 10:00 pm. ',\n    // recycleChangeText:\"Set two operation loops for a period of time.For example:between 8:00 and 12:00, turn on for 20 minutes, close for 5 minutes, drive 20 minutes ,and so on\",\n    setTowMost: '1 loop timing can be set at most. ',\n    durationTime: 'Duration Time',\n    timeSetError: 'The duration of the switch is greater than the interval between the start time and the end time , please reset.',\n    delaySet: 'Set Custom Delay time',\n    cancelDelay: 'Cancel Delay',\n    timeSafeSetting: 'Time Safe Setting',\n    getTimingFail: 'Get Timing Fail',\n    reachMaximum: 'Reach Maximum Number',\n    pickerHour: 'hour',\n    pickerMinute: 'min',\n    delConfirm: \"Confirm to delete this timer?\",\n    deleteSuccess: 'Delete Success',\n    complete: 'OK',\n    second: 's',\n    Millisecond: 'ms',\n\n    randMode: 'Anti-theft mode',\n    randModeOn: 'Anti-theft mode on',\n    randModeOnTip: 'All the timers will not take effect during the period',\n    randModeIntroduce: 'Random function(on and off randomly)',\n    randTimeSetError: \"The start time is earlier than the end time, please reset.\",\n    monthText: '',\n    yearText: '',\n    dayText: '',\n    selectTime: \"Set Duration\",\n    getTimerFailed: \"Failed to get timing,please check network status.\",\n    reload: \"Reload\",\n    selectOperation: 'Please set the action',\n    timingSet: 'Set Timer'\n});\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/en/common.js\n// module id = 538\n// module chunks = 2\n\n//# sourceURL=webpack:///./src/i18n/en/common.js?");

/***/ }),

/***/ 539:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("var eeSocket = {\n    // loading:'loading',\n    hour: 'hour',\n    hours: 'hours',\n    minute: 'min',\n    minutes: 'mins',\n    // open:'open',\n    // close:'close',\n    // power:'power',\n    delayStart: 'Delay has been started',\n    delayStop: 'Delay has been cancelled',\n    delayCancelAlert: 'Confirm to cancel the delay?',\n    userDefine: 'customize',\n    cancelDelay: 'Cancel delay',\n    closePower: 'close power',\n    openPower: 'open power',\n    mainSwitch: 'Main Switch',\n    switch: 'Switch',\n    usbSwitch: \"USB\",\n    indicatorLight: \"Open Indicator Light\",\n    openIndicatorDesc: \"When the device is opened, the indicator light is on, indicating the state of the device's opening\",\n    colseIndicatorDesc: \"The indicator light will turn off, no matter whether the device is opened or not\",\n    ngLight: \"Night Light\",\n    timer: 'Timer',\n    delay: 'Delay',\n    delayTitleOn: 'Delay Setting Status: On',\n    delayTitleOff: 'Delay Setting Status: Off',\n    powerIsOn: 'Power is on',\n    powerIsOff: 'Power is off',\n\n    //timer info\n    timerSetting: 'Setting',\n    repeatSetting: 'Repeat',\n    customize: 'Customize',\n    chooseDate: 'Date',\n    chooseSwich: 'Swich',\n    delayClose: 'Delay OFF',\n    delayOpen: 'Delay ON',\n    commandOn: 'On',\n    commandOff: 'Off',\n    socket: 'Socket',\n    defaultOn: 'Socket open',\n    defaultOff: 'Socket close',\n    defaultUnknown: 'Unknown',\n    defaultUnset: 'Unset',\n    timerPwr1: 'Open',\n    timerPwr0: 'Close',\n    turnOnPwr1: 'Turn on',\n    turnOnPwr0: 'Turn off',\n    turnOn: 'turn on ',\n    turnOff: 'turn off ',\n    delayTitle: function delayTitle(name, state) {\n        return 'Turn ' + (state === 1 ? ' On ' : ' Off ') + name;\n    },\n    chooseOperation: 'Choose Action',\n    maxWorkTime: \"Max Work Time\",\n    setMaxWorkTime: \"Set Max Work Time\",\n    functionSet: 'Settings',\n    history: 'History',\n    maxTimeDesc: \"After opening, every time the device reaches the time limit, it will automatically turn off the power and avoid the safety hazards caused by the long working hours\",\n    electricStatistics: 'Electricity statistics',\n    deviceName: 'Electric Socket',\n    statistrics: 'statistrics',\n    powrStatistics: 'Powr Statistics',\n    mainIcon: 'Main',\n    lightIcon: 'Light',\n    electricIcon: 'Electric',\n    powerBtn: 'Power',\n    powerDesc: 'Power',\n    titleDesc: function titleDesc(unit) {\n        return 'Electricity on the ' + unit;\n    },\n    KWH: 'kWh',\n    everyHour: 'Every Hour',\n    everyDay: 'Every Day',\n    everyMonth: 'Every Month',\n    emptyData: 'Data empty.',\n    currentHour: 'The Hour',\n    currentDay: 'The Day',\n    currentMonth: 'The Month',\n    attribute: 'Attribute',\n    requestError: 'Request data error!',\n    unitHour: ' hour',\n    unitMonth: 'month',\n    unitDay: ' day',\n    timeSafeSetting: 'Time Safe Setting',\n\n    \"selectDate\": \"Select Date\",\n    \"previousDay\": \"Previous Day\",\n    \"nextDay\": \"Next Day\",\n    \"noUsingHistory\": \"NO Using History\",\n    \"selectValidDate\": \"Please choose a date before today or today !\",\n    \"today\": \"Today\",\n    \"useHistory\": \"Use History\",\n    \"currentPower\": \"Current power\",\n    'willClosePwr': 'Turn off switch XX later',\n    'willOpenPwr': 'Turn on switch XX later',\n    delayTipOpen: 'power on after XX',\n    delayTipClose: 'power off after XX'\n};\n\n/* harmony default export */ __webpack_exports__[\"a\"] = (eeSocket);\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/en/ee-socket.js\n// module id = 539\n// module chunks = 2\n\n//# sourceURL=webpack:///./src/i18n/en/ee-socket.js?");

/***/ }),

/***/ 540:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("/* harmony default export */ __webpack_exports__[\"a\"] = ({\n\t\"-10\": \"READ_ERROR\",\n\t\"-9\": \"WRITE_ERROR\",\n\t\"-8\": \"SEND_ERROR\",\n\t\"-7\": \"AES AUTH FAIL, FOR LOCAL DEVICE, should call add new again\",\n\t\"-6\": \"Structure error\",\n\t\"-5\": \"The space is full\",\n\t\"-4\": \"Unsupported command type\",\n\t\"-3\": \"The device is offline, please check its network connection.\",\n\t\"-2\": \"Logged in from other device Logged out by system\",\n\t\"-1\": \"Authentication failed. The authentication code was changed. You need to refresh the device in WLAN and get new authentication code again.\",\n\n\t\"-4043\": \"Unsupported encryption type\",\n\t\"-4042\": \"SSL reading data content is failed\",\n\t\"-4041\": \"SSL reading data head is failed\",\n\t\"-4040\": \"SSL writing data is failed\",\n\t\"-4039\": \"SSL certificate is invalid\",\n\t\"-4038\": \"SSL and server handshake is failed\",\n\t\"-4037\": \"SSL connecting to server is failed\",\n\t\"-4036\": \"Invalid license\",\n\t\"-4035\": \"The SDK is not registered. Please invoke SDKAuth first.\",\n\t\"-4034\": \"The SDK is registering. Please wait for completion.\",\n\t\"-4033\": \"Invoking system function is failed\",\n\t\"-4032\": \"Script resolution is failed\",\n\t\"-4031\": \"The data is invalid\",\n\t\"-4030\": \"The data buffer space is not enough\",\n\t\"-4029\": \"Related communication address does not exist\",\n\t\"-4028\": \"Communication time out between main board and module\",\n\t\"-4027\": \"The evice does not support IFTTT\",\n\t\"-4026\": \"Data error\",\n\t\"-4025\": \"The SDK version does not support remote control\",\n\t\"-4024\": \"Too frequent operations\",\n\t\"-4023\": \"Invalid license\",\n\t\"-4022\": \"Unsupported param\",\n\t\"-4021\": \"User type error\",\n\t\"-4020\": \"Script file error\",\n\t\"-4019\": \"pat file error\",\n\t\"-4018\": \"Memory allocation is failed\",\n\t\"-4017\": \"Input device information error\",\n\t\"-4016\": \"Data type of JSON string error\",\n\t\"-4015\": \"Passed-in JSON string error\",\n\t\"-4014\": \"Network library initialization is failed\",\n\t\"-4013\": \"DNS lookup is failed\",\n\t\"-4012\": \"Device control ID error. The device is reset and your phone and device are not paired in WLAN.\",\n\t\"-4011\": \"Receiving data encryption verification is failed\",\n\t\"-4010\": \"Receiving data encryption length is failed\",\n\t\"-4009\": \"Network message type error\",\n\t\"-4008\": \"Receiving data packet verification is failed\",\n\t\"-4007\": \"Receiving data packet length error\",\n\t\"-4006\": \"socket operation is failed\",\n\t\"-4005\": \"socket sending is failed\",\n\t\"-4004\": \"Setting socket attribute is failed\",\n\t\"-4003\": \"Creating socket is failed\",\n\t\"-4002\": \"Cancel easyconfig\",\n\t\"-4001\": \"The device is not connected to WLAN\",\n\t\"-4000\": \"Timeout\",\n\n\t\"-1028\": \"Phone number error\",\n\t\"-1029\": \"Saving avatar error\",\n\t\"-1030\": \"Too many attempts of sending verification code\",\n\t\"-1031\": \"Verification code is expired or invalid\",\n\t\"-1032\": \"The phone number has been registered before\",\n\t\"-1033\": \"The phone number or password is incorrect\",\n\t\"-1034\": \"The phone verification code is not verified\",\n\t\"-1035\": \"The account does not exist\",\n\t\"-1036\": \"Too many attempts. Please wait for some time and try again.\",\n\t\"-1037\": \"Login information is incorrect\",\n\t\"-1038\": \"The email address has been registered before\",\n\t\"-1039\": \"The verification code is expired\",\n\t\"-1040\": \"Too many attempts for sending SMS\",\n\t\"-1041\": \"The data is too long\",\n\t\"-1042\": \"The permission format is error\",\n\t\"-1043\": \"The permission exists\",\n\t\"-1044\": \"The role format is error\",\n\t\"-1045\": \"The role exists\",\n\t\"-1046\": \"The organization exists\",\n\t\"-1049\": \"This account has been disabled\",\n\t\"-1050\": \"The password has been reset. Please change password directly.\",\n\t\"-1051\": \"Unsupported 3rd-party OAuth platform\",\n\t\"-1052\": \"3Rd-party OAuth authentication is failed\",\n\t\"-1099\": \"Too frequent operations\",\n\n\t\"-3001\": \"Unknown error\",\n\t\"-3002\": \"The parameter is incorrect\",\n\t\"-3003\": \"Not logged in\",\n\t\"-3004\": \"The network is abnormal\",\n\t\"-3005\": \"The network requests are too fast\",\n\t\"-3006\": \"The server does not return data\",\n\t\"-3101\": \"Unknown error\",\n\t\"-3102\": \"Error before login\",\n\t\"-3103\": \"Device is functioning properly\",\n\t\"-3104\": \"Getting Token error\",\n\t\"-3105\": \"Inquiring resources error\",\n\t\"-3106\": \"Cannot find requested resources\",\n\t\"-3107\": \"Body JSON format error\",\n\t\"-3108\": \"Missing necessary field in data\",\n\t\"-3109\": \"Token/URL is expired\",\n\t\"-3110\": \"Requesting method error\",\n\t\"-3111\": \"User requested stop\",\n\t\"-3112\": \"Unzipping files failed\",\n\t\"-3113\": \"File does not exist\",\n\t\"-3115\": \"AccessKey passed in to control system is void\",\n\t\"-3201\": \"Location error\",\n\t\"-3202\": \"The input parameter is incorrect\",\n\t\"-3203\": \"The user does not log in\",\n\t\"-14001\": \"The server is busy\",\n\t\"-14002\": \"Data error\",\n\t\"-14003\": \"No IR code for this device\",\n\t\"-14004\": \"The IR code exists\",\n\t\"-14005\": \"Too many downloading users. Please wait.\",\n\t\"-14006\": \"No IR code ID for this device\",\n\t\"-14007\": \"IR code calculation is failed\",\n\t\"-14008\": \"Too many records. Please select sub-region\",\n\t\"-14009\": \"Input does not match\",\n\t\"-14010\": \"Item to be added already exits\",\n\t\"-14011\": \"Item to be updated already exits\",\n\t\"-14012\": \"The IR code is not matched yet\",\n\t\"-14013\": \"The region is not allowed\",\n\t\"-14014\": \"No IR code. Please upload.\",\n\t\"-14015\": \"Region ID does not match\",\n\t\"-14016\": \"Region name exists\",\n\t\"-14017\": \"The PID does not exist\",\n\t\"-14018\": \"The querying type does not exist\",\n\t\"-14019\": \"The Group does not exist\",\n\t\"-14020\": \"BizCenter transferring is failed\",\n\t\"-14021\": \"No permission\",\n\t\"-14022\": \"The IR code is too long\",\n\t\"-14023\": \"The picture is too large\",\n\t\"-14024\": \"The state is not allowed\",\n\t\"-14025\": \"The brand does not exist\",\n\t\"-14026\": \"The appliance type does not exist\",\n\t\"-14027\": \"The brand and appliance are not associated\",\n\t\"-14028\": \"The model is not associated to brand\",\n\t\"-14029\": \"Too many user groups are added to the rule\",\n\t\"-14030\": \"Obtained products from Kit is void\",\n\t\"-14031\": \"Cannot find device\",\n\t\"-14032\": \"No new product\",\n\t\"-14033\": \"The product exists\",\n\t\"-14034\": \"Product on Kit is updated and re-approval is required\",\n\t\"-14035\": \"Product format obtained from Kit does not match\",\n\t\"-14036\": \"The user group does not exist\",\n\t\"-14037\": \"Too many product rules\",\n\t\"-14038\": \"Too frequent requests. Please try later.\",\n\t\"-14039\": \"The request does not exist\",\n\t\"-14040\": \"Too many users are added to the user group\",\n\t\"-14041\": \"The user is not found\",\n\t\"-14042\": \"Path error\",\n\t\"-14043\": \"The name exists\",\n\t\"-14044\": \"The permission is not allowed\",\n\t\"-14045\": \"Not found\",\n\t\"-14046\": \"The product category does not exist\",\n\t\"-14047\": \"Kit interaction is failed\",\n\t\"-14048\": \"The file is too long\",\n\t\"-14049\": \"The supplier does not exist\",\n\t\"-14050\": \"The region does not exist\",\n\t\"-14051\": \"The sub-category list is not empty\",\n\t\"-14052\": \"Gallery error\",\n\t\"-14053\": \"The gallery under this category is not empty\",\n\t\"-14054\": \"The permission is not passed\",\n\t\"-14055\": \"The downloading times exceeds limit\",\n\t\"-14056\": \"ticket verification is failed\",\n\t\"-14057\": \"Operating user space error\",\n\n\t\"-2016\": \"The room cannot be deleted because there still have device(s) in this room.\",\n\t\"-2017\": \"error code (-2017)\",\n\t\"-2018\": \"The product does not exist\",\n\t\"-2019\": \"The data conflicts\",\n\t\"-2020\": \"Not beta testing user\",\n\t\"-2021\": \"The name conflicts\",\n\t\"-2022\": \"Not registered phone number \",\n\t\"-2023\": \"The data is too long\",\n\t\"-2024\": \"Cannot quit the home you created\",\n\t\"-2025\": \"The key is not allowed\",\n\t\"-2026\": \"Too many devices in the home\",\n\t\"-2027\": \"The device is not associated with any home member\",\n\t\"-2028\": \"The operation is not allowed\",\n\t\"-2029\": \"The parameter does not match\",\n\t\"-2030\": \"The device does not belong to the home\",\n\t\"-2031\": \"Device not exist\",\n\t\"-2032\": \"Too many modules added in one time\",\n\t\"-2033\": \"The room cannot be deleted because there still have accessories in this room.\",\n\t\"-2034\": \"The user does not exist\",\n\t\"-2035\": \"The VT exists\",\n\t\"-2036\": \"The VT does not exist\",\n\t\"-2037\": \"The VT list is empty\",\n\t\"-2038\": \"Too frequent operations on VT\",\n\t\"-2039\": \"Repeated operation\",\n\t\"-2040\": \"The device information is not complete. Please add again.\"\n});\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/en/errors.js\n// module id = 540\n// module chunks = 2\n\n//# sourceURL=webpack:///./src/i18n/en/errors.js?");

/***/ }),

/***/ 541:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("/**\n * Created by Administrator on 2018/1/15 0015.\n */\n/* harmony default export */ __webpack_exports__[\"a\"] = ({\n    attribute: 'Attribute',\n    deviceName: 'lamp',\n    defaultUnset: 'Unset',\n    turnOnDesc: 'turn on',\n    turnOffDesc: 'turn off',\n    switch: 'Switch',\n    powerIsOn: 'Power is on',\n    powerIsOff: 'Power is off',\n    brightness: \"Brightness\",\n    scene: 'Scene',\n    timer: 'Timer',\n    openPower: 'open power',\n    closePower: 'close power',\n    commandOn: 'On',\n    commandOff: 'Off',\n    nightLight: 'Night Light',\n    cinema: \"Cinema\",\n    cloudySky: 'Cloudy Sky',\n    dusk: 'Dusk',\n    soft: 'Soft',\n    read: 'Read',\n    light: 'Light',\n    define: 'Define',\n    advancedMode: 'Advanced Mode',\n    reset: 'Reset',\n    whiteLightMode: 'White Light Mode',\n    colorLightMode: 'Color Light Mode',\n    colorTemperature: 'Color Temperature',\n    cold: 'Cold',\n    warm: 'Warm',\n    noSet: 'No Set',\n    brightnessSet: 'Set Brightness',\n    sceneSet: 'Set Scene',\n    selectSceneFirst: 'Please select scene first!',\n    adjust: 'Adjust',\n    openSwitcher: 'Open Switcher First��',\n    lighting: 'light',\n    edit: 'Edit',\n    colorTempAdjust: 'White',\n    colorAdjust: 'Color',\n    lightAdjust: 'Brightness',\n    saturation: 'Saturation',\n    setting: 'Settings',\n    dynamicScene: 'Dynamic Scene',\n    staticScene: 'Static Scene',\n    editScene: 'Edit',\n    confirmDeleteTip: 'Remove \"XXX\"?',\n    characterTooLong: 'Your input is too long.',\n    previewTips: \"You cann't control the device in preview mode.\",\n    placeholderSceneName: 'Scene name',\n    confrimSaveTips: 'You have edit the scene, save it?',\n    saveSuccessTips: 'Save successfully.',\n    saveErrorTips: 'Save failed, please try again',\n    transition_ease: 'Slow',\n    transition_nature: 'Normal',\n    transition_intense: 'Fast',\n    showTime_slow: 'Long (5s)',\n    showTime_nature: 'Normal (3s)',\n    showTime_quick: 'Short (0.5s)',\n    randomMode: 'Random Mode',\n    dynamicSceneDesc: 'Dynamic scene can make the light show the frames you set one by one, to create dynamic effect.',\n    dynamicSceneStatus: 'Frame',\n    stateTransitionLabel: 'Transition duration',\n    durationLabel: 'Duration Time',\n    preview: 'Preview',\n    cancelPreview: 'Cancel Preview',\n    settingTitle: 'Settings',\n    RestoreTheDefaultScene: 'Restore Default Scenes',\n    RestoreTheDefaultSceneDesc: 'Restore the data will remove all your customized scenes.',\n    RestoreTheDefaultSceneTips: 'Restore the data will remove all your customized scenes, restore?',\n    RestoreTheDefaultSceneSuccess: 'The default scenes has been restored.',\n    addImages: 'Add picture',\n    random_colortemp: 'Random CCT',\n    random_color: 'Random color',\n    random_brightness: 'Random brightness',\n    selectScene: 'Please select a scene',\n    selectOperation: 'Please set the action',\n    timingSet: 'Set Timer',\n    timerSlotTip: '0 means forever',\n    avaterTip: 'Please select the picture'\n});\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/en/lamp.js\n// module id = 541\n// module chunks = 2\n\n//# sourceURL=webpack:///./src/i18n/en/lamp.js?");

/***/ }),

/***/ 542:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("var _hours$mins$turnOn$tu;\n\nfunction _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }\n\n/* harmony default export */ __webpack_exports__[\"a\"] = (_hours$mins$turnOn$tu = {\n\n   hours: 'hours',\n   mins: 'mins',\n   turnOn: 'turn on',\n   turnOff: 'turn off',\n   turnOnDesc: ' turn on ',\n   turnOffDesc: ' turn off ',\n\n   chooseOperation: 'Set delay',\n   mainSwitch: 'Main Switch',\n   switch: 'Switch',\n   usbSwitch: 'USB',\n   timer: 'Timer',\n   delayButton: 'Delay',\n   will: 'will',\n   power: 'power',\n   timerConfirm: 'confirm',\n   delayTitle: function delayTitle(name, state) {\n      return 'Turn ' + (state === 1 ? ' On' : ' Off') + name;\n   },\n\n   delayStarted: 'delay has been started',\n   confirmDelay: 'confirm the cancellation of delay',\n   delayCanceled: 'delay has been canceled',\n   hour: 'hour'\n}, _defineProperty(_hours$mins$turnOn$tu, 'hours', 'hours'), _defineProperty(_hours$mins$turnOn$tu, 'minute', 'min'), _defineProperty(_hours$mins$turnOn$tu, 'minutes', 'mins'), _defineProperty(_hours$mins$turnOn$tu, 'closePower', 'close power'), _defineProperty(_hours$mins$turnOn$tu, 'openPower', 'open power'), _defineProperty(_hours$mins$turnOn$tu, 'delayTipOpen', 'power on after XX'), _defineProperty(_hours$mins$turnOn$tu, 'delayTipClose', 'power off after XX'), _defineProperty(_hours$mins$turnOn$tu, 'cancelDelay', 'Cancel delay'), _defineProperty(_hours$mins$turnOn$tu, 'defaultUnset', 'Unset'), _defineProperty(_hours$mins$turnOn$tu, 'userDefine', 'customize'), _defineProperty(_hours$mins$turnOn$tu, 'funcSetting', 'FuncSetting'), _defineProperty(_hours$mins$turnOn$tu, 'property', 'Property'), _defineProperty(_hours$mins$turnOn$tu, 'defaultName', 'Socket'), _defineProperty(_hours$mins$turnOn$tu, 'curPower', 'Real time power'), _defineProperty(_hours$mins$turnOn$tu, 'totalPower', 'Total power consumption'), _defineProperty(_hours$mins$turnOn$tu, 'safeModeOn', 'Safe mode on'), _defineProperty(_hours$mins$turnOn$tu, 'overloadTip', 'Device is automatically closed due to overload. Please check whether the total power of the electrical appliances is higher than the maximum power.'), _defineProperty(_hours$mins$turnOn$tu, 'nightlight', 'Light'), _defineProperty(_hours$mins$turnOn$tu, 'powerOn', 'Power On'), _defineProperty(_hours$mins$turnOn$tu, 'powerOff', 'Power Off'), _defineProperty(_hours$mins$turnOn$tu, 'socket', 'Socket'), _defineProperty(_hours$mins$turnOn$tu, 'safeTimeSetting', 'Max Work Time'), _defineProperty(_hours$mins$turnOn$tu, 'safeTimeSettingTitle', 'Max Work Time Setting'), _defineProperty(_hours$mins$turnOn$tu, 'safeTimeTip', 'After opening, every time the device reaches the time limit, it will automatically turn off the power and avoid the safety hazards caused by the long working hours'), _defineProperty(_hours$mins$turnOn$tu, 'indicatorLight', \"Indicator Light\"), _hours$mins$turnOn$tu);\n\n//////////////////\n// WEBPACK FOOTER\n// ./src/i18n/en/socket-multi.js\n// module id = 542\n// module chunks = 2\n\n//# sourceURL=webpack:///./src/i18n/en/socket-multi.js?");

/***/ })

});