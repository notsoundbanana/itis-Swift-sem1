//
//  MockData.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import UIKit

struct MockData{

    static let shared = MockData()

    private let favouriteMemes: ListSection = {
        .favouriteMemes([
            .init(title: "", image: "https://www.meme-arsenal.com/memes/4a565bc6e562847152b4bb2dc3c9d13c.jpg"),
            .init(title: "", image: "https://www.meme-arsenal.com/memes/7bee4b2287a0e5f7f8f84813d398b0ff.jpg"),
            .init(title: "", image: "https://www.meme-arsenal.com/memes/fc672dbdc3a952373e7d4469c776eee0.jpg"),
            .init(title: "", image: "https://4tololo.ru/sites/default/files/images/20181604131430.jpg"),
            .init(title: "", image: "https://www.meme-arsenal.com/memes/407628149464dbb8f67764d0a572e0a6.jpg"),
            .init(title: "", image: "https://www.meme-arsenal.com/memes/a88cc31487c2533a7d2c8d3f35805a76.jpg"),
            .init(title: "", image: "https://www.meme-arsenal.com/memes/e0bf8c6d8399928d67e32390f9b94bc5.jpg"),
            .init(title: "", image: "https://damion.club/uploads/posts/2022-01/1643150231_1-damion-club-p-smeshnoi-rizhii-kot-1.jpg"),
            .init(title: "", image: "https://oir.mobi/uploads/posts/2021-04/1619694355_32-oir_mobi-p-radostnii-kot-zhivotnie-krasivo-foto-35.jpg"),
            .init(title: "", image: "https://s2.best-wallpaper.net/wallpaper/iphone/1708/Funny-cat-tie_iphone_1080x1920.jpg"),
            .init(title: "", image: "https://s2.dmcdn.net/v/U5eEh1YrMPpQooRNb"),
        ])
    }()

    private let memes: ListSection = {
        .memes([
            .init(title: "SOMEBODY", image: "https://wallpaperaccess.com/full/4944181.png"),
            .init(title: "ЪУЪ", image: "https://c4.wallpaperflare.com/wallpaper/583/668/58/memes-cat-boy-hd-wallpaper-preview.jpg"),
            .init(title: "NOOO", image: "https://i.pinimg.com/originals/25/d5/11/25d511b9b8992ec657dd44ac65c21b51.jpg"),
            .init(title: "Hate", image: "https://wallpapers.com/images/hd/sleepy-cat-meme-q7y1o5tfpec676ct.jpg"),
            .init(title: "Шаурма", image: "https://c4.wallpaperflare.com/wallpaper/987/106/409/1600x1200-px-cat-funny-grumpy-wallpaper-preview.jpg"),
            .init(title: "Cыр", image: "https://memepedia.ru/wp-content/uploads/2020/05/eyhju-xxgaetdof.jpg"),
            .init(title: "Toilet", image: "https://avatars.mds.yandex.net/get-vthumb/2901564/4e1c347df6f5124c0f8785999da9f368/564x318_1"),
            .init(title: "JUICE", image: "https://lifeglobe.net/x/entry/6080/1-0.jpg"),
            .init(title: "ПОДержка", image: "https://gamerwall.pro/uploads/posts/2022-09/1662292416_1-gamerwall-pro-p-smeshnie-koshki-vkontakte-1.jpg"),
            .init(title: "Да", image: "https://bestcube.space/wp-content/uploads/Luchshe-poprobovat-chem-ne-poprobovat.jpg"),
            .init(title: "Кот, злой", image: "https://funart.pro/uploads/posts/2021-07/1627485035_37-funart-pro-p-zlobnii-kot-zhivotnie-krasivo-foto-48.jpg"),
        ])
    }()

    var pageData: [ListSection]{
        [favouriteMemes, memes]
    }
}
