//
//  ViewController.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit

class CompetitionViewController: UIViewController {
    
    var allCars: CompetitionResponse?
    var cars: [Compete]?
    
    var competitionViewModel = [CompetitionViewModel]()
    
    lazy var brandCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.collectionView?.isPagingEnabled = true
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 10, height: (view.frame.size.width/3) - 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CompetitionCollectionViewCell.self, forCellWithReuseIdentifier: CompetitionCollectionViewCell.identifier)
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = "Competitions"
        navigationController?.navigationBar.backgroundColor = .green
        
        addDefaultViews()
        populateCompetitionCollectionView()
    }
    
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
        view.addSubview(brandCollectionView)
//        constraintCollectionView()
    }
    
    func constraintCollectionView() {
        brandCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        brandCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        brandCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
    }
}

extension CompetitionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func populateCompetitionCollectionView() {
        NetworkService.shared.getAllCompetitions(completion: { [weak self] result in
            
            switch result {
            case .success(let data):
                
                self?.allCars = data
                self?.cars = self?.allCars?.competitions
                
                self?.competitionViewModel = (self?.cars?.compactMap({
                    CompetitionViewModel(
                        id: $0.id,
                        leagueName: $0.name,
                        country: $0.area.name,
                        date: $0.currentSeason?.startDate ?? " "
                    )}))!
                
                self?.brandCollectionView.reloadData()
            
            case .failure(let error):
                print("The error: \(error.localizedDescription)")
            }
        })}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return competitionViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompetitionCollectionViewCell.identifier, for: indexPath) as? CompetitionCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: competitionViewModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView {
            print("Hello")
            let newVc = LeagueViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
    }
    
}
