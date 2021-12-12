//
//  TeamVC+Extension.swift
//  FootballApp
//
//  Created by  Tes on 12/12/2021.
//

import UIKit
import SVGKit

extension TeamDetailViewController{
    
    // MARK: Displays views
    func addSubViews(){
        topView.addSubview(topBackArrowButton)
        topView.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(clubDetailsLabel)
        view.addSubview(firstView)
        view.addSubview(topView)
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
        view.addSubview(playersTableView)
    }
    
    func constraintViews(){
        addSubViews()
        
        imageView.anchorWithConstantsToTop(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 550, rightConstant: 0)
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
            topBackArrowButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            topBackArrowButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            clubDetailsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            clubDetailsLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            
            firstView.topAnchor.constraint(equalTo: clubDetailsLabel.bottomAnchor, constant: 20),
            firstView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            firstView.heightAnchor.constraint(equalToConstant: 280),
            
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
            teamPlayersLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            
            playersTableView.topAnchor.constraint(equalTo: teamPlayersLabel.bottomAnchor, constant: 10),
            playersTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playersTableView.widthAnchor.constraint(equalTo: firstView.widthAnchor),
            playersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: table view stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return squad?.count ?? 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayersTableViewCell.identifier, for: indexPath) as? PlayersTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.selectionStyle = .none
        if let viewModel = squad {
            cell.display(with: (squad?[indexPath.row]) as! Squad )
        }
        return cell
    }
    
    // MARK: Configures views
    func populateViews() {
        NetworkService.shared.getTeamDetails(completion: { [weak self] result in
            
            switch result {
            case .success(let data):
                
                self?.clubDetails = data
                self?.squad = self?.clubDetails?.squad
                
                self?.playersTableView.reloadData()
                
                self?.foundedAnswerLabel.text = String(self?.clubDetails?.founded ?? 2002)
                self?.nickAnswerLabel.text = self?.clubDetails?.shortName ?? "2002"
                self?.addressAnswerLabel.text = self?.clubDetails?.address ?? "2002"
                self?.phoneAnswerLabel.text = self?.clubDetails?.phone ?? "2002"
                self?.webAnswerLabel.text = self?.clubDetails?.website ?? "2002"
                self?.mailAnswerLabel.text = self?.clubDetails?.email ?? "2002"
                self?.colorAnswerLabel.text = self?.clubDetails?.clubColors ?? "2002"
                
                self?.urlString = self?.clubDetails?.crestURL ?? "https://crests.football-data.org/57.svg"
                let url = URL(string: self?.urlString ?? "https://crests.football-data.org/57.svg")
                URLSession.shared.dataTask(with: url!) { data, _, error in
                    guard let data = data, error == nil else { return}
                    self?.teamViewModel?.imageData = data
                    DispatchQueue.main.async {
                        guard let image: SVGKImage = SVGKImage(contentsOf: url) else {
                            return
                        }
                        self?.imageView.image = image.uiImage
                        guard let img  = UIImage(data: data) else { return }
                        self?.imageView.image = img
                    }
                }.resume()
                
            case .failure(let error):
                print("The error: \(error.localizedDescription)")
            }
        })}
    
}
