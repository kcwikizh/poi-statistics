var rank = '';

function loadData(query) {
  $.getJSON('/drop/map/' + query.id + (query.level > 0 ? "/" + query.level : "") + "/" + query.point + "-" + query.rank + ".json", function(obj) {
    var table = $('table');
    rank = query.rank;

    items = [];
    $.each(obj.data, function(key, val) {
      items.push({
        name: key,
        type: window.shipData[key].shipType,
        totalCount: val.totalCount,
        sCount: val.rankCount ? val.rankCount[0] : 0,
        aCount: val.rankCount ? val.rankCount[1] : 0,
        bCount: val.rankCount ? val.rankCount[2] : 0,
        hqLvRange: val.hqLv.join(' ~ '),
        dropRate: val.rate,
        enemyData: val.enemy
      });
    });
    items.sort(function(a, b) {
      if (a.name == "(无)") return 1;
      if (b.name == "(无)") return -1;
      return a.totalCount - b.totalCount;
    });

    table.bootstrapTable().bootstrapTable('append', items);

    $('#cache-time').html(obj.generateTime);
    $('#query-count').html(obj.totalCount);
    $('.fixed-table-toolbar > div:nth-of-type(2)')
      .append("<a class='btn btn-default' href='http://zh.kcwiki.moe/wiki/" +
        window.mapWikiData[query.id] + "' target='_blank'>查看百科</a>");
    
    $('.busy-indicator').hide();
    $('div.row.hidden').removeClass('hidden');
  }).fail(function() {
    alert('Failed to get data');
  });
}

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
    var ranks = rank.split('');
    $.each(ranks, function(k, v) {
      html.push("<span>" + v + "胜</span>");
    });
    html.push("<span>掉落率</span></div>");

    var enemy = row.enemyData;
    $.each(enemy, function (key, value) {
      html.push("<div><span>" + key + "</span>");
      if ($.isArray(value.count)) {
        $.each(value.count, function(k, v) {
          html.push("<span>" + v + "</span>");
        });
      }
      else {
        html.push("<span>" + value.count + "</span>");
      }
      html.push("<span>" + value.rate + "%</span></div>");
    });
    html.push("</div>")

    return html.join('');
}
