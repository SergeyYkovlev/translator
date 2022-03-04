//
//  SearchPresenter.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation

final class Word: Decodable {
    let identifier: Int?
    let text: String?
    let meanings: [Meaning]?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case text = "text"
        case meanings = "meanings"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(Int.self, forKey: .identifier)
        text = try container.decode(String.self, forKey: .text)
        meanings = try container.decode([Meaning].self, forKey: .meanings)
    }
}
