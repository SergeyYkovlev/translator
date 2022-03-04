//
//  SearchPresenter.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

final class Meaning: Decodable {
    let identifier: Int?
    let partOfSpeech: PartOfSpeech?
    let translation: Translation?
    let transcription: String?
    var previewUrl: URL?
    var imageUrl: URL?
    var soundUrl: URL?

    private enum CodingKeys: String, CodingKey {
        case id
        case partOfSpeechCode
        case translation
        case transcription
        case previewUrl
        case imageUrl
        case soundUrl
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decodeIfPresent(Int.self, forKey: .id)
        let partOfSpeechCode = try container.decodeIfPresent(String.self, forKey: .partOfSpeechCode)
        partOfSpeech = PartOfSpeech(code: partOfSpeechCode)
        translation = try container.decodeIfPresent(Translation.self, forKey: .translation)
        transcription = try container.decodeIfPresent(String.self, forKey: .transcription)
        // TODO: - fix url
        if let previewString = try container.decodeIfPresent(String.self, forKey: .previewUrl) {
            previewUrl = URL(string: "http:" + previewString)
        }
        if let imageString = try container.decodeIfPresent(String.self, forKey: .imageUrl) {
            imageUrl = URL(string: "http:" + imageString)
        }
        if let soundString = try container.decodeIfPresent(String.self, forKey: .soundUrl) {
            soundUrl = URL(string: "http:" + soundString)
        }
    }
}

extension Meaning: Equatable {
    // TODO: - add all params
    static func == (lhs: Meaning, rhs: Meaning) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.partOfSpeech == rhs.partOfSpeech &&
            lhs.translation == rhs.translation &&
            lhs.transcription == rhs.transcription &&
            lhs.previewUrl == rhs.previewUrl &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.soundUrl == rhs.soundUrl
    }
}
