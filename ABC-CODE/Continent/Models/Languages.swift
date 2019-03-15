//
//  Language.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

struct Languages : Codable {
    let iso639_1 : String?
    let iso639_2 : String?
    let name : String?
    let nativeName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case iso639_1 = "iso639_1"
        case iso639_2 = "iso639_2"
        case name = "name"
        case nativeName = "nativeName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iso639_1 = try values.decodeIfPresent(String.self, forKey: .iso639_1)
        iso639_2 = try values.decodeIfPresent(String.self, forKey: .iso639_2)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nativeName = try values.decodeIfPresent(String.self, forKey: .nativeName)
    }
    
}
