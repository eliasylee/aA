const FollowToggle = require('./follow_toggle');

class UsersSearch {

  constructor(el) {
    this.$navEl = $(el);
    this.$inputEl= this.$navEl.find("input");
    this.$users = this.$navEl.find(".users");
    this.handleInput();
  }

  renderResults(result) {
    this.$users.empty();
    result.forEach( user => {
      let $li = $('<li></li>');

      let $link = $(`<a href="/users/${user.id}">${user.username}</a>`);
      let $button = $(`<button type="button class="follow-toggle"></button>`);

      let options = {
        userId: user.id,
        followState: user.followed ? "followed" : "unfollowed"
      };

      let buttonText = user.followed ? "Unfollow!" : "Follow!";
      $button.text(buttonText);

      let followToggle = new FollowToggle($button, options);

      $li.append($link);
      $li.append($button);
      this.$users.append($li);
    });
  }

  handleInput() {
    this.$navEl.on("input", event => {
      let inputData = this.$inputEl.serialize();

      $.ajax({
        url: "/users/search",
        type: "GET",
        data: inputData,
        dataType: "json",
        success: (result) => {
          this.renderResults(result);
        }
      });
    });
  }
}

module.exports = UsersSearch;
