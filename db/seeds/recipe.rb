14.times do |_n|
  Recipe.create!([
                   { user_id: 1, genre_id: 1, name: '昔ながらの醤油らーめん', introduction: '美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！', serving: 4, recipe_image: open("#{Rails.root}/db/fixtures/DSCF9743.JPG"),
                     ingredients_attributes: [
                       { recipe_id: 1, name: '煮干し', amount: 300 },
                       { recipe_id: 1, name: '椎茸', amount: 100 },
                       { recipe_id: 1, name: '昆布', amount: 100 },
                       { recipe_id: 1, name: '肩ロース', amount: 400 },
                       { recipe_id: 1, name: 'めんま', amount: 100 },
                       { recipe_id: 1, name: '鶏ガラ', amount: 300 },
                       { recipe_id: 1, name: 'ゲンコツ', amount: 500 },
                       { recipe_id: 1, name: '醤油', amount: 100 }
                     ],
                     procedures_attributes: [
                       { recipe_id: 1, explanation: '鶏ガラを下茹でする',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9698.JPG") },
                       { recipe_id: 1, explanation: '煮干しの灰汁をとる',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") },
                       { recipe_id: 1, explanation: 'チャーシューを３日間つけておく',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9684.JPG") },
                       { recipe_id: 1, explanation: 'めんまを味付けする',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9698.JPG") },
                       { recipe_id: 1, explanation: 'ゲンコツを割る',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") },
                       { recipe_id: 1, explanation: '醤油でタレを作る',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") }
                     ] }
                 ])
end

2.times do |_n|
  Recipe.create!([
                   { user_id: 2, genre_id: 2, name: '時短でできる！塩つけ麺', introduction: '美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！', serving: 4, recipe_image: open("#{Rails.root}/db/fixtures/DSCF9796.JPG"),
                     ingredients_attributes: [
                       { recipe_id: 1, name: '煮干し', amount: 300},
                       { recipe_id: 1, name: '椎茸', amount: 100 },
                       { recipe_id: 1, name: '昆布', amount: 100 },
                       { recipe_id: 1, name: '肩ロース', amount: 400 },
                       { recipe_id: 1, name: 'めんま', amount: 100 },
                       { recipe_id: 1, name: '鶏ガラ', amount: 300 },
                       { recipe_id: 1, name: 'ゲンコツ', amount: 500 },
                       { recipe_id: 1, name: '醤油', amount: 100 }
                     ],
                     procedures_attributes: [
                       { recipe_id: 1, explanation: '鶏ガラを下茹でする',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9698.JPG") },
                       { recipe_id: 1, explanation: '煮干しの灰汁をとる',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") },
                       { recipe_id: 1, explanation: 'チャーシューを３日間つけておく',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9684.JPG") },
                       { recipe_id: 1, explanation: 'めんまを味付けする',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9698.JPG") },
                       { recipe_id: 1, explanation: 'ゲンコツを割る',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") },
                       { recipe_id: 1, explanation: '醤油でタレを作る',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") }
                     ] }
                 ])
end

2.times do |_n|
  Recipe.create!([
                   { user_id: 3, genre_id: 3, name: '味噌ラーメンの作り方', introduction: '美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！美味しく簡単に作れます！！スーパーの食材だけで簡単に作ることができます！！手軽に簡単調理でお店の味！！', serving: 4, recipe_image: open("#{Rails.root}/db/fixtures/DSCF9796.JPG"),
                     ingredients_attributes: [
                       { recipe_id: 1, name: '煮干し', amount: 300 },
                       { recipe_id: 1, name: '椎茸', amount: 100 },
                       { recipe_id: 1, name: '昆布', amount: 100 },
                       { recipe_id: 1, name: '肩ロース', amount: 400 },
                       { recipe_id: 1, name: 'めんま', amount: 100 },
                       { recipe_id: 1, name: '鶏ガラ', amount: 300 },
                       { recipe_id: 1, name: 'ゲンコツ', amount: 500 },
                       { recipe_id: 1, name: '醤油', amount: 100 }
                     ],
                     procedures_attributes: [
                       { recipe_id: 1, explanation: '鶏ガラを下茹でする',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9698.JPG") },
                       { recipe_id: 1, explanation: '煮干しの灰汁をとる',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") },
                       { recipe_id: 1, explanation: 'チャーシューを３日間つけておく',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9684.JPG") },
                       { recipe_id: 1, explanation: 'めんまを味付けする',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9698.JPG") },
                       { recipe_id: 1, explanation: 'ゲンコツを割る',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") },
                       { recipe_id: 1, explanation: '醤油でタレを作る',
                         procedure_image: open("#{Rails.root}/db/fixtures/DSCF9682.JPG") }
                     ] }
                 ])
end
