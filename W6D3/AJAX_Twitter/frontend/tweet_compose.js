const APIUtil = require('./api_util.js');

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$el.on('submit', this.submit.bind(this));
  }

  submit(event) {
    event.preventDefault();
    this.$el.children('input').prop('disabled', true);
    APIUtil.createTweet(this.$el.serializeJSON()).then(this.handleSuccess.bind(this));
  }

  clearInput() {
    this.$el.find('textarea, select').val("");
  }

  handleSuccess(response) {
    this.clearInput();
    this.$el.children('input').prop('disabled', false);
    const $li = $('<li>');
    $li.html(`${response.content} -- <a href="/users/${response.user.id}">
              ${response.user.username}</a> -- ${response.created_at}`);

    // Also do mentions ul

    $(this.$el.data('tweets-ul')).prepend($li);
  }
}

module.exports = TweetCompose;
