//
//  TeamDetailsViewController.swift
//  NBAPlayers
//
//  Created by Rittenzore on 10.03.2021.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!

    var team: Team?
    
    override func viewDidLoad() {
        // Loading of "TeamDetailsViewController"
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = team?.name
        locationLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }
    

}
