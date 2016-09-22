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

    $('#toolbar').bootstrapTableFilter({
      connectTo: 'table',
      filters: [
        {
          field: 'fuel',
          label: '油',
          type: 'range'
        },
        {
          field: 'ammo',
          label: '弹',
          type: 'range'
        },
        {
          field: 'steel',
          label: '钢',
          type: 'range'
        },
        {
          field: 'bauxite',
          label: '铝',
          type: 'range'
        },
        {
          field: 'count',
          label: '数量',
          type: 'range'
        },
        {
          field: 'usedCount',
          label: '公式使用次数',
          type: 'range'
        },
        {
          field: 'developmentRate',
          label: '开发率',
          type: 'range'
        }
      ]
    });
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
