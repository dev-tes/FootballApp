//
//  LeaagueVC+Extension.swift
//  FootballApp
//
//  Created by  Tes on 12/12/2021.
//

import UIKit
import SVGKit

extension LeagueViewController{
    
    func populateCompetitionCollectionView() {
        NetworkService.shared.getTeamEmblem(completion: { [weak self] result in
            
            switch result {
            case .success(let data):
                
                self?.leagueData = data
                self?.leagueArray = self?.leagueData?.teams
                
                self?.leagueViewModel = (self?.leagueArray?.compactMap({
                    LeagueViewModel(
                        id: $0.id,
                        crestURL: $0.crestURL
                    )}))!
                
                self?.leagueCollectionView?.reloadData()
                
            case .failure(let error):
                print("The error: \(error.localizedDescription)")
            }
        })}
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/3)-4)
        leagueCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = leagueCollectionView else {
            return
        }
        collectionView.register(LeagueCollectionViewCell.self, forCellWithReuseIdentifier: LeagueCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    func setConstraint() {
        view.addSubview(topBackArrowButton)
        view.addSubview(titleLabel)
        
        guard let collectionView = leagueCollectionView else {
            return
        }
        collectionView.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.identifier, for: indexPath) as? LeagueCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: leagueViewModel[indexPath.row])
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        cell.layer.cornerRadius = cell.frame.size.height/2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView {
            let newVc = TeamDetailViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
    }
}
