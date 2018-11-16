
$.ajax("https://docs.google.com/spreadsheets/d/e/2PACX-1vT3vX97bL045hfoU_4OO6JoiJ6Qh0VB3Lr0OzxOCFD27tKrmC7ZPSC1LyFkPsu38B7FLSzn17TH2usZ/pub?gid=0&single=true&output=csv").done(function(result){
    console.log(result);
});

// $.ajax("https://docs.google.com/spreadsheets/d/e/2PACX-1vT3vX97bL045hfoU_4OO6JoiJ6Qh0VB3Lr0OzxOCFD27tKrmC7ZPSC1LyFkPsu38B7FLSzn17TH2usZ/pub?output=xlsx").done(function(result){
//     console.log(result);
// });

// $(document).ready(function () {
//   var mySpreadsheet = 'https://docs.google.com/spreadsheets/d/1d8Zu5LqC0PQC0PFOOaOqI15-F0P6aa1KClTYX4lTbso/edit?usp=sharing'; 
//   $('#tab').sheetrock({
//     url: mySpreadsheet
//   });
//   console.log(mySpreadsheet);
//   // $('tab tr td').each(function () {
//   // 
//   // });
// });
