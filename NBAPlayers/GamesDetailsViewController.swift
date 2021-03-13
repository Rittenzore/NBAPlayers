//
//  GamesDetailsViewController.swift
//  NBAPlayers
//
//  Created by Rittenzore on 11.03.2021.
//

import UIKit

class GamesDetailsViewController: UIViewController {
    
    @IBOutlet weak var homeTeamLabel: UIButton!
    @IBOutlet weak var visitorTeamLabel: UIButton!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var visitorTeamScore: UILabel!
    @IBOutlet weak var homeTeamCity: UILabel!
    @IBOutlet weak var visitorTeamCity: UILabel!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Game"
        navigationController?.navigationBar.prefersLargeTitles = true
        homeTeamCity.text = game?.homeTeam.city
        visitorTeamCity.text = game?.visitorTeam.city
        homeTeamScore.text = game?.homeTeamScore.description
        visitorTeamScore.text = game?.visitorTeamScore.description
        
        if game!.homeTeamScore > game!.visitorTeamScore {
            homeTeamScore.textColor = UIColor.systemGreen
            visitorTeamScore.textColor = UIColor.systemRed
        } else {
            homeTeamScore.textColor = UIColor.systemRed
            visitorTeamScore.textColor = UIColor.systemGreen
        }
        
        homeTeamLabel.setTitle(game?.homeTeam.name, for: .normal)
        visitorTeamLabel.setTitle(game?.visitorTeam.name, for: .normal)
    }
    
    
    @IBAction func onHomeTeamLabelTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        viewController.team = game?.homeTeam
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func onVisitorTeamLabelTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        viewController.team = game?.visitorTeam
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
