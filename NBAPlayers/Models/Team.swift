//
//  Team.swift
//  NBAPlayers
//
//  Created by Rittenzore on 10.03.2021.
//

import Foundation

struct Team: Decodable {
    let name: String
    let city: String
    let conference: String
    
    var fullName: String {
        city + " " + name
    }
}
