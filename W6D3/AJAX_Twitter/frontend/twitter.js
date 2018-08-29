const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet_compose.js');

$(() => {
  $('button.follow-toggle').each(function(idx, el) {
    new FollowToggle(el);
  });

  $('.users-search').each(function(idx, el) {
    new UsersSearch(el,
                    document.getElementById('user-name'),
                    document.getElementsByClassName('users')[0]
                   );
  });

  $('.tweet-compose').each(function(idx,el) {
    new TweetCompose(el);
  });
});
