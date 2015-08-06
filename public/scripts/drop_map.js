function requestData(map_name) {
    $.getJSON('/drop/map/' + map_name + ".json", function(data) {
        $('.busy-indicator').hide();

        var tabs = [], contents = [];
        $.each(data.result, function(key, val) {
            var show = val.name.indexOf('(Boss)') >= 0;
            tabs.push(getTabFormatText(key, val.name, show));
            contents.push(getContentFormatText(key, val.ships, show));
        });

        $('#main-tab').html(tabs.join(''));
        $('#main-content').html(contents.join(''));
    });
}

function getTabFormatText(key, name, show) {
    return "<li role='presentation'" + (show ? " class='active'" : "") +
        "><a aria-controls='point" + key + "' data-toggle='pill' href='#point" +
        key + "' role='tab'>" + name + "</a></li>";
}

function getContentFormatText(key, ships, show) {
    var str = "<div class='tab-pane" + (show ? " active" : "") +
        "' id='point" + key + "' role='tabpanel'>\
        <table class='table table-striped table-hover'><thead><tr><th>舰娘</th>\
        <th>S胜</th><th>A胜</th><th>B胜</th><th>C败</th><th>D败</th><th>E败</th>\
        </tr></thead><tbody>";
    $.each(ships, function(key, val) {
        str += "<tr><td>" + val.name + "</td>";
        str += "<td>" + val.s + "</td>";
        str += "<td>" + val.a + "</td>";
        str += "<td>" + val.b + "</td>";
        str += "<td>" + val.c + "</td>";
        str += "<td>" + val.d + "</td>";
        str += "<td>" + val.e + "</td>";
    });
    str += "</tbody></table></div>"
    return str;
}
