//
//  SearchPresenter.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

final class Translation: Decodable {
    let text: String?
    let note: String?
}

extension Translation: Equatable {
    static func == (lhs: Translation, rhs: Translation) -> Bool {
        return lhs.text == rhs.text &&
            lhs.note == rhs.note
    }
}
