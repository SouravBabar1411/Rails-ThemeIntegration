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
            { title: 'Total player', data: 'total_player' },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/sports/' +
                        data.id +
                        '">' +
                        "Show" +
                        "</a>"
                    );
                },
            },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/sports/' +
                        data.id +
                        "/edit" +
                        '">' +
                        "Edit" +
                        "</a>"
                    );
                },
            },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        "<a class='btn btn-info btn-sm' href = '/sports/" +
                        data.id +
                        "data-confirm='Are you sure?' data-method='delete' data-toggle='tooltip' data-placement='top' data-original-title='Destroy Sports'>" +
                        "Delete" +
                        "</a>"
                    );
                },
            },
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