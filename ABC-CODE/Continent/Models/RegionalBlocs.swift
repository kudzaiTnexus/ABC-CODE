//
//  RegionalBloc.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

struct RegionalBlocs : Codable {
    let acronym : String?
    let name : String?
    let otherAcronyms : [String]?
    let otherNames : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case acronym = "acronym"
        case name = "name"
        case otherAcronyms = "otherAcronyms"
        case otherNames = "otherNames"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        acronym = try values.decodeIfPresent(String.self, forKey: .acronym)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        otherAcronyms = try values.decodeIfPresent([String].self, forKey: .otherAcronyms)
        otherNames = try values.decodeIfPresent([String].self, forKey: .otherNames)
    }
    
}
