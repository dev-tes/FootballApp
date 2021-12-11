//
//  CompetetionCollectionViewCell.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit

class CompetitionCollectionViewCell: UICollectionViewCell {
    static let identifier = "CompetitionCollectionViewCell"
    
    let leagueNameLabel: UILabel = {
        let label = UILabel()
        label.text = "LeagueName"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Start date:"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12-02-2021"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
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
            leagueNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            leagueNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            countryLabel.topAnchor.constraint(equalTo: leagueNameLabel.bottomAnchor, constant: 20),
            countryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            startDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            startDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),

            dateLabel.topAnchor.constraint(equalTo: startDateLabel.topAnchor, constant: 2),
            dateLabel.leadingAnchor.constraint(equalTo: startDateLabel.trailingAnchor, constant: 3),
        ])
    }
    
    public func configure(with viewModel: CompetitionViewModel) {
        leagueNameLabel.text = viewModel.leagueName
        countryLabel.text = viewModel.country
        dateLabel.text = viewModel.date
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
