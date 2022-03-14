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
            { title: "Start Time", data: "start_date" },
            { title: "End Time", data: "end_date" },
            {
                title: "Action",
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        "<a class='dropdown-item' href = '/businesses/" + data.id + "/edit'" +
                        "data-toggle='tooltip' data-placement='top' data-original-title='Edit Business'>" +
                        "<i class='feather icon-edit-2'></i> Edit</a>"
                    );
                },
            },
        ],
        order: [
            ["1", "desc"]
        ],
    });
});