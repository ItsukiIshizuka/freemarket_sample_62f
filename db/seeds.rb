#親
## カテゴリー
lady, men = Category.create([{name: "レディース"}, {name: "メンズ"}])
baby_kids = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
book_music_game = Category.create(name: "本・音楽・ゲーム")
toy_hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
cosme_perfume_beauty = Category.create(name: "コスメ・香水・美容")
appliance_smartphone_camera = Category.create(name: "家電・スマホ・カメラ")
sport_leisure = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
car_automobile = Category.create(name: "自動車・オートバイ")
etc = Category.create(name: "その他")




## デリバリー
exhibit, purchase = Delivery.create([{responsibility: "送料込み(出品者負担)"}, {responsibility: "着払い(購入者負担)"}])


#子
## カテゴリー
lady_tops, lady_jacket = lady.children.create([{name: "トップス"}, {name: "ジャケット/アウター"}])
lady_pants, lady_skirt = lady.children.create([{name: "パンツ"}, {name: "スカート"}])
lady_onepiece = lady.children.create(name: "パンツ")
lady_shoes = lady.children.create(name: "靴")
lady_pajama = lady.children.create(name: "ルームウェア／パジャマ")
lady_legwear = lady.children.create(name: "レッグウェア")
lady_hat = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accessory, lady_hair_accessory = lady.children.create([{name: "アクセサリー"}, {name: "ヘアアクセサリー"}])
lady_goods = lady.children.create(name: "小物")
lady_watch = lady.children.create(name: "時計")

men_tops, men_jacket = men.children.create([{name: "トップス"}, {name: "ジャケット/アウター"}])
men_pants = men.children.create(name: "パンツ")
men_shoes = men.children.create(name: "靴")
men_bag = men.children.create(name: "バッグ")
men_suit = men.children.create(name: "スーツ")
men_hat = men.children.create(name: "帽子")
men_accessory = men.children.create(name: "アクセサリー")
men_goods = men.children.create(name: "小物")
men_watch = men.children.create(name: "時計")
men_swimsuit = men.children.create(name: "水着")
men_legwear = men.children.create(name: "レッグウェア")
men_underwear = men.children.create(name: "アンダーウェア")
men_etc = etc.children.create(name: "その他")

baby_kids_female_under_95cm = baby_kids.children.create(name: "ベビー服(女の子用)~95cm")
baby_kids_male_under_95cm = baby_kids.children.create(name: "ベビー服(男の子用)~95cm")
baby_kids_unisex_under_95cm = baby_kids.children.create(name: "ベビー服(男女兼用)~95cm")
baby_kids_female_over_100cm = baby_kids.children.create(name: "キッズ服(女の子用)100cm~")
baby_kids_male_over_100cm = baby_kids.children.create(name: "キッズ服(男の子用)100cm~")
baby_kids_unisex_over_100cm = baby_kids.children.create(name: "キッズ服(男女兼用)100cm~")
baby_kids_shoes = baby_kids.children.create(name: "キッズ靴")
baby_kids_goods = baby_kids.children.create(name: "子ども用ファッション小物")
baby_kids_toilet = baby_kids.children.create(name: "おむつ／トイレ／バス")
baby_kids_outdoor = baby_kids.children.create(name: "外出／移動用品")
baby_kids_furniture = baby_kids.children.create(name: "ベビー家具／寝具／室内用品")
baby_kids_toy = baby_kids.children.create(name: "おもちゃ")
baby_kids_souvenir = baby_kids.children.create(name: "行事／記念品")

interior_kitchen = interior.children.create(name: "キッチン／食器")
interior_bed = interior.children.create(name: "ベッド／マットレス")
interior_sofa = interior.children.create(name: "ソファ／ソファベッド")
interior_chair = interior.children.create(name: "椅子／チェア")
interior_table = interior.children.create(name: "机／テーブル")
interior_storage = interior.children.create(name: "収納家具")
interior_carpet = interior.children.create(name: "ラグ／カーペット／マット")
interior_curtain = interior.children.create(name: "カーテン／ブラインド")
interior_light = interior.children.create(name: "ライト／照明")
interior_bedding = interior.children.create(name: "寝具")
interior_goods = interior.children.create(name: "インテリア小物")
interior_seasonary = interior.children.create(name: "季節／年中行事")
interior_etc = interior.children.create(name: "その他")

book_music_game_book = book_music_game.children.create(name: "本")
book_music_game_comic = book_music_game.children.create(name: "コミック")
book_music_game_magazine = book_music_game.children.create(name: "雑誌")
book_music_game_cd = book_music_game.children.create(name: "CD")
book_music_game_dvd = book_music_game.children.create(name: "DVD／ブルーレイ")
book_music_game_record = book_music_game.children.create(name: "レコード")
book_music_game_tvgame = book_music_game.children.create(name: "TVゲーム")

toy_hobby_toy = toy_hobby.children.create(name: "おもちゃ")
toy_hobby_talent = toy_hobby.children.create(name: "タレントグッズ")
toy_hobby_comic_anime = toy_hobby.children.create(name: "コミック／アニメグッズ")
toy_hobby_card = toy_hobby.children.create(name: "トレーディングカード")
toy_hobby_figure = toy_hobby.children.create(name: "フィギュア")
toy_hobby_instrument = toy_hobby.children.create(name: "楽器／器財")
toy_hobby_collection = toy_hobby.children.create(name: "コレクション")
toy_hobby_military = toy_hobby.children.create(name: "ミリタリー")
toy_hobby_artwork = toy_hobby.children.create(name: "美術品")
toy_hobby_art = toy_hobby.children.create(name: "アート用品")
toy_hobby_etc = toy_hobby.children.create(name: "その他")

cosme_perfume_beauty_base = cosme_perfume_beauty.children.create(name: "ベースメイク")
cosme_perfume_beauty_makeup = cosme_perfume_beauty.children.create(name: "メイクアップ")
cosme_perfume_beauty_nailcare = cosme_perfume_beauty.children.create(name: "ネイルケア")
cosme_perfume_beauty_perfume = cosme_perfume_beauty.children.create(name: "香水")
cosme_perfume_beauty_skincare = cosme_perfume_beauty.children.create(name: "スキンケア／基礎化粧品")
cosme_perfume_beauty_haircare = cosme_perfume_beauty.children.create(name: "ヘアケア")
cosme_perfume_beauty_bodycare = cosme_perfume_beauty.children.create(name: "ボディケア")
cosme_perfume_beauty_oralcare = cosme_perfume_beauty.children.create(name: "オーラルケア")
cosme_perfume_beauty_relaxation = cosme_perfume_beauty.children.create(name: "リラクゼーション")
cosme_perfume_beauty_diet = cosme_perfume_beauty.children.create(name: "ダイエット")
cosme_perfume_beauty_etc = cosme_perfume_beauty.children.create(name: "その他")

appliance_smartphone_camera_smartphone = appliance_smartphone_camera.children.create(name: "スマートフォン")
appliance_smartphone_camera_accessary = appliance_smartphone_camera.children.create(name: "スマホアクセサリー")
appliance_smartphone_camera_pc_tablet = appliance_smartphone_camera.children.create(name: "PC／タブレット")
appliance_smartphone_camera_camera = appliance_smartphone_camera.children.create(name: "カメラ")
appliance_smartphone_camera_tv = appliance_smartphone_camera.children.create(name: "テレビ／映像機器")
appliance_smartphone_camera_audio = appliance_smartphone_camera.children.create(name: "オーディオ機器")
appliance_smartphone_camera_health = appliance_smartphone_camera.children.create(name: "美容／健康")
appliance_smartphone_camera_air = appliance_smartphone_camera.children.create(name: "冷暖房／空調")
appliance_smartphone_camera_appliance = appliance_smartphone_camera.children.create(name: "生活家電")
appliance_smartphone_camera_etc = appliance_smartphone_camera.children.create(name: "その他")

sport_leisure_golf = sport_leisure.children.create(name: "ゴルフ")
sport_leisure_fishing = sport_leisure.children.create(name: "フィッシング")
sport_leisure_bicycle = sport_leisure.children.create(name: "自転車")
sport_leisure_training = sport_leisure.children.create(name: "トレーニング／エクササイズ")
sport_leisure_baseball = sport_leisure.children.create(name: "野球")
sport_leisure_soccer = sport_leisure.children.create(name: "サッカー／フットサル")
sport_leisure_tennis = sport_leisure.children.create(name: "テニス")
sport_leisure_snowboard = sport_leisure.children.create(name: "スノーボード")
sport_leisure_ski = sport_leisure.children.create(name: "スキー")
sport_leisure_sports = sport_leisure.children.create(name: "その他スポーツ")
sport_leisure_outdoor = sport_leisure.children.create(name: "アウトドア")
sport_leisure_etc = sport_leisure.children.create(name: "その他")

handmade_accessory = handmade.children.create(name: "アクセサリー(女性用)")
handmade_fashion = handmade.children.create(name: "ファッション／小物")
handmade_watch = handmade.children.create(name: "アクセサリー／時計")
handmade_interior = handmade.children.create(name: "日用品／インテリア")
handmade_toy = handmade.children.create(name: "趣味／おもちゃ")
handmade_kids = handmade.children.create(name: "キッズ／ベビー")
handmade_material = handmade.children.create(name: "素材／材料")
handmade_derivative = handmade.children.create(name: "二次創作物")
handmade_etc = handmade.children.create(name: "その他")

ticket_music = ticket.children.create(name: "音楽")
ticket_sports = ticket.children.create(name: "スポーツ")
ticket_musical = ticket.children.create(name: "演劇／芸能")
ticket_event = ticket.children.create(name: "イベント")
ticket_movie = ticket.children.create(name: "映画")
ticket_facilities = ticket.children.create(name: "施設利用券")
ticket_complimentary = ticket.children.create(name: "優待券／割引券")
ticket_etc = ticket.children.create(name: "その他")

car_automobile_car = car_automobile.children.create(name: "自動車本体")
car_automobile_car_tire = car_automobile.children.create(name: "自動車タイヤ／ホイール")
car_automobile_car_parts = car_automobile.children.create(name: "自動車パーツ")
car_automobile_car_accessory = car_automobile.children.create(name: "自動車アクセサリー")
car_automobile_automobile = car_automobile.children.create(name: "オートバイ車体")
car_automobile_automobile_parts = car_automobile.children.create(name: "オートバイパーツ")
car_automobile_automobile_accessory = car_automobile.children.create(name: "オートバイアクセサリー")

etc_bundle_sale = etc.children.create(name: "まとめ売り")
etc_pet = etc.children.create(name: "ペット用品")
etc_food = etc.children.create(name: "食品")
etc_drink = etc.children.create(name: "飲料／酒")
etc_travel = etc.children.create(name: "日用品／生活雑貨／旅行")
etc_antique = etc.children.create(name: "アンティーク／コレクション")
etc_stationary = etc.children.create(name: "文房具／事務用品")
etc_office = etc.children.create(name: "事務／店舗用品")
etc_etc = etc.children.create(name: "その他")



## デリバリー
exhibit_undecided, exhibit_rakuraku = exhibit.children.create([{responsibility: "未定"}, {responsibility: "らくらくメルカリ便"}])
purchase_undecided, purchase_kuroneko = purchase.children.create([{responsibility: "未定"}, {responsibility: "クロネコヤマト"}])


#孫
shirt_short, shirt_long = lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}])
shirt_short, shirt_long = men_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}])
tailored_jacket, collarless_jacket = lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}])
tailored_jacket, collarless_jacket = men_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}])
