//
//  TeamViewController.swift
//  FootballApp
//
//  Created by  Decagon on 11/12/2021.
//

import UIKit

class TeamViewController: UIViewController {
    
    private let topBackArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Arsenal"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let clubDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Club Details"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
//        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let foundedLabel: UILabel = {
        let label = UILabel()
        label.text = "Founded:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nickname:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Website:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let colorsLabel: UILabel = {
        let label = UILabel()
        label.text = "Club colors:"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let foundedAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "01 May 2021"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let nickAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "M'gladbach"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let addressAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Hennes-Weismer-Allee 1 Monchen gladbach 41179"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let phoneAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "+234 9032890587"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let webAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "https://profile-tesweb.vercel.app/"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let mailAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "www.borussia.de"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let colorAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Green, Orange, Yellow"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamPlayersLabel: UILabel = {
        let label = UILabel()
        label.text = "Team Players"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playersTableView: UITableView = {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        constraintViews()
    }
    
    func addSubViews(){
        view.addSubview(topBackArrowButton)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(clubDetailsLabel)
        view.addSubview(firstView)
        firstView.addSubview(foundedLabel)
        firstView.addSubview(foundedAnswerLabel)
        firstView.addSubview(nicknameLabel)
        firstView.addSubview(nickAnswerLabel)
        firstView.addSubview(addressLabel)
        firstView.addSubview(addressAnswerLabel)
        firstView.addSubview(phoneLabel)
        firstView.addSubview(phoneAnswerLabel)
        firstView.addSubview(websiteLabel)
        firstView.addSubview(webAnswerLabel)
        firstView.addSubview(emailLabel)
        firstView.addSubview(mailAnswerLabel)
        firstView.addSubview(colorsLabel)
        firstView.addSubview(colorAnswerLabel)
        view.addSubview(teamPlayersLabel)
    }
    
    func constraintViews(){
        addSubViews()
        
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            clubDetailsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            clubDetailsLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            
            firstView.topAnchor.constraint(equalTo: clubDetailsLabel.bottomAnchor, constant: 20),
            firstView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            foundedLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 10),
            foundedLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            foundedLabel.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.4),
            
            foundedAnswerLabel.topAnchor.constraint(equalTo: foundedLabel.topAnchor),
            foundedAnswerLabel.leadingAnchor.constraint(equalTo: foundedLabel.trailingAnchor, constant: 5),
            
            nicknameLabel.topAnchor.constraint(equalTo: foundedLabel.bottomAnchor, constant: 10),
            nicknameLabel.leadingAnchor.constraint(equalTo: foundedLabel.leadingAnchor),
            nicknameLabel.widthAnchor.constraint(equalTo: foundedLabel.widthAnchor),
            
            nickAnswerLabel.topAnchor.constraint(equalTo: nicknameLabel.topAnchor),
            nickAnswerLabel.leadingAnchor.constraint(equalTo: foundedAnswerLabel.leadingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: foundedLabel.leadingAnchor),
            addressLabel.widthAnchor.constraint(equalTo: foundedLabel.widthAnchor),
            
            addressAnswerLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor),
            addressAnswerLabel.leadingAnchor.constraint(equalTo: foundedAnswerLabel.leadingAnchor),
            addressAnswerLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10),
            
            phoneLabel.topAnchor.constraint(equalTo: addressAnswerLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: foundedLabel.leadingAnchor),
            phoneLabel.widthAnchor.constraint(equalTo: foundedLabel.widthAnchor),
            
            phoneAnswerLabel.topAnchor.constraint(equalTo: phoneLabel.topAnchor),
            phoneAnswerLabel.leadingAnchor.constraint(equalTo: foundedAnswerLabel.leadingAnchor),
            
            websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            websiteLabel.leadingAnchor.constraint(equalTo: foundedLabel.leadingAnchor),
            websiteLabel.widthAnchor.constraint(equalTo: foundedLabel.widthAnchor),
            
            webAnswerLabel.topAnchor.constraint(equalTo: websiteLabel.topAnchor),
            webAnswerLabel.leadingAnchor.constraint(equalTo: foundedAnswerLabel.leadingAnchor),
            webAnswerLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10),
            
            emailLabel.topAnchor.constraint(equalTo: webAnswerLabel.bottomAnchor, constant: 7),
            emailLabel.leadingAnchor.constraint(equalTo: foundedLabel.leadingAnchor),
            emailLabel.widthAnchor.constraint(equalTo: foundedLabel.widthAnchor),
            
            mailAnswerLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            mailAnswerLabel.leadingAnchor.constraint(equalTo: foundedAnswerLabel.leadingAnchor),
            
            colorsLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            colorsLabel.leadingAnchor.constraint(equalTo: foundedLabel.leadingAnchor),
            colorsLabel.widthAnchor.constraint(equalTo: foundedLabel.widthAnchor),
            
            colorAnswerLabel.topAnchor.constraint(equalTo: colorsLabel.topAnchor),
            colorAnswerLabel.leadingAnchor.constraint(equalTo: foundedAnswerLabel.leadingAnchor),
            
            teamPlayersLabel.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 10),
            teamPlayersLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor)
        ])
        
        imageView.anchorWithConstantsToTop(top: titleLabel.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 500, rightConstant: 0)
    }
    
    
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }

}
