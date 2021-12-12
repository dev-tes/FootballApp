//
//  PlayersTableViewCell1.swift
//  FootballApp
//
//  Created by  Decagon on 11/12/2021.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {
    
    static let identifier = "PlayersTableViewCell"
    
    let imageViews: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        return imageView
    }()
    let playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Player name"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let positionLabel: UILabel = {
        let label = UILabel()
        label.text = "Position"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
        label.backgroundColor = .systemGray6
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dobLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of birth"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageViews)
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(dobLabel)
        setUpViews()
    }

    
    public func display(with viewModel: Squad) {
        playerNameLabel.text = viewModel.name
        positionLabel.text = viewModel.position
        countryLabel.text = viewModel.countryOfBirth
        dobLabel.text = viewModel.dateOfBirth
    }
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
////        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
//    }
    
    public func configure(with viewModel: PlayerViewModel) {
        playerNameLabel.text = viewModel.playerName
        positionLabel.text = viewModel.position
        countryLabel.text = viewModel.countryOfBirth
        dobLabel.text = viewModel.dateOfBirth
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate([
            imageViews.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageViews.heightAnchor.constraint(equalToConstant: 60),
            imageViews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            playerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            playerNameLabel.leadingAnchor.constraint(equalTo: imageViews.trailingAnchor, constant: 10),
            
            positionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            positionLabel.leadingAnchor.constraint(equalTo: playerNameLabel.leadingAnchor),


            countryLabel.topAnchor.constraint(equalTo: playerNameLabel.topAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            
            dobLabel.topAnchor.constraint(equalTo: positionLabel.topAnchor),
            dobLabel.trailingAnchor.constraint(equalTo: countryLabel.trailingAnchor),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
