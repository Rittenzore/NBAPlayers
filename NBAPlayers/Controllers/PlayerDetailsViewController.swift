//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by Rittenzore on 10.03.2021.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    
    var player: Player?
    
    override func viewDidLoad() {
        // Loading PlayerDetailsViewController
        super.viewDidLoad()
        navigationItem.title = player?.fullName
        navigationController?.navigationBar.prefersLargeTitles = true
        positionLabel.text = "Position " + player!.position
        heightLabel.text = player?.height
        teamButton.setTitle(player?.team.fullName, for: .normal)
    }
    

    @IBAction func onTeamButtonTapped(_ sender: Any) {
        // Transition to "TeamDetailsViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        
        viewController.team = player?.team
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    

}
