//
//  TextStyle+Application.swift
//  translator
//
//  Created by Сергей Яковлев on 18.03.2022.
//

import Foundation
import UIKit
import Texstyle

extension TextStyle {

    static var heading3: TextStyle {
        let textStyle = TextStyle()
        textStyle.font = UIFont.lato(ofSize: 16)
        textStyle.kerning = 0
        textStyle.color = .main2
        textStyle.alignment = .center
        return textStyle
    }

    static var heading3a: TextStyle {
        let textStyle = TextStyle()
        textStyle.font = UIFont.lato(ofSize: 18)
        textStyle.kerning = 0
        textStyle.color = .main2
        textStyle.alignment = .left
        return textStyle
    }

    static var heading3b: TextStyle {
        let textStyle = TextStyle()
        textStyle.font = UIFont.lato(ofSize: 16)
        textStyle.kerning = 0
        textStyle.color = .main2c
        textStyle.alignment = .center
        return textStyle
    }

    static var heading3c: TextStyle {
        let textStyle = TextStyle()
        textStyle.font = UIFont.lato(ofSize: 16)
        textStyle.kerning = 0
        textStyle.color = .main3c
        textStyle.alignment = .left
        return textStyle
    }

    static var heading3d: TextStyle {
        let textStyle = TextStyle()
        textStyle.font = UIFont.lato(ofSize: 13)
        textStyle.kerning = 0
        textStyle.color = .main2
        textStyle.alignment = .left
        return textStyle
    }

    static var heading3e: TextStyle {
        let textStyle = TextStyle()
        textStyle.font = UIFont.lato(ofSize: 28)
        textStyle.kerning = 0
        textStyle.color = .main2
        textStyle.alignment = .left
        return textStyle
    }

    static let title1: TextStyle = {
        let style = TextStyle()
        style.font = UIFont.lato(ofSize: 16)
        style.kerning = 0.2
        style.color = .main2
        style.alignment = .center
        style.lineHeight = 24
        return style
    }()

    static let paragraph1: TextStyle = {
        let style = TextStyle()
        style.font = UIFont.lato(ofSize: 12)
        style.kerning = 0.2
        style.color = .main2
        style.alignment = .center
        style.lineHeight = 24
        return style
    }()
}
