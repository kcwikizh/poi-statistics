function sumCount(value) {
  if ($.isArray(value)) {
    return value.reduce(function(sum, elem){return sum + elem;});
  }
  return value;
}

$(document).ready(function() {
  var table = $('table');

  items = [];
  $.each(window.dropData.shipData, function(key, val) {
    items.push({
      name: key,
      type: window.shipData[key].shipType,
      totalCount: sumCount(val.count),
      sCount: $.isArray(val.count) ? val.count[0] : 0,
      aCount: $.isArray(val.count) ? val.count[1] : 0,
      bCount: $.isArray(val.count) ? val.count[2] : 0,
      hqLvRange: val.hqLv.join(' ~ '),
      dropRate: (sumCount(val.count) * 100 / window.dropData.totalCount).toFixed(3)
    });
  });

  items.sort(function(a, b) {
      if (a.name == "(无)") return 1;
      if (b.name == "(无)") return -1;
      return a.totalCount - b.totalCount;
  });

  table.bootstrapTable().bootstrapTable('append', items);

  $('#cache-time').html(window.dropData.cacheTime);
  $('#query-count').html(window.dropData.totalCount);
  $('.fixed-table-toolbar > div:nth-of-type(2)')
    .append("<a class='btn btn-default' href='http://zh.kcwiki.moe/wiki/" +
      window.mapWikiData[window.queryData.mapId] + "' target='_blank'>查看百科</a>");
});

function nameFormatter(value) {
  /* why not use searchFormatter */
  var ship = window.shipData[value];
  return (ship.rare ? "<div style='color:red'>" + value + "</div>" : (value == "(无)" ? "(无掉落)" : value))
    + "<!-- " + ship.nameForSearch + (ship.rare ? "," + window.shipSearchTag["稀有"] : "")
    + (window.shipSearchTag[ship.shipType] != null ? ","+ window.shipSearchTag[ship.shipType] : "")
    + ", -->";
}

function dropRateFormatter(value) {
    return value + "%";
}

function detailFormatter(index, row) {
    var html = [];

    html.push("<div class='table-like'>");
    html.push("<div><span>敌方舰队</span>");
    var ranks = window.queryData.rank.split('');
    $.each(ranks, function(k, v) {
      html.push("<span>" + v + "胜</span>");
    });
    html.push("<span>掉落率</span></div>");

    var enemy = window.dropData.shipData[row.name].enemy;
    $.each(enemy, function (key, value) {
      html.push("<div><span>" + key + "</span>");
      if ($.isArray(value)) {
        $.each(value, function(k, v) {
          html.push("<span>" + v + "</span>");
        });
      }
      else {
        html.push("<span>" + value + "</span>");
      }
      var all = window.dropData.enemyData[key];
      var rate = sumCount(value) / Object.keys(all).reduce(function(sum, e){ return sum + sumCount(all[e]); }, 0);
      html.push("<span>" + (rate * 100).toFixed(3) + "%</span></div>");
    });
    html.push("</div>")

    return html.join('');
}
