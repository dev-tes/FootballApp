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
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 4, height: (view.frame.size.width/3) - 4)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CompetitionCollectionViewCell.self, forCellWithReuseIdentifier: CompetitionCollectionViewCell.identifier)
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .green
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Competitions"
        addDefaultViews()
        populateCompetitionCollectionView()
    }
    
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
        view.addSubview(brandCollectionView)
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
            
//            DispatchQueue.main.async {
//                self?.brandCollectionView.reloadData()
//            }
        
        })}
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return competitionViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompetitionCollectionViewCell.identifier, for: indexPath) as? CompetitionCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: competitionViewModel[indexPath.row])
        return cell
    }
    
}
