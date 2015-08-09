get '/event/?' do
  haml :'event/index', :locals => {
    :title_append => " # 活动统计",
    :data => {
      first: {
        chosen: 0,
        passed: 0,
        battle_win: 0,
        battle_total: 0
      },
      second: {
        chosen: 0,
        passed: 0,
        battle_win: 0,
        battle_total: 0
      },
      third: {
        chosen: 0,
        passed: 0,
        battle_win: 0,
        battle_total: 0
      },
      none: {
        chosen: 0,
        passed: 0,
        battle_win: 0,
        battle_total: 0
      }
    }
  }
end
