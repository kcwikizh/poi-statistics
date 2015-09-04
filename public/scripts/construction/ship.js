function requestData(ship_name) {
    $.getJSON('/construction/ship/' + ship_name + ".json", function(data) {
        $('.busy-indicator').hide();

        var table = $('table');
        table.bootstrapTable();
        items = [];
        $.each(data.result.recipes, function(key, recipe) {
          recipe.secretaryCount.sort(function(a, b) {
              return b.count - a.count;
          });

          items.push({
              fuel: recipe.items[0],
              ammo: recipe.items[1],
              steel: recipe.items[2],
              bauxite: recipe.items[3],
              devkit: recipe.items[4],
              totalCount: recipe.count,
              hqLvRange: recipe.hqLvRange.join(' ~ '),
              constructionRate: (recipe.count * 100 / recipe.recipeCount).toFixed(3),
              kdockCount: recipe.kdockCount,
              secretaryCount: recipe.secretaryCount.slice(0, 5)
          });
        });
        items.sort(function(a, b) {
            return b.constructionRate - a.constructionRate;
        });
        table.bootstrapTable('append', items);

        $('.toolbar-content').append("<span> / 查询结果总数: " + data.result.count + "</span>");
        $('.tab-content').removeClass('hidden');
    });
}

function constructionRateFormatter(value) {
    return value + "%";
}

function detailFormatter(index, row) {
    var html = [];

    html.push("<div class='pull-right'><a href='/construction/recipe/" + row.fuel +
        "-" + row.ammo + "-" + row.steel + "-" + row.bauxite + "-" + row.devkit +
        ".html'>查看公式页面</a></div>");

    html.push("<div><strong>渠位统计：</strong></div><div class='table-like'>" +
        "<div><span>渠位</span><span>数量</span></div>");
    for(var i = 0; i < 4; i++) {
        html.push("<div><span>" + (i + 1) + "</span><span>" + row.kdockCount[i] +
            "</span></div>");
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
