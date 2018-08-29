const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el, input, ul) {
    this.$el = $(el);
    this.$input = $(input);
    this.$ul = $(ul);

    this.$input.on('keydown', this.handleInput.bind(this));
  }

  handleInput(event) {

    const successCB = (response) => {
      this.renderResults(response);
    };

    APIUtil.searchUsers(this.$input.val(), successCB);
  }

  renderResults(users) {
    this.$ul.empty();

    for (const idx in users) {
      const options = {
        userId: users[idx].id,
        followState: users[idx].followed ? 'followed' : 'unfollowed'
      };
      const $button = $('<button class="follow-toggle">');

      const $li = $(`<li><a href="/users/${users[idx].id}">
                      ${users[idx].username}
                    </a></li>`);
      $li.append($button);
      this.$ul.append($li);

      new FollowToggle($button[0], options);
    }
  }
}

module.exports = UsersSearch;
