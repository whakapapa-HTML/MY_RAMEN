Recipe.create!([
  {user_id: 1, genre_id: 1, name: "煮干しが効いてる醤油ラーメン", introduction: "美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！", serving: 4, recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png",
  ingredients_attributes:[
    { recipe_id: 1, name: "煮干し", amount: 300, per_amount: 75},
    { recipe_id: 1, name: "椎茸", amount: 100, per_amount: 25},
    { recipe_id: 1, name: "昆布", amount: 100, per_amount: 25},
    { recipe_id: 1, name: "肩ロース", amount: 400, per_amount: 100},
    { recipe_id: 1, name: "めんま", amount: 100, per_amount: 25},
    { recipe_id: 1, name: "鶏ガラ", amount: 300, per_amount: 75},
    { recipe_id: 1, name: "ゲンコツ", amount: 500,per_amount: 125},
    { recipe_id: 1, name: "醤油", amount: 100, per_amount: 25}
  ],
  procedures_attributes:[
    { recipe_id: 1, explanation: "鶏ガラを下茹でする", recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png")},
    { recipe_id: 1, explanation: "煮干しの灰汁をとる", recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png")},
    { recipe_id: 1, explanation: "チャーシューを３日間つけておく", recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png")},
    { recipe_id: 1, explanation: "めんまを味付けする", recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png")},
    { recipe_id: 1, explanation: "ゲンコツを割る", recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png")},
    { recipe_id: 1, explanation: "醤油でタレを作る", recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743-removebg-preview.png")},
    ]
     )},
  ])
