var initialize = {
  type: 'single-stim',
  stimulus: ['<p style="font-size:20px; color:orange; text-align:center; padding-top: 17.5%">Press the space bar to start!</p>'],
  is_html: true,
  //timing_response: 2000, // how long to show the fixation for
  //choices: 'none', // don't allow any responses from the subject
  timing_post_trial: 0,
  response_ends_trial: true,
  //timing_stim: 2000,
}


var fixation_block = {
  type: 'single-stim',
  stimulus: ['<p style="font-size:80px; color:green; text-align:center"><br><br><br><br>+</br></p>'],
  //stimulus: "<p class='fixation'><br><br><br><br>+</br></p>",
  //prompt: "<p class='fixation'><br><br><br><br>+</br></p>",
  is_html: true,
  timing_response: 2000, // how long to show the fixation for
  //choices: 'none', // don't allow any responses from the subject
  timing_post_trial: 0,
  timing_stim: 2000,
  data: { stimType: "fixation" },
};

var MF_block1 = [AF219_NC_var_1,PL_056_TUFTS02BW_var_1,attentionCheck1,AM228_NC_var_1,PL_001_92012_var_1,AM01_HO_var_1,PL_009_92037_var_1,HM03_FO_var_1,BF04_FO_var_1,LF227_NC_var_1,a12F_HO_var_1,a9F_FO_var_1,PL_058_TUFTS07BW_var_1,a34M_HO_var_1,WM033_FO_var_1,attentionCheck1,BF005_HO_var_1,attentionCheck1,LM216_NC_var_1,WF01_NC_var_1,PL_060_TUFTS10BW_var_1,PL_010_92038_var_1,BM002_HO_var_1,OM01_FO_var_1,a39M_FO_var_1,BM045_FO_var_1,BF037_HO_var_1,AM245_NC_var_1,AF218_NC_var_1,attentionCheck1,AF03_FO_var_1,PL_061_TUFTS11BW_var_1,PL_003_92016_var_1,HF03_HO_var_1,a42M_NC_var_1,WM011_HO_var_1,PL_006_92025_var_1,BF003_FO_var_1,a21M_NC_var_1,PL_051_SCENE08_var_1,a37M_FO_var_1,a10F_FO_var_1,BF002_HO_var_1,PL_053_SCENE15_var_1,a18F_HO_var_1,a7F_NC_var_1,AF219_NC_var_1,attentionCheck1,a26M_NC_var_1,PL_007_92026_var_1,HM01_HO_var_1,attentionCheck1,BM08_HO_var_1,WF015_FO_var_1];
var MF_block2 = [AM05_FO_var_2,BF05_FO_var_2,AM04_NC_var_2,PL_094_O6_1_var_2,PL_046_SCENE03_var_2,BF03_NC_var_2,a32M_HO_var_2,attentionCheck1,attentionCheck1,BM01_HO_var_2,BM06_HO_var_2,AM204_NC_var_2,AF01_FO_var_2,PL_091_O5_1_var_2,a43M_FO_var_2,BM04_NC_var_2,PL_045_SCENE02_var_2,attentionCheck1,a2F_HO_var_2,attentionCheck1,a31M_HO_var_2,LM242_NC_var_2,PL_044_SCENE01_var_2,HF02_HO_var_2,a38M_FO_var_2,LF209_NC_var_2,PL_093_O57_1_var_2,AF216_NC_var_2,a30M_NC_var_2,WM03_FO_var_2,PL_100_O82_1_var_2,BF009_HO_var_2,WF034_FO_var_2,PL_041_LEXINGTON17_var_2,BF10_FO_var_2,a19F_HO_var_2,WF02_NC_var_2,PL_043_LEXINGTON19_var_2,PL_047_SCENE04_var_2,AF201_NC_var_2,LF207_NC_var_2,PL_096_O69_1_var_2,a3F_FO_var_2,AM02_HO_var_2,BM028_FO_var_2,a29M_HO_var_2,a13F_HO_var_2,a15F_FO_var_2,attentionCheck1,BF018_HO_var_2,PL_090_O47_1_var_2,attentionCheck1,BM023_FO_var_2,AM210_NC_var_2];
var MF_block3 = [PL_051_SCENE08_var_3,LM207_NC_var_3,PL_003_92016_var_3,a45M_HO_var_3,LM213_NC_var_3,BF023_FO_var_3,HM05_FO_var_3,PL_053_SCENE15_var_3,a7F_NC_var_3,AF225_NC_var_3,BF06_FO_var_3,PL_004_92023_var_3,HM01_HO_var_3,a22M_HO_var_3,AM03_FO_var_3,AF02_HO_var_3,PL_057_TUFTS06BW_var_3,BM07_NC_var_3,attentionCheck1,PL_012_92047_var_3,WF015_FO_var_3,a28M_FO_var_3,a18F_HO_var_3,BM03_NC_var_3,PL_001_92012_var_3,PL_061_TUFTS11BW_var_3,attentionCheck1,AM01_HO_var_3,AF219_NC_var_3,a37M_FO_var_3,a10F_FO_var_3,attentionCheck1,attentionCheck1,a42M_NC_var_3,HF04_HO_var_3,BM08_HO_var_3,PL_011_92044_var_3,attentionCheck1,PL_060_TUFTS10BW_var_3,WM011_HO_var_3,a17F_FO_var_3,WM033_FO_var_3,HF03_HO_var_3,LF227_NC_var_3,a8F_NC_var_3,PL_056_TUFTS02BW_var_3,PL_009_92037_var_3,attentionCheck1,HM03_FO_var_3,AM228_NC_var_3,a41M_NC_var_3,BF07_HO_var_3,a12F_HO_var_3,a6F_FO_var_3];
var MF_block4 = [AM02_HO_var_4,a13F_HO_var_4,PL_043_LEXINGTON19_var_4,AM210_NC_var_4,attentionCheck1,BF02_NC_var_4,attentionCheck1,PL_095_O65_1_var_4,a16F_FO_var_4,a15F_FO_var_4,PL_046_SCENE03_var_4,o89_1_var_4,PL_099_O81_1_var_4,BF009_HO_var_4,BF201_NC_var_4,WF02_NC_var_4,WF223_NC_var_4,WM006_FO_var_4,WM01_HO_var_4,WM003_FO_var_4,PL_091_O5_1_var_4,WF04_FO_var_4,BM009_HO_var_4,BF10_FO_var_4,a27M_NC_var_4,PL_048_SCENE05_var_4,PL_094_O6_1_var_4,BF016_HO_var_4,BM06_HO_var_4,a36M_HO_var_4,AM204_NC_var_4,BF03_NC_var_4,attentionCheck1,attentionCheck1,BM04_NC_var_4,AM05_FO_var_4,attentionCheck1,a5F_FO_var_4,PL_045_SCENE02_var_4,a38M_FO_var_4,AF235_NC_var_4,HF05_HO_var_4,attentionCheck1,a20M_HO_var_4,AF01_FO_var_4,PL_092_O50_1_var_4,PL_040_LEXINGTON16_var_4,WF05_HO_var_4,LM242_NC_var_4,HF02_HO_var_4,a40M_FO_var_4,PL_073_P53_1_var_4,LM211_NC_var_4,a43M_FO_var_4];
var MF_block5 = [AM210_NC_var_5,PL_041_LEXINGTON17_var_5,PL_043_LEXINGTON19_var_5,BM023_FO_var_5,a45M_HO_var_5,PL_003_92016_var_5,attentionCheck1,HM05_FO_var_5,LM207_NC_var_5,a29M_HO_var_5,a7F_NC_var_5,PL_004_92023_var_5,BF06_FO_var_5,PL_047_SCENE04_var_5,AF02_HO_var_5,LF209_NC_var_5,WF02_NC_var_5,a3F_FO_var_5,PL_012_92047_var_5,a13F_HO_var_5,HF04_HO_var_5,PL_044_SCENE01_var_5,BF10_FO_var_5,a28M_FO_var_5,BM03_NC_var_5,AF216_NC_var_5,a19F_HO_var_5,attentionCheck1,WF034_FO_var_5,PL_001_92012_var_5,a42M_NC_var_5,a10F_FO_var_5,BM08_HO_var_5,HF02_HO_var_5,attentionCheck1,PL_045_SCENE02_var_5,PL_046_SCENE03_var_5,attentionCheck1,a17F_FO_var_5,attentionCheck1,a43M_FO_var_5,BM04_NC_var_5,WM011_HO_var_5,PL_011_92044_var_5,LF227_NC_var_5,attentionCheck1,AM228_NC_var_5,a12F_HO_var_5,PL_009_92037_var_5,BM06_HO_var_5,a32M_HO_var_5,AM04_NC_var_5,AM05_FO_var_5,HM03_FO_var_5];
var MF_block6 = [HM01_HO_var_6,PL_053_SCENE15_var_6,attentionCheck1,WF223_NC_var_6,BF02_NC_var_6,PL_095_O65_1_var_6,WF015_FO_var_6,attentionCheck1,attentionCheck1,AM02_HO_var_6,AF219_NC_var_6,a15F_FO_var_6,PL_099_O81_1_var_6,PL_051_SCENE08_var_6,a18F_HO_var_6,WM006_FO_var_6,a37M_FO_var_6,attentionCheck1,BF009_HO_var_6,a21M_NC_var_6,PL_061_TUFTS11BW_var_6,PL_091_O5_1_var_6,AF03_FO_var_6,WF04_FO_var_6,AM245_NC_var_6,HF03_HO_var_6,BM009_HO_var_6,a27M_NC_var_6,WF01_NC_var_6,PL_094_O6_1_var_6,BM002_HO_var_6,a36M_HO_var_6,BF03_NC_var_6,OM01_FO_var_6,PL_060_TUFTS10BW_var_6,attentionCheck1,a38M_FO_var_6,BF005_HO_var_6,BF04_FO_var_6,AM204_NC_var_6,AF219_NC_var_6,PL_092_O50_1_var_6,HF05_HO_var_6,PL_058_TUFTS07BW_var_6,a40M_FO_var_6,AF01_FO_var_6,AM01_HO_var_6,PL_073_P53_1_var_6,WF05_HO_var_6,PL_056_TUFTS02BW_var_6,WM033_FO_var_6,attentionCheck1,LM242_NC_var_6,LM216_NC_var_6];
var MF_block7 = [HM03_FO_var_7,HF02_HO_var_7,a43M_FO_var_7,PL_001_92012_var_7,PL_009_92037_var_7,LM211_NC_var_7,a20M_HO_var_7,attentionCheck1,AM228_NC_var_7,LF227_NC_var_7,a12F_HO_var_7,AM05_FO_var_7,PL_040_LEXINGTON16_var_7,AF235_NC_var_7,PL_045_SCENE02_var_7,a9F_FO_var_7,attentionCheck1,a34M_HO_var_7,PL_010_92038_var_7,PL_048_SCENE05_var_7,BF016_HO_var_7,a5F_FO_var_7,BF037_HO_var_7,a39M_FO_var_7,AF218_NC_var_7,attentionCheck1,BM04_NC_var_7,BF201_NC_var_7,BF10_FO_var_7,PL_046_SCENE03_var_7,a42M_NC_var_7,BM06_HO_var_7,WM011_HO_var_7,WM004_FO_var_7,PL_003_92016_var_7,attentionCheck1,a7F_NC_var_7,WF02_NC_var_7,WM01_HO_var_7,BF003_FO_var_7,attentionCheck1,PL_042_LEXINGTON18_var_7,PL_006_92025_var_7,PL_007_92026_var_7,WM003_FO_var_7,BM03_NC_var_7,HF04_HO_var_7,BM08_HO_var_7,AM210_NC_var_7,a16F_FO_var_7,a10F_FO_var_7,attentionCheck1,PL_043_LEXINGTON19_var_7,a13F_HO_var_7];
var MF_block8 = [PL_060_TUFTS10BW_var_8,PL_056_TUFTS02BW_var_8,BF03_NC_var_8,a6F_FO_var_8,BF05_FO_var_8,BM01_HO_var_8,a41M_NC_var_8,PL_094_O6_1_var_8,BF07_HO_var_8,a8F_NC_var_8,a31M_HO_var_8,a38M_FO_var_8,AF01_FO_var_8,PL_061_TUFTS11BW_var_8,attentionCheck1,PL_091_O5_1_var_8,WM033_FO_var_8,AF219_NC_var_8,AM204_NC_var_8,HF03_HO_var_8,a2F_HO_var_8,PL_093_O57_1_var_8,AM01_HO_var_8,attentionCheck1,a37M_FO_var_8,LM242_NC_var_8,PL_057_TUFTS06BW_var_8,BF009_HO_var_8,a18F_HO_var_8,WM03_FO_var_8,attentionCheck1,WF015_FO_var_8,a30M_NC_var_8,BM07_NC_var_8,PL_100_O82_1_var_8,AF225_NC_var_8,PL_053_SCENE15_var_8,a22M_HO_var_8,attentionCheck1,PL_096_O69_1_var_8,attentionCheck1,AM02_HO_var_8,AF201_NC_var_8,LF207_NC_var_8,AM03_FO_var_8,PL_051_SCENE08_var_8,BM028_FO_var_8,attentionCheck1,HM01_HO_var_8,a15F_FO_var_8,BF023_FO_var_8,PL_090_O47_1_var_8,LM213_NC_var_8,BF018_HO_var_8];
var practice = [initialize, PracticeRec4, PracticeHO2, attentionCheck1];

/*
//PracticeStuff
var condition1 = false;
var condition2 = false;
var condition3 = false;
var condition4 = true;
*/

var p_conditional0_1 = {
  timeline: [fixation_block],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  choices: 'none',
  conditional_function: function(data){
    if(condition0 === false){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional0_2 = {
  timeline: [fixation_block],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  choices: 'none',
  conditional_function: function(data){
    if(condition0 === true){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional1_1 = {
  timeline: [wIsNewPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(correct === false){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional1_2 = {
  timeline: [cIsNewPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(correct === true){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional2_1 = {
  timeline: [wIsOldPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(correct === false){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional2_2 = {
  timeline: [cIsOldPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(correct === true){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional3_1 = {
  timeline: [wAttentionPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(correct === false){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditional3_2 = {
  timeline: [cAttentionPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(correct === true){
      return true;
    } else {
      return false;
    }
  }
};

var p_conditionalSlow = {
  timeline: [tooSlowPractice],
  timing_stim: 2000,
  timing_response: 1000, // how long to show the fixation for
  response_ends_trial: false,
  conditional_function: function(data){
    if(condition4 === false){
      return true;
    } else {
      return false;
    }
  }
}

var p_conditional0 = [p_conditional0_1, p_conditional0_2, p_conditionalSlow];
var p_conditional1 = [p_conditional1_1, p_conditional1_2, p_conditionalSlow];
var p_conditional2 = [p_conditional2_1, p_conditional2_2, p_conditionalSlow];
var p_conditional3 = [p_conditional3_1, p_conditional3_2, p_conditionalSlow];
var conditional = [p_conditional0, p_conditional1, p_conditional2, p_conditional3];
