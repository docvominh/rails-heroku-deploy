$(document).ready(function () {
    $('.my-logo h1').addClass('animated fadeInLeft');
    $('.my-logo-2 h1').addClass('animated fadeInRight');

    // var waypoint = new Waypoint({
    //     element: document.getElementById('managerRow'),
    //     handler: function () {
    //         $('.member-title').addClass('animated fadeInDown');
    //         $('.member-role-manager').addClass('animated fadeInDown');
    //     }
    // })

    var waypoints = $('#managerRow').waypoint({
        handler: function (direction) {
            $('.member-title').addClass('animated fadeInUp');
            $('.member-role-manager').addClass('animated fadeInUp');

            $('#managerRow').addClass('animated fadeInUp');
        },
        offset: '60%'
    })

});

