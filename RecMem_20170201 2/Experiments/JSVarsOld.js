var wAttentionPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:red; text-align:center'><b>Press the spacebar when you see the circle.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICEAttention", stimType: "AttentionWrong"},
  choices: 'none',
}

var cAttentionPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:blue; text-align:center'><b>Press the spacebar when you see the circle.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICEAttention", stimType: "AttentionCorrect"},
  choices: 'none',
}

var wIsNewPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:red; text-align:center'><b>This is new.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICENew", stimType: "NewWrong"},
  choices: 'none',
}

var cIsNewPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:blue; text-align:center'><b>This is new.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICENew", stimType: "NewCorrect"},
  choices: 'none',
}

var wIsOldPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:red; text-align:center'><b>You have seen this before.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICEOld", stimType: "OldWrong"},
  choices: 'none',
}

var cIsOldPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:blue; text-align:center'><b>You have seen this before.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICEOld", stimType: "OldCorrect"},
  choices: 'none',
}

var tooSlowPractice = {
  type: "single-stim",
  stimulus: ["<p style='color:yellow; text-align:center'><b>Too slow.</b></p>"],
  is_html: true,
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  data: {response: "PRACTICETime", stimType: "Slow"},
  choices: 'none',
}



var AF219_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/AF219_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_056_TUFTS02BW_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_056_TUFTS02BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var AM228_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/AM228_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_001_92012_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_001_92012.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AM01_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/AM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_009_92037_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_009_92037.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var HM03_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/HM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF04_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BF04_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var LF227_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/LF227_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a12F_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a12F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a9F_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a9F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_058_TUFTS07BW_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_058_TUFTS07BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a34M_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a34M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var WM033_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/WM033_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var BF005_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BF005_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var LM216_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/LM216_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WF01_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/WF01_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_060_TUFTS10BW_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_060_TUFTS10BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_010_92038_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_010_92038.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BM002_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BM002_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var OM01_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/OM01_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a39M_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a39M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM045_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BM045_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF037_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BF037_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AM245_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/AM245_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AF218_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/AF218_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var AF03_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/AF03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_061_TUFTS11BW_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_061_TUFTS11BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_003_92016_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_003_92016.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var HF03_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/HF03_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a42M_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/a42M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var WM011_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/WM011_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_006_92025_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_006_92025.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF003_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BF003_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var a21M_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/a21M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_051_SCENE08_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_051_SCENE08.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a37M_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a37M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a10F_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a10F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF002_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BF002_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_053_SCENE15_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_053_SCENE15.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a18F_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/a18F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a7F_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/a7F_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var AF219_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/AF219_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a26M_NC_var_1 = {
  stimulus: "Experiments/REC Stimuli/a26M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_007_92026_var_1 = {
  stimulus: "Experiments/REC Stimuli/PL_007_92026.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var HM01_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/HM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BM08_HO_var_1 = {
  stimulus: "Experiments/REC Stimuli/BM08_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var WF015_FO_var_1 = {
  stimulus: "Experiments/REC Stimuli/WF015_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AM05_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/AM05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF05_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BF05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AM04_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/AM04_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_094_O6_1_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_094_O6_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_046_SCENE03_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_046_SCENE03.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF03_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/BF03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a32M_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a32M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BM01_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BM06_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BM06_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AM204_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/AM204_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AF01_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/AF01_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_091_O5_1_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_091_O5_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a43M_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a43M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM04_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/BM04_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_045_SCENE02_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_045_SCENE02.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a2F_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a2F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a31M_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a31M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var LM242_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/LM242_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_044_SCENE01_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_044_SCENE01.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var HF02_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/HF02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a38M_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a38M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var LF209_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/LF209_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_093_O57_1_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_093_O57_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var AF216_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/AF216_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a30M_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/a30M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WM03_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/WM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_100_O82_1_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_100_O82_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BF009_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BF009_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var WF034_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/WF034_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_041_LEXINGTON17_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_041_LEXINGTON17.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF10_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BF10_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var a19F_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a19F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var WF02_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/WF02_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_043_LEXINGTON19_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_043_LEXINGTON19.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var PL_047_SCENE04_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_047_SCENE04.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AF201_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/AF201_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var LF207_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/LF207_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_096_O69_1_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_096_O69_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a3F_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a3F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AM02_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/AM02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BM028_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BM028_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a29M_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a29M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a13F_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a13F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a15F_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/a15F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var BF018_HO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BF018_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_090_O47_1_var_2 = {
  stimulus: "Experiments/REC Stimuli/PL_090_O47_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BM023_FO_var_2 = {
  stimulus: "Experiments/REC Stimuli/BM023_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AM210_NC_var_2 = {
  stimulus: "Experiments/REC Stimuli/AM210_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_051_SCENE08_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_051_SCENE08.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var LM207_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/LM207_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_003_92016_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_003_92016.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a45M_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a45M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var LM213_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/LM213_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BF023_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/BF023_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var HM05_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/HM05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_053_SCENE15_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_053_SCENE15.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a7F_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/a7F_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AF225_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/AF225_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BF06_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/BF06_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_004_92023_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_004_92023.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var HM01_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/HM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a22M_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a22M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AM03_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/AM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AF02_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/AF02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_057_TUFTS06BW_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_057_TUFTS06BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BM07_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/BM07_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_012_92047_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_012_92047.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var WF015_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/WF015_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var a28M_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a28M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a18F_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a18F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BM03_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/BM03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_001_92012_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_001_92012.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_061_TUFTS11BW_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_061_TUFTS11BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AM01_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/AM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AF219_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/AF219_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a37M_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a37M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var a10F_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a10F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a42M_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/a42M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var HF04_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/HF04_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BM08_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/BM08_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_011_92044_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_011_92044.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_060_TUFTS10BW_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_060_TUFTS10BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var WM011_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/WM011_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a17F_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a17F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var WM033_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/WM033_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var HF03_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/HF03_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var LF227_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/LF227_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a8F_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/a8F_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_056_TUFTS02BW_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_056_TUFTS02BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var PL_009_92037_var_3 = {
  stimulus: "Experiments/REC Stimuli/PL_009_92037.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var HM03_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/HM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AM228_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/AM228_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a41M_NC_var_3 = {
  stimulus: "Experiments/REC Stimuli/a41M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BF07_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/BF07_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a12F_HO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a12F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a6F_FO_var_3 = {
  stimulus: "Experiments/REC Stimuli/a6F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AM02_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/AM02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a13F_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a13F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_043_LEXINGTON19_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_043_LEXINGTON19.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var AM210_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/AM210_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var BF02_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/BF02_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_095_O65_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_095_O65_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a16F_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a16F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a15F_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a15F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_046_SCENE03_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_046_SCENE03.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var o89_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/o89_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_099_O81_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_099_O81_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF009_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/BF009_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BF201_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/BF201_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WF02_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/WF02_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WF223_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/WF223_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var WM006_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/WM006_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var WM01_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/WM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var WM003_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/WM003_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_091_O5_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_091_O5_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var WF04_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/WF04_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM009_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/BM009_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BF10_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/BF10_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a27M_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/a27M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_048_SCENE05_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_048_SCENE05.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_094_O6_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_094_O6_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF016_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/BF016_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BM06_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/BM06_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a36M_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a36M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AM204_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/AM204_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BF03_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/BF03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BM04_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/BM04_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AM05_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/AM05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a5F_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a5F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_045_SCENE02_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_045_SCENE02.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a38M_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a38M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AF235_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/AF235_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var HF05_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/HF05_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a20M_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a20M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var AF01_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/AF01_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_092_O50_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_092_O50_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var PL_040_LEXINGTON16_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_040_LEXINGTON16.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var WF05_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/WF05_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var LM242_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/LM242_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var HF02_HO_var_4 = {
  stimulus: "Experiments/REC Stimuli/HF02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a40M_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a40M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_073_P53_1_var_4 = {
  stimulus: "Experiments/REC Stimuli/PL_073_P53_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var LM211_NC_var_4 = {
  stimulus: "Experiments/REC Stimuli/LM211_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a43M_FO_var_4 = {
  stimulus: "Experiments/REC Stimuli/a43M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AM210_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/AM210_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_041_LEXINGTON17_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_041_LEXINGTON17.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_043_LEXINGTON19_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_043_LEXINGTON19.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BM023_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/BM023_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a45M_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a45M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_003_92016_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_003_92016.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var HM05_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/HM05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var LM207_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/LM207_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a29M_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a29M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a7F_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/a7F_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_004_92023_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_004_92023.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF06_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/BF06_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_047_SCENE04_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_047_SCENE04.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var AF02_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/AF02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var LF209_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/LF209_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WF02_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/WF02_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a3F_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a3F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_012_92047_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_012_92047.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a13F_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a13F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var HF04_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/HF04_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_044_SCENE01_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_044_SCENE01.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BF10_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/BF10_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a28M_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a28M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM03_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/BM03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var AF216_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/AF216_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a19F_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a19F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var WF034_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/WF034_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_001_92012_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_001_92012.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a42M_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/a42M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a10F_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a10F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM08_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/BM08_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var HF02_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/HF02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_045_SCENE02_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_045_SCENE02.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_046_SCENE03_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_046_SCENE03.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a17F_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a17F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var a43M_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a43M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var BM04_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/BM04_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WM011_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/WM011_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_011_92044_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_011_92044.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var LF227_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/LF227_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var AM228_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/AM228_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a12F_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a12F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_009_92037_var_5 = {
  stimulus: "Experiments/REC Stimuli/PL_009_92037.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BM06_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/BM06_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a32M_HO_var_5 = {
  stimulus: "Experiments/REC Stimuli/a32M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var AM04_NC_var_5 = {
  stimulus: "Experiments/REC Stimuli/AM04_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AM05_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/AM05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var HM03_FO_var_5 = {
  stimulus: "Experiments/REC Stimuli/HM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var HM01_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/HM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_053_SCENE15_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_053_SCENE15.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var WF223_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/WF223_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var BF02_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/BF02_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_095_O65_1_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_095_O65_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var WF015_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/WF015_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AM02_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/AM02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var AF219_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/AF219_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a15F_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/a15F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_099_O81_1_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_099_O81_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_051_SCENE08_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_051_SCENE08.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a18F_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/a18F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var WM006_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/WM006_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a37M_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/a37M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF009_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/BF009_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a21M_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/a21M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_061_TUFTS11BW_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_061_TUFTS11BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var PL_091_O5_1_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_091_O5_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var AF03_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/AF03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var WF04_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/WF04_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AM245_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/AM245_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var HF03_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/HF03_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BM009_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/BM009_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a27M_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/a27M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WF01_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/WF01_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_094_O6_1_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_094_O6_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BM002_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/BM002_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a36M_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/a36M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BF03_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/BF03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var OM01_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/OM01_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_060_TUFTS10BW_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_060_TUFTS10BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a38M_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/a38M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var BF005_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/BF005_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BF04_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/BF04_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AM204_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/AM204_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AF219_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/AF219_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_092_O50_1_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_092_O50_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var HF05_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/HF05_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_058_TUFTS07BW_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_058_TUFTS07BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a40M_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/a40M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AF01_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/AF01_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AM01_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/AM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_073_P53_1_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_073_P53_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var WF05_HO_var_6 = {
  stimulus: "Experiments/REC Stimuli/WF05_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_056_TUFTS02BW_var_6 = {
  stimulus: "Experiments/REC Stimuli/PL_056_TUFTS02BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var WM033_FO_var_6 = {
  stimulus: "Experiments/REC Stimuli/WM033_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var LM242_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/LM242_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var LM216_NC_var_6 = {
  stimulus: "Experiments/REC Stimuli/LM216_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var HM03_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/HM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var HF02_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/HF02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a43M_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a43M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_001_92012_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_001_92012.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_009_92037_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_009_92037.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var LM211_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/LM211_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a20M_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a20M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AM228_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/AM228_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var LF227_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/LF227_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a12F_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a12F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var AM05_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/AM05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_040_LEXINGTON16_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_040_LEXINGTON16.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AF235_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/AF235_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_045_SCENE02_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_045_SCENE02.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a9F_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a9F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a34M_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a34M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_010_92038_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_010_92038.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_048_SCENE05_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_048_SCENE05.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF016_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/BF016_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a5F_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a5F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF037_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/BF037_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a39M_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a39M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AF218_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/AF218_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var BM04_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/BM04_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BF201_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/BF201_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BF10_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/BF10_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_046_SCENE03_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_046_SCENE03.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a42M_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/a42M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var BM06_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/BM06_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var WM011_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/WM011_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var WM004_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/WM004_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_003_92016_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_003_92016.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a7F_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/a7F_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var WF02_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/WF02_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var WM01_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/WM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var BF003_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/BF003_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_042_LEXINGTON18_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_042_LEXINGTON18.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var PL_006_92025_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_006_92025.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_007_92026_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_007_92026.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var WM003_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/WM003_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM03_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/BM03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var HF04_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/HF04_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var BM08_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/BM08_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var AM210_NC_var_7 = {
  stimulus: "Experiments/REC Stimuli/AM210_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a16F_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a16F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var a10F_FO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a10F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_043_LEXINGTON19_var_7 = {
  stimulus: "Experiments/REC Stimuli/PL_043_LEXINGTON19.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var a13F_HO_var_7 = {
  stimulus: "Experiments/REC Stimuli/a13F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_060_TUFTS10BW_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_060_TUFTS10BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_056_TUFTS02BW_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_056_TUFTS02BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BF03_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/BF03_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var a6F_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a6F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var BF05_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BF05_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BM01_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a41M_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/a41M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_094_O6_1_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_094_O6_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var BF07_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BF07_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a8F_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/a8F_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var a31M_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a31M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a38M_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a38M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var AF01_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/AF01_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var PL_061_TUFTS11BW_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_061_TUFTS11BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var PL_091_O5_1_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_091_O5_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var WM033_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/WM033_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var AF219_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/AF219_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var AM204_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/AM204_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var HF03_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/HF03_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a2F_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a2F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var PL_093_O57_1_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_093_O57_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AM01_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/AM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a37M_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a37M_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var LM242_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/LM242_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var PL_057_TUFTS06BW_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_057_TUFTS06BW.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BF009_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BF009_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var a18F_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a18F_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var WM03_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/WM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var WF015_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/WF015_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var a30M_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/a30M_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var BM07_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/BM07_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_100_O82_1_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_100_O82_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AF225_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/AF225_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var PL_053_SCENE15_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_053_SCENE15.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var a22M_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a22M_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var PL_096_O69_1_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_096_O69_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var AM02_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/AM02_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};

var AF201_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/AF201_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var LF207_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/LF207_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldneutface" }
};

var AM03_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/AM03_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_051_SCENE08_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_051_SCENE08.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newplace" }
};

var BM028_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BM028_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var HM01_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/HM01_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newposface" }
};

var a15F_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/a15F_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldnegface" }
};

var BF023_FO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BF023_FO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newnegface" }
};

var PL_090_O47_1_var_8 = {
  stimulus: "Experiments/REC Stimuli/PL_090_O47_1.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldplace" }
};

var LM213_NC_var_8 = {
  stimulus: "Experiments/REC Stimuli/LM213_NC.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "new", stimType: "newneutface" }
};

var BF018_HO_var_8 = {
  stimulus: "Experiments/REC Stimuli/BF018_HO.bmp",
  prompt: '<div id="textbox">  <p class="new">NEW<br>LEFTARROW</p><p class="old">OLD<br>RIGHTARROW</p><div style="clear:both;"></div></div>',
  timing_stim: 2000,
  data: { response: "old", stimType: "oldposface" }
};
