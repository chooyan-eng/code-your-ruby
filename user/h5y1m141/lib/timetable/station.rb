class Station
  attr_reader :seibu_shinjuku_list
  def initialize
    @seibu_shinjuku_list = [
      { id: 'SS0', name: '西武新宿 せいぶしんじゅく', express_stop: true, local_stop: true },
      { id: 'SS1', name: '高田馬場 たかだのばば', express_stop: true, local_stop: true },
      { id: 'SS2', name: '下落合 しもおちあい', express_stop: false, local_stop: true },
      { id: 'SS3', name: '中井 なかい', express_stop: false, local_stop: true },
      { id: 'SS4', name: '新井薬師前 あらいやくしまえ', express_stop: false, local_stop: true },
      { id: 'SS5', name: '沼袋 ぬまぶくろ', express_stop: false, local_stop: true },
      { id: 'SS6', name: '野方 のがた', express_stop: false, local_stop: true },
      { id: 'SS7', name: '都立家政 とりつかせい', express_stop: false, local_stop: true },
      { id: 'SS8', name: '鷺ノ宮 さぎのみや', express_stop: true, local_stop: true },
      { id: 'SS9', name: '下井草 しもいぐさ', express_stop: false, local_stop: true },
      { id: 'SS10', name: '井荻 いおぎ', express_stop: false, local_stop: true },
      { id: 'SS11', name: '上井草 かみいぐさ', express_stop: false, local_stop: true },
      { id: 'SS12', name: '上石神井 かみしゃくじい', express_stop: true, local_stop: true },
      { id: 'SS13', name: '武蔵関 むさしせき', express_stop: false, local_stop: true },
      { id: 'SS14', name: '東伏見 ひがしふしみ', express_stop: false, local_stop: true },
      { id: 'SS15', name: '西武柳沢 せいぶやぎさわ', express_stop: false, local_stop: true },
      { id: 'SS16', name: '田無 たなし', express_stop: true, local_stop: true },
      { id: 'SS17', name: '花小金井 はなこがねい', express_stop: true, local_stop: true },
      { id: 'SS18', name: '小平 こだいら', express_stop: true, local_stop: true },
      { id: 'SS19', name: '久米川 くめがわ', express_stop: true, local_stop: true },
      { id: 'SS20', name: '東村山 ひがしむらやま', express_stop: true, local_stop: true },
      { id: 'SS21', name: '所沢 ところざわ', express_stop: true, local_stop: true }
    ]
  end

  def express_stop_names
    fetch_names(:express_stop)
  end

  def local_stop_names
    fetch_names(:local_stop)
  end

  private

  def fetch_names(type)
    seibu_shinjuku_list.select { |list| list[type] }
  end
end
