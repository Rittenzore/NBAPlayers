//
//  Player.swift
//  NBAPlayers
//
//  Created by Rittenzore on 10.03.2021.
//

import Foundation

struct PlayersResponse: Decodable {
    let data: [Player]
}

struct Player: Decodable {
    let firstName: String
    let lastName: String
    
    let team: Team
    let position: String
    
    let heightFeet: Int?
    let heightInches: Int?
    
    var height: String {
        if let heightFeet = heightFeet, let heightInches = heightInches {
            return "\(heightFeet)'\(heightInches)''"
        } else {
            return "Unknown"
        }
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case team = "team"
        case position = "position"
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
    }
}

let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
