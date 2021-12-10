//
//  CompetetionCollectionViewCell.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit

class CompetetionCollectionViewCell: UICollectionViewCell {
    static let identifier = "CompetetionCollectionViewCell"
    
    let leagueNameLabel: UILabel = {
        let label = UILabel()
        label.text = "LeagueName"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Start date:"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12-02-2021"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        constraintViews()
    }
    
    func constraintViews() {
        contentView.addSubview(leagueNameLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(startDateLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            leagueNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            leagueNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            countryLabel.topAnchor.constraint(equalTo: leagueNameLabel.bottomAnchor, constant: 20),
            countryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            startDateLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 25),
            startDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),

            dateLabel.topAnchor.constraint(equalTo: startDateLabel.topAnchor, constant: 2),
            dateLabel.leadingAnchor.constraint(equalTo: startDateLabel.trailingAnchor, constant: 3),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
