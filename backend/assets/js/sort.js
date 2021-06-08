$(document).ready(function () {
    let table = $('#myTable');
    let tbody = $('#content');

    $('#sort-by-ID').click(function (event) {
        tbody.find("tr").sort(function(a, b)
        {
            let number_one = parseInt($("td:first-child", a).text());
            let number_two = parseInt($("td:first-child", b).text());
            if($('#id_order').val()=='asc')
            {
                if (number_one > number_two) {
                    return -1;
                } else if (number_one < number_two) {
                    return 1;
                } else {
                    return 0;
                }
            }
            else
            {
                if (number_one < number_two) {
                    return -1;
                } else if (number_one > number_two) {
                    return 1;
                } else {
                    return 0;
                }
            }

        }).appendTo(tbody);

        var sort_order = $('#id_order').val();
        if(sort_order=="asc")
        {
            $('th#sort-by-ID i').removeClass("fa-caret-up").addClass("fa-caret-down");
            document.getElementById("id_order").value="desc";
        }
        if(sort_order=="desc")
        {
            $('th#sort-by-ID i').removeClass("fa-caret-down").addClass("fa-caret-up");
            document.getElementById("id_order").value="asc";
        }
    });
})