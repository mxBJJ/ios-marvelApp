//
//  Marvel API.swift
//  HeroisMarvel
//
//  Created by Max Mendes on 09/09/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI{
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let publicKey = "52951a46ad8634b4a03921a413a0ebcd"
    static private let privateKey = "50377207a8553a123d50978ee4c034f06c1a9573"
    static private let limit = 50
    
    
    class func loadHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void){
       
        let offset = page * limit
        let startsWith: String
        if  let name = name, !name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        }else{
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        
        AF.request(url).responseJSON { (response) in
            guard let data = response.data ,let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
            
                marvelInfo.code == 200 else{
                    onComplete(nil)
                    return
            }
            
            onComplete(marvelInfo)
            
        }
        
    }
    
    
    private class func getCredentials() -> String{
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
    }
    
}
