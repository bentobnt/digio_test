//
//  HomeResponseFixture.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import Foundation
@testable import DigioTest

extension HomeResponse {
    static func fixture(spotlight: [Spotlight]? = [.fixture()],
                        products: [Product]? = [.fixture()],
                        cash: Cash? = .fixture()) -> Self {
        HomeResponse(spotlight: spotlight,
                     products: products,
                     cash: cash)

    }
}

extension Spotlight {
    static func fixture() -> Self {
        .init(name: "Recarga",
              bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
              description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura.")
    }
}

extension Product {
    static func fixture() -> Self {
        .init(name: "XBOX",
              imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
              description: "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!")
    }
}

extension Cash {
    static func fixture() -> Self {
        .init(title: "digio Cash",
              bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
              description: "Dinheiro na conta sem complicação. Transfira parte do limite do seu cartão para sua conta.")
    }
}
