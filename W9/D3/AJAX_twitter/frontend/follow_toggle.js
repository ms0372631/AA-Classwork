

class FollowToggle {
    constructor($el) {   //$el 
        // let status = document.querySelector(".follow-toggle");
        this.userId = $el.user-id;
        this.followState = $el.initial-follow-state;
        this.render($el)
    }

    const render = ($button) => {
        const followState = $button.data-initial-follow-state;
        if (followState === "unfollowed") {
            $button.data("value", "Follow"); //$button.innerHTML("follow")
        } else {
            $button.data("value", "UnFollow");
        }

    }
}

const setEvenListeners = () => {
    $('.follow-toggle').on("click", e => {
        e.preventDefault();
    }) 
}




module.exports = FollowToggle;