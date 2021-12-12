//
//  TeamViewController.swift
//  FootballApp
//
//  Created by  Decagon on 11/12/2021.
//

import UIKit
import SVGKit

class TeamDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    var clubDetails: APIResponse?
    var squad: [Squad]?
    var teamViewModel: TeamViewModel?
    var playersViewModel: [PlayerViewModel]?
    var urlString = " "
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topBackArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Arsenal"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let clubDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Club Details"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let foundedLabel: UILabel = {
        let label = UILabel()
        label.text = "Founded:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nickname:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Website:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let colorsLabel: UILabel = {
        let label = UILabel()
        label.text = "Club colors:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let foundedAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "2021"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nickAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "M'gladbach"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Hennes-Weismer-Allee 1 Monchen gladbach 41179"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let phoneAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "+234 9032890587"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let webAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "https://profile-tesweb.vercel.app/"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let mailAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "www.borussia.de"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let colorAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Green, Orange, Yellow"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let teamPlayersLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Players"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playersTableView: UITableView = {
        let table = UITableView()
        table.register(PlayersTableViewCell.self, forCellReuseIdentifier: PlayersTableViewCell.identifier)
        table.backgroundColor = .systemGray6
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: View Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        playersTableView.dataSource = self
        playersTableView.delegate = self
        title = "Arsenal"
        navigationController?.navigationBar.isHidden = true
        constraintViews()
        populateViews()
    }
    
    // MARK: Back arrow button function
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
}
