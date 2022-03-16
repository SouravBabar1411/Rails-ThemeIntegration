$(document).on("turbolinks:load", function() {
    $("#offer").DataTable({
        lengthMenu: [5, 10, 15, 25, 50],
        ajax: {
            url: "/fetch_offers",
            dataSrc: "offers",
        },
        serverSide: true,
        pagination: true,
        info: false,
        columns: [
            { title: "Business", data: "business_name" },
            { title: "Title", data: "title" },
            { title: "Description", data: "description" },
            { title: "Start Time", data: "start" },
            { title: "End Time", data: "end" },
            {
                data: null,
                bSortable: false,
                mRender: function(data, type, full) {
                    return (
                        '<a class="btn btn-info btn-sm" href="/offers/' +
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
                    return (
                        "<a class='btn btn-info btn-sm' href = '/offers/" + data.id +
                        "data-confirm='Are you sure?' data-method='delete' >" +
                        'Delete' + '</a>'
                    );
                }
            },

        ],
        order: [
            ["1", "desc"]
        ],
    });

    function generateFilterParams() {
        var filters = {
            business_id: [$("#businesses :selected").val()],
        }
        $("select[name='businesses']:selected").each(function() {
            filters['business_id'].push($(this).data('val'));
        });

        return filters;
    }

    function applyFilters(filters) {
        console.log("hello", filters);
        if (filters != '') {
            // var id = $(this).attr("business_id");
            $('#offer').DataTable().ajax.url(
                    "/fetch_offers" + "?filters=" + JSON.stringify(filters)
                )
                .load() //checked
        } else {
            $('#offer').DataTable().ajax.reload();
        }
    }
    $('.business-sidebar').change(function() {
        console.log("hiii");
        applyFilters(generateFilterParams());
    });
});