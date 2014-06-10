(function(){
  $('#new_tweet').on('submit', tweetHandler);

  function tweetHandler(event){
    event.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    
    $.post(url, data, function(data){
      $('#tweet_list').replaceWith(data);
    });
  }
})()