var rank = '';

function loadData(query) {
  $.getJSON('/drop/ship/' + query.id + "/" + query.rank + ".json", function(obj) {
    var table = $('table');
    rank = query.rank;
    
    items = [];
    $.each(obj.data, function(map, val) {
      items.push({
        quest: map,
        totalCount: val.totalCount,
        sCount: val.rankCount ? val.rankCount[0] : 0,
        aCount: val.rankCount ? val.rankCount[1] : 0,
        bCount: val.rankCount ? val.rankCount[2] : 0,
        hqLvRange: val.hqLv.join(' ~ '),
        dropRate: val.rate
      });
    });
    items.sort(function(a, b) {
      return b.dropRate - a.dropRate;
    });

    table.bootstrapTable().bootstrapTable('append', items);

    $('#cache-time').html(obj.generateTime);
    $('#query-count').html(obj.totalCount);
    $('.fixed-table-toolbar > div:nth-of-type(2)')
      .append("<a class='btn btn-default' href='http://zh.kcwiki.moe/wiki/" +
        query.name + "' target='_blank'>查看百科</a>");


    $('.busy-indicator').hide();
    $('div.row.hidden').removeClass('hidden');
  }).fail(function() {
    alert('Failed to get data');
  });
}

function questFormatter(value) {
  var val = value.replace('(Boss)', '').replace('甲', 3).replace('乙', 2).replace('丙', 1).split('-');
  return '<a href="/drop/map/' + val[0] + val[1] + (val[3] ? "/" + val[3] : "") + '/' + val[2] + '-' + rank + '.html">' + value + '</a>';
}

function dropRateFormatter(value) {
    return value + "%";
}
