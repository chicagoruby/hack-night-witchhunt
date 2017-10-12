var startGame;
var assignRoles;

$(document).ready(function(){
  startGame();
  assignRoles();
})

assignRoles = function(){
  $('#game').on("submit", '#starting-form', function(event){
    event.preventDefault();
    var $form = $(this);
    var formUrl = $form.attr('url');
    var formMethod = $form.attr('method');
    var formData = $form.serialize();
    $.ajax({
      url: formUrl,
      method: formMethod,
      data: formData
    }).done(function(response){
      console.log(response);
      console.log("You started a game!")
      $('#game').html(response);
      $('#game').prepend("<h2>Please Assign Roles As Shown</h2>")
    })
  })
}

startGame = function(){
  console.log("Load game script");
  $('#game').on("click", '#start', function(event){
    console.log("Game Started");
    $.ajax({
      method: 'GET',
      url: '/games/new'
    }).done(function(response){
      console.log("you have the returning thing");
      $('#game').html(response);
    })
  })
}