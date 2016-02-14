// app/assets/javascripts/highscores.js
function getHighscores(){
  var $self = $('.highscores-list');
  return $.getJSON('/highscores').done(function(highscores){
    var elements = $.map(highscores, function(h){
      return $('<li>').text([h.username, h.score].join(', '));
    });
    $self.empty().append(elements);
  });
};

$(document).on('games:loaded highscores:loaded', function(){
  // refresh highscores every 5 seconds
  (function refresh(){
    getHighscores().done(function(){
      window.setTimeout(refresh, 5000);
    });
  }());
  $('#new_highscore').submit(function(e){
    var promise = $.ajax('/highscores', {
      data: {
        highscore: {
          username: this.elements["highscore[username]"].value,
          time: this.elements["highscore[time]"].value,
          score: this.elements["highscore[score]"].value,
        }
      },
      method: 'POST',
      dataType: 'JSON'
    });
    promise.done(function(data, status, jqXHR){
      getHighscores();
    });
    return false; // prevent form from being submitted normally
  });
});
