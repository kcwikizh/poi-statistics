var rareShips = ["長門", "陸奥", "雪風", "飛龍", "島風", "大井", "翔鶴", "瑞鶴",
                 "鬼怒", "阿武隈", "夕張", "瑞鳳", "三隈", "初風", "舞風", "衣笠",
                 "伊19", "鈴谷", "熊野", "伊168", "伊58", "伊8", "秋雲", "夕雲",
                 "巻雲", "長波", "阿賀野", "能代", "矢矧", "酒匂", "香取", "伊401",
                 "あきつ丸", "まるゆ", "弥生", "卯月", "磯風", "浦風", "谷風", "浜風",
                 "Z1", "Prinz Eugen", "天津風", "明石", "大淀", "大鯨", "時津風",
                 "雲龍", "天城", "葛城", "春雨", "早霜", "清霜", "朝雲", "山雲",
                 "野分", "秋月", "高波", "朝霜", "U-511", "Littorio", "Roma",
                 "秋津洲"];

$(document).ready(function() {
    $('#main-tab').hover(function() {
        $('.drop-map').fadeIn('fast');
    }, function() {
        $('.drop-map').fadeOut('fast');
    });
});

function requestData(map_name, map_image) {
    $.getJSON('/drop/map/' + map_name + ".json", function(data) {
        $('.busy-indicator').hide();

        var tabs = [], contents = [];

        contents.push("<image class='drop-map' src='" + map_image + "' />")

        $.each(data.result, function(key, val) {
            var show = val.name.indexOf('(Boss)') >= 0;
            tabs.push(getTabFormatText(key, val.name, show));
            contents.push(getContentFormatText(key, val, show));
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

function getContentFormatText(key, map, show) {
    var str = "<div class='tab-pane" + (show ? " active" : "") +
        "' id='point" + key + "' role='tabpanel'>\
        <table class='table table-striped table-hover'><thead><tr><th>舰娘</th>\
        <th>S胜</th><th>A胜</th><th>B胜</th><th>C败</th><th>D败</th><th>E败</th>\
        <th>掉落率</th></tr></thead><tbody>";
    map.ships.sort(function(a,b) {
        if (a.count == b.count) {
            if (a.b == b.b) {
                if (a.a == b.a) {
                    return a.s - b.s;
                }
                return a.a - b.a;
            }
            return a.b - b.b;
        }
        return a.count - b.count;
    });
    $.each(map.ships, function(key, val) {
        if (val.name == "(无)") return;
        str += "<tr" + ($.inArray(val.name, rareShips) < 0 ? "" : " style='color:red'") + ">";
        str += "<td>" + val.name + "</td>";
        str += "<td>" + val.s + "</td>";
        str += "<td>" + val.a + "</td>";
        str += "<td>" + val.b + "</td>";
        str += "<td>" + val.c + "</td>";
        str += "<td>" + val.d + "</td>";
        str += "<td>" + val.e + "</td>";
        str += "<td>" + (val.count * 100 / map.count).toFixed(2) + "%</td>";
        str += "</tr>"
    });
    str += "</tbody></table></div>"
    return str;
}
