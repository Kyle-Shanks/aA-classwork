const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = (this.$el.data('user-id') || options.userId);
    this.followState = (this.$el.data('initial-follow-state') || options.followState);
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    let buttonText;
    if (this.followState === 'followed') {
      buttonText = 'Unfollow!';
    } else if (this.followState === 'unfollowed') {
      buttonText = 'Follow!';
    }
    this.$el.text( buttonText );
  }

  handleClick(event) {
    event.preventDefault();
    this.$el.prop('disabled', true);

    const onSuccessFunc = (newStatus) => {
      this.followState = newStatus;
      this.render();

    };

    if (this.followState === 'followed') {
      this.$el.text('Unfollowing...');
      APIUtil.unfollowUser(this.userId).then((response) => {
        onSuccessFunc('unfollowed');
        console.log(response);
        this.$el.prop('disabled', false);
      });
    } else if (this.followState === 'unfollowed') {
      this.$el.text('Following...');
      APIUtil.followUser(this.userId).then((response) => {
        onSuccessFunc('followed');
        console.log(response);
        this.$el.prop('disabled', false);
      });
    }
  }
}

module.exports = FollowToggle;
