// This contains the variables for the instruction screens
  var welcome_block = {
    type: "text",
    //text: "<p style=color:black><b><center>Welcome to the experiment! Press ANY KEY to begin.</center></b></p>",
    text: "<p class='instructions'>Welcome to the experiment! Press ANY KEY to begin.</p>",
  };

  var instructions_block_1 = {
    type: "text",
    text: "<p class='instructions'>We will test your memory for some of the <br>faces and places you saw during the 0-back and 2-back games.<br><br>Press ANY KEY to continue.</br></p>",//"</br></br></br></b></p>",
    timing_post_trial: 2000
  };

  var instructions_block_2 = {
    type: "text",
    text: "<p class='instructions'>Pictures will appear one at a time on the screen. <br>For each picture, decide whether you saw it before or if it is new.<br><br>Press ANY KEY to continue.</br></p>",//"</br></br></b></p>",
    timing_post_trial: 2000
  }

  var instructions_block_3 = {
    type: "text",
    text: "<p class='instructions'>Press the 'E' KEY with your LEFT POINTER finger if you think you have seen the picture before.<br>Press the 'I' KEY under your RIGHT POINTER finger if you think this is the first time you have seen the picture.<br>Press the SPACEBAR whenever you see an orange circle.<br><br>Pres ANY KEY to continue.</br></p>",
  }

  var instructions_block_4 = {
    type: "text",
    text: "<p class='instructions'>Let's do some practice!<br></br>PLEASE RESPOND WHILE THE PICTURE IS ON THE SCREEN<br></br>Press ANY KEY to continue.</b>",
  }

  var instructions_block_5 = {
    type: "single-stim",
    text: "<p class='instructions'>Great!  We will continue.  You will not get feedback from your responses for the rest of the game.<br>Remember: Press the LEFT ARROW KEY under your pointer finger if you have seen the picture before.<br>Press the RIGHT ARROW KEY under your middle finger if this is the first time that you have seen the picture.<br>Press the SPACEBAR whenever you see an orange circle.<br>PLEASE RESPOND WHILE THE PICTURE IS ON THE SCREEN.<br><br>Press ANY KEY to play the game.</br></p>",
  }

  //This block of instructions comes after the practice blocks.
  var instructions_block_5 = {
    type: "text",
    text: "<p class='instructions'>The feedback you were just given<br>(Correct, Incorrect, Too Slow),<br>was meant to help you understand the game.<br><br>You WILL NOT get feedback in the real game.<br><br></br></br>Press SPACE to continue</p>",
  }

  var instructions_block_6 = {
    type: "text",
    text: "<p class='instructions'>Press ANY KEY to begin the task!</p>",
  }

  var fixation_trial = {
    type: 'single-stim',
    stimulus: "",
    stimulus: ['<p style="font-size:80px; color:white; text-align:center"><br><br><br><br>+</br></p>'],
    //stimulus: "<p class='fixation'><br><br><br><br>+</br></p>",
    //prompt: "<p class='fixation'><br><br><br><br>is this working?</br></p>",
    is_html: true,
    timing_response: 1000, // how long to show the fixation for
    choices: 'none', // don't allow any responses from the subject
    timing_post_trial: 0,
    timing_stim: 1000
  };

  var debrief = {
    type: "text",
    text: "<p class='instructions'>Thank you for completing our experiment!  Please press the spacebar to finish.",
    on_finish: function(data){
      jsPsych.data.localSave(subject.toUpperCase()+"_RECWEB.csv",'csv')
    }
  }

/*
  var fixation_block = {
    type: 'single-stim',
    //stimulus: ['<p style="font-size:80px; color:green; text-align:center"><br><br><br><br>+</br></p>'],
    stimulus: ["<p class='fixation'><br><br><br><br>+</br></p>"],
    is_html: true,
    timing_response: 2000, // how long to show the fixation for
    choices: 'none', // don't allow any responses from the subject
    timing_post_trial: 0,
    timing_stim: 2000
  };
*/
