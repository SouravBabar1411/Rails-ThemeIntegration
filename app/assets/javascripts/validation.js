//select 2 validation
$(document).ready(function() {
    $('.js-example-basic-single').select2();
});
//datatable validation
$(document).ready(function() {
    $("#player").DataTable({
        "info": false,
    })
});
$(document).ready(function() {
    $('#server-side-sport').DataTable({
        lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
            url: '/get_dataset',
            dataSrc: 'sports',
            serverSide: true,
        },

        pagination: true,
        columns: [
            { title: 'Sport Name', data: 'sport_name' },
            { title: 'Total player', data: 'total_player' }
        ],
        order: [
            ['1', 'desc']
        ]
    });
});
$(document).ready(function() {
    $("#achievement").DataTable({ "info": false })
});
$(document).ready(function() {
    $("#comment").DataTable({ "info": false })
});