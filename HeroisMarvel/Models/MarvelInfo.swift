//
//  MarvelInfo.swift
//  HeroisMarvel
//
//  Created by Max Mendes on 09/09/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation

struct MarvelInfo: Codable{
    
    var code: Int
    var status: String
    var data: MarvelData
}


struct MarvelData: Codable{
    var offset: Int
    var limit: Int
    var total: Int
    var results: [Hero]
}

struct Hero: Codable{
    var name: String
    var description: String
    var thumbnail: HeroImage
    var urls: [HeroURL]
}

struct HeroImage: Codable{
    
    var path: String
    var ext: String
    
    var urls: String{
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey{
        case path
        case ext = "extension"
    }
}


struct HeroURL: Codable{
    
    var type: String
    var url: String
    
}

