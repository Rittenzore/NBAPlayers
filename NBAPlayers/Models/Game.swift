//
//  Game.swift
//  NBAPlayers
//
//  Created by Rittenzore on 11.03.2021.
//

import Foundation

struct GamesResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    let date: String
    
    let homeTeam: Team
    let visitorTeam: Team
    
    let homeTeamScore: Int
    let visitorTeamScore: Int
    
    let postseason: Bool
    let status: String
    let season: Int
    let period: Int
    
    var versus: String {
        homeTeam.fullName + " - " + visitorTeam.fullName
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case homeTeam = "home_team"
        case visitorTeam = "visitor_team"
        case homeTeamScore = "home_team_score"
        case visitorTeamScore = "visitor_team_score"
        case postseason
        case status
        case season
        case period
    }
}


