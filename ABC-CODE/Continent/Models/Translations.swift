//
//  Translations.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

struct Translations: Codable {
    let de: String?
    let es: String?
    let fr: String?
    let ja: String?
    let it: String?
    let br: String?
    let pt: String?
    let nl: String?
    let hr: String?
    let fa: String?
    
    enum CodingKeys: String, CodingKey {
        case de = "de"
        case es = "es"
        case fr = "fr"
        case ja = "ja"
        case it = "it"
        case br = "br"
        case pt = "pt"
        case nl = "nl"
        case hr = "hr"
        case fa = "fa"
    }
}
