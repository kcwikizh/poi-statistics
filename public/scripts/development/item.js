function requestData(itemId) {
  $.getJSON('/development/item/' + itemId + ".json", function(jsonObj) {
    $('.busy-indicator').hide();

    var table = $('table');
    table.bootstrapTable();
    items = [];
    $.each(jsonObj.data, function(index, item) {
      hqLv = Object.keys(item.hqLvCount);
      items.push({
        fuel: item.recipe[0],
        ammo: item.recipe[1],
        steel: item.recipe[2],
        bauxite: item.recipe[3],
        count: item.count,
        usedCount: item.usedCount,
        hqLvRange: Math.min.apply(null, hqLv) + '~' + Math.max.apply(null, hqLv),
        secretaryCount: item.secretaryCount,
        developmentRate: item.rate,
      });
    });
    items.sort(function(a, b) {
      return b.count - a.count;
    });
    table.bootstrapTable('append', items);
  });
}

function developmentRateFormatter(value) {
    return value + "%";
}

function detailFormatter(index, row) {
    var html = [];

    html.push("<div class='table-like'>");
    html.push("<div><span>秘书舰</span><span>数量</span></div>");
    var id = Object.keys(row.secretaryCount).sort(function(a, b) {
      return row.secretaryCount[b] - row.secretaryCount[a];
    });
    for (var i = 0; i < Math.min(8, id.length); i++) {
      html.push("<div><span>" + id[i] + "</span>");
      html.push("<span>" + row.secretaryCount[id[i]] + "</span></div>");
    }
    html.push("</div>");

    return html.join('');
}
