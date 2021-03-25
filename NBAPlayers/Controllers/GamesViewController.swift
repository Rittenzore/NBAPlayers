//
//  GamesViewController.swift
//  NBAPlayers
//
//  Created by Rittenzore on 11.03.2021.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var games: [Game] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    func reloadData() {
        showLoading()
        apiClient.getGames(completion: {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let games):
                    self.games = games
                    self.showData()
                case .failure:
                    self.games = []
                    self.showError()
                }
                self.tableView.reloadData()
            }
        })
    }
    
    func showLoading() {
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func showData() {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func showError() {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = false
        self.reloadButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Games"
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        
        let game = games[indexPath.row]
        cell.textLabel?.text = game.versus
        cell.detailTextLabel?.text = game.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Transition to "GamesDetailsViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "GamesDetailsViewController") as! GamesDetailsViewController
        
        viewController.game = games[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
