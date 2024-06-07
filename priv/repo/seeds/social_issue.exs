

for issue <- [

  %{
      name: "Lack of Fresh Water Supply",
      situation: "Your nation does not have a fresh water supply. This has caused many diseases such as typhoid, fever, cholera",
      possible_solution: "Access to water supply",
      youth_effect: -1,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Lack of Health care",
      situation: "Your nation does not have enough doctors and medical institutions for health care. This has caused many diseases and the labor force has been shrinking",
      possible_solution: "Access to HC",
      youth_effect: -1,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Lack of Education",
      situation: "You may have youthful population in your country but they are not performing at their full potential.",
      possible_solution: "Affodable Education",
      youth_effect: 0,
      economic_growth_effect: -2,
      co2_effect: 0,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Lack of Energy",
      situation: "The lack of energy supply is limiting your nation's ability to produce/provide goods and service",
      possible_solution: "Engery Supply",
      youth_effect: 0,
      economic_growth_effect: -2,
      co2_effect: 0,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Slum",
      situation: "In your nation formation of slums around major cities are causing problems. It is caused by poor city planning.",
      possible_solution: "City development",
      youth_effect: 0,
      economic_growth_effect: 3,
      co2_effect: 3,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Brain Drain",
      situation: "Your nation is losing talented people due to low standard of living.",
      possible_solution: "Improved standards of living",
      youth_effect: 0,
      economic_growth_effect: -4,
      co2_effect: 0,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Aging Population",
      situation: "Your nation is developed. Nevertheless, your population is decreasing due to decreasing birthrates. This has lead to aging population, with decreaseing working-age population. Economist predicts that your nation will sooon face your economic growth slowing down.",
      possible_solution: "Immigration / Automation",
      youth_effect: 0,
      economic_growth_effect: -7,
      co2_effect: 0,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "Over crowding of city",
      situation: "Metropolitans in your cities has helped your growth by cetralizing the economy. But this has lead to urban migration.Your people suffers from diseases caused by the airpolution. Your main source of airpolution is from traffic.",
      possible_solution: "Affodable public transport",
      youth_effect: 0,
      economic_growth_effect: -4,
      co2_effect: 3,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "CO2 Emittion from power plant",
      situation: "Your nation's electricity is produced mainly by burning focill fuel. It has been and still is a cheap and reliable solution to your nation's energy supply. However, the emission of CO2 from the power plan has started to undermine your people's health.",
      possible_solution: "New energy source",
      youth_effect: 0,
      economic_growth_effect: -8,
      co2_effect: 3,
      is_question: false,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_1",
      situation: "Has \"Lack of Education\" been solve OR Do they have a \"Lack of Education\" right now?
",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_2",
      situation: "At the end of Turn 2: NO \"Hospitals with advanced health care\"?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_3",
      situation: "Did the player chose\" Coal-powered electricity plant\"?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_4",
      situation: "Is \"Slum\" still an issue?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_5",
      situation: "Have they already solved \"Againg population\"?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_6",
      situation: "Have they solved \"CO2 Emittion from Power Plan\"?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_7",
      situation: "Have they chose \"Automation\"?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "question_8",
      situation: "Do they have \"Renewable Energy\"?",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: false,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "last_question_1",
      situation: "移民の受け入れにより、いくつかの問題が定義されています。その問題とはなにか考えよ。
",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: true,
      tip: "ヒント：
移民は労働人口を増やす＋賃金が安い
→現地人の雇用を維持できない
→賃金も上がらない
→将来への不安が高まる
→投資・消費が減る
→経済が悪化する
→雇用が減る・賃金が上がらない
ル～プ
文化の違い
・現地にも文化があります。
・移民が増えてくると現地の文化というのは疎かになりがち
→特にこれが長い歴史の上に成り立っているものであった場合、これを捨てるべきか？
",
      deleted_at: nil
  },

  %{
      name: "last_question_2",
      situation: "自動化 (Automation）／AIの発達により、職が失われていくということが危惧されています。
どのような職が失われるでしょうか？また、それは問題になると思いますか？
",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: true,
      tip: nil,
      deleted_at: nil
  },

  %{
      name: "last_question_3",
      situation: "再生可能エネルギーは長期的に見て本当に良い選択であるか議論せよ",
      possible_solution: "nan",
      youth_effect: 0,
      economic_growth_effect: 0,
      co2_effect: 0,
      is_question: true,
      is_last: true,
      tip: "ヒント：
・太陽光パネル、風力発電の風車の耐用年数は25年である
・太陽光パネルにあたっては触媒のリサイクル技術は未だ確立されていない
→廃棄問題（因みに日本で太陽光パネルブームがあったのは2010年代ということは…）
・大規模再生可能エネルギープラントを作るには土地が必要
・しかもエネルギー効率が良くない
・太陽光パネルの場合、その土地は一生日陰になるので植物も育ちません（因みに日本では森林を伐採して太陽光パネルを設置したりする自治体もあります）
→本当に環境に良いの？
・気候は予想できない
→電気の安定供給ができない
＋効率が悪い（費用対効果と発電効率）
→電気台の高騰
→コストプッシュ型のインフレ（物価高騰）
→需要減
→経済の停滞",
      deleted_at: nil
  },

] do
{:ok, _} = Planet.Cosmos.create_social_issue(issue)
end
