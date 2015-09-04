function requestData(recipe_name) {
    $.getJSON('/construction/recipe/' + recipe_name + ".json", function(data) {
        $('.busy-indicator').hide();

        var table = $('table');
        table.bootstrapTable();
        items = [];
        $.each(data.result.ships, function(key, ship) {
          ship.secretaryCount.sort(function(a, b) {
              return b.count - a.count;
          });

          items.push({
              name: ship.name,
              type: Poir.constants.shipInfo[ship.name].shipType,
              totalCount: ship.count,
              hqLvRange: ship.hqLvRange.join(' ~ '),
              constructionRate: (ship.count * 100 / data.result.count).toFixed(3),
              kdockCount: ship.kdockCount,
              kdockConstructionRate: ship.kdockCount.map(function(val, index){return (val * 100 / data.result.kdockCount[index]).toFixed(3);}),
              secretaryCount: ship.secretaryCount.slice(0, 5)
          });
        });
        items.sort(function(a, b) {
            return a.totalCount - b.totalCount;
        });
        table.bootstrapTable('append', items);

        $('.toolbar-content').append("<span> / 查询结果总数: " + data.result.count + "</span>");
        $('.tab-content').removeClass('hidden');
    });
}

function nameFormatter(value) {
    var info = Poir.constants.shipInfo[value];
    var searchTag = Poir.constants.shipTypeTags;
    return value + "<!-- " + info.nameForSearch
        + (info.rare ? "," + searchTag["稀有"] : "")
        + (searchTag[info.shipType] != null ? "," + searchTag[info.shipType] : "")
        + ", -->";
}

function constructionRateFormatter(value) {
    return value + "%";
}

function detailFormatter(index, row) {
    var html = [];

    html.push("<div class='pull-right'><a href='/construction/ship/" + row.name +
        ".html'>查看舰娘页面</a></div>");

    html.push("<div><strong>渠位统计：</strong></div><div class='table-like'>" +
        "<div><span>渠位</span><span>数量</span><span>建造率</span></div>");
    for(var i = 0; i < 4; i++) {
        html.push("<div><span>" + (i + 1) + "</span><span>" + row.kdockCount[i] +
            "</span><span>" + row.kdockConstructionRate[i] + "%</span></div>");
    }
    html.push("</div>");

    html.push("<div><strong>秘书舰统计（前五）：</strong></div><div class='table-like'>" +
        "<div><span>秘书舰</span><span>数量</span></div>");
    for(var i = 0; i < row.secretaryCount.length; i++) {
        html.push("<div><span>" + row.secretaryCount[i].name + "</span><span>" +
            row.secretaryCount[i].count + "</span></div>");
    }
    html.push("</div>");

    return html.join('');
}
