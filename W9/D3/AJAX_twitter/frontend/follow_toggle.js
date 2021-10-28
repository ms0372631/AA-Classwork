// const webpack = require("webpack");


class FollowToggle {
    constructor(el) {
        // when using .dataset: use on a regular HTML element (NOT A jQuery obj), and switch attribute name
        // to camelcase
        // Also add "data-" in front on HTML attributes on the element
        // this.userId = el.dataset.userId;
        // this.followState = el.dataset.initialFollowState;

        // when using .data: MUST use it on a jQuery obj.
        // to make a jQuery obj: grab HTML ele, wrap HTML ele in $(ele)
        // Then call ".data("html-attribute-name")"
        this.userId = $(el).data("user-id");
        this.followState = $(el).data("initial-follow-state");
        
        this.el = el;
        this.render();
    }

    render() {
        const followState = $(this.el).data("initial-follow-state");
        if (followState === "Unfollowed") {
            $(this.el).text("Follow");
        } else {
            $(this.el).text("Unfollow");
        } //this.$el.innerHTML("follow"), why does this not work?
    }

    handleClick() {
        let button = this.el;

        $(button).on("click", e => { 
            e.preventDefault();
            debugger
            if (button.followState !== "Unfollowed") {
                return $.ajax ({ // return a promise object
                    method: 'POST',
                    url: `/users/${button.userId}/follow`,
                    data: {
                        button: button
                    },
                    dataType: "json"
                }).then(response => {
                    debugger
                    button.data("initial-follow-state", button.followState);
                });

            } else {
                return $.ajax ({ // returns a promise object
                    method: "DELETE",
                    url: `/users/${button.userId}/follow`,
                    data: {
                        button: button
                    },
                    dataType: "json"
                }).then(response => {
                    debugger
                    button.data("initial-follow-state", button.followState);
                });
            }
        });
    }
}

module.exports = FollowToggle;

// const $newImage = $(`<img user-id="${button.user-id}" initial-follow-state="${button.followState}">`);
// $gifDisplay.data("initial-follow-state", button.followState);