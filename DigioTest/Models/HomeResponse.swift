//
//  HomeResponse.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import Foundation

struct HomeResponse: Decodable {
    let spotlight: [Spotlight]?
    let products: [Product]?
    let cash: Cash?
}

struct Spotlight: Decodable {
    let name: String?
    let bannerURL: String?
    let description: String?
}

struct Product: Decodable {
    let name: String?
    let imageURL: String?
    let description: String?
}

struct Cash: Decodable {
    let title: String?
    let bannerURL: String?
    let description: String?
}
