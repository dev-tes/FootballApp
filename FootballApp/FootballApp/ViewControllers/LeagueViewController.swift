//
//  LeagueViewController.swift
//  FootballApp
//
//  Created by  Decagon on 11/12/2021.
//

import UIKit

class LeagueViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var leagueData: League?
    var leagueArray: [Team]?
    var leagueViewModel = [LeagueViewModel]()
    
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
        label.text = "Premiership"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var leagueCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        setupCollectionView()
        setConstraint()
        populateCompetitionCollectionView()
        navigationController?.navigationBar.isHidden = true
    }
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
}
