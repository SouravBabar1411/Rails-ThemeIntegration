// front end validation for player table
$(function() {
        var $registrationform = $("#playerValidate");
        if ($registrationform.length) {
            $registrationform.validate({
                rules: {
                    "player[player_name]": {
                        required: true,
                    },
                    "player[email]": {
                        required: true,
                        email: true,
                    },
                    "player[player_city]": {
                        required: true,
                        minlength: 4,
                    },
                    "player[player_state]": {
                        required: true,
                        minlength: 4,
                    },
                    "player[player_country]": {
                        required: true,
                    },
                    "player[phone]": {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 10,
                    },
                }
            })
        }
    })
    //front end validation for achievement table
$(function() {
    var $sportform = $("#achievemetValidate");
    if ($sportform.length) {
        $sportform.validate({
            rules: {
                "achievement[player]": {
                    required: true,
                    minlength: 3,
                },
                "achievement[award]": {
                    required: true,
                    minlength: 3,
                },
                "achievement[medal]": {
                    required: true,
                    minlength: 3,
                },
            },
        });
    }
});