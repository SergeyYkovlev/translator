//
//  SearchPresenter.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
final class PartOfSpeech {
    let code: String?
    let text: String?

    // swiftlint:disable:next cyclomatic_complexity
    init?(code: String?) {
        guard code != nil else {
            return nil
        }
        self.code = code
        switch code {
        case "n":
            text = "noun"
        case "v":
            text = "verb"
        case "j":
            text = "adjective"
        case "r":
            text = "adverb"
        case "prp":
            text = "preposition"
        case "prn":
            text = "pronoun"
        case "crd":
            text = "cardinal number"
        case "cjc":
            text = "conjunction"
        case "exc":
            text = "interjection"
        case "det":
            text = "article"
        case "abb":
            text = "abbreviation"
        case "x":
            text = "particle"
        case "ord":
            text = "ordinal number"
        case "md":
            text = "modal verb"
        case "ph":
            text = "phrase"
        case "phi":
            text = "idiom"
        default:
            text = nil
        }
    }
}

extension PartOfSpeech: Equatable {
    static func == (lhs: PartOfSpeech, rhs: PartOfSpeech) -> Bool {
        return lhs.code == rhs.code &&
            lhs.text == rhs.text
    }
}
