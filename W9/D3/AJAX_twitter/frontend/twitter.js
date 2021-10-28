const FollowToggle = require("./follow_toggle");

$(document).ready(function() {
    let $buttons = $(".follow-toggle");
    $buttons.each(function(idx, button) {
        new FollowToggle(button);
    });
});