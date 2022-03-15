$(document).on("turbolinks:load", function() {
    $("#player").DataTable({
        lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
            url: "/fetch_businesses",
            dataSrc: "businesses",
        },
        serverSide: true,
        pagination: true,
        info: false,
        columns: [
            { title: "Business Name", data: "name" },
            { title: "Business Address", data: "address" },
            { title: "Start Time", data: "start" },
            { title: "End Time", data: "end" },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/businesses/' +
                        data.id +
                        "/edit" +
                        '">' +
                        "Edit" +
                        "</a>"
                    );
                },
            },
            {
                "data": null,
                "bSortable": false,
                "mRender": function(data, type, full) {
                    return "<a class='btn btn-info btn-sm' href = '/businesses/" + data.id +
                        "data-confirm='Are you sure?' data-method='delete' >" +
                        'Delete' + '</a>';
                }
            },

        ],
        order: [
            ["1", "desc"]
        ],
    });
});