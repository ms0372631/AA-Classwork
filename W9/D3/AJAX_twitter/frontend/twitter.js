const FollowToggle = require("./follow_toggle.js");

$(document).ready(function() {
    let $buttons = $("button.follow-toggle");
    $buttons.each(function(idx, button) {
        new FollowToggle(button);
    });

});