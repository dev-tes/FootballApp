//
//  ViewController.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit
import CoreData

class CompetitionViewController: UIViewController {
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    var allCars: CompetitionResponse?
    var cars: [Compete]?
    var persistedData: [FootballApp]?
    
    var competitionViewModel = [CompetitionViewModel]()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Competitions"
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        addDefaultViews()
        navigationController?.isNavigationBarHidden = true
        populateCompetitionCollectionView()
        fetchPersistedData()
    }
    
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
        view.addSubview(brandCollectionView)
        view.addSubview(titleLabel)
        view.addSubview(firstView)
        constraintCollectionView()
    }
    
    func constraintCollectionView() {
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        firstView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        brandCollectionView.anchorWithConstantsToTop(top: firstView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
}

//extension CompetitionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func fetchPersistedData() {
//        do {
//            self.persistedData = try context?.fetch(FootballApp.fetchRequest())
//            DispatchQueue.main.async {
//                self.brandCollectionView.reloadData()
//            }
//        }
//        catch {
//            
//        }
//    }
//    
//    func populateCompetitionCollectionView() {
//        NetworkService.shared.getAllCompetitions(completion: { [weak self] result in
//            
//            switch result {
//            case .success(let data):
//                
//                self?.allCars = data
//                self?.cars = self?.allCars?.competitions
//                
//                self?.persistedData = (self?.cars?.compactMap({
//                    let newPersistenceData = FootballApp(context: self?.context ?? NSManagedObjectContext())
//                    
//                    newPersistenceData.id = Int32($0.id)
//                    newPersistenceData.leagueName = $0.name
//                    newPersistenceData.country = $0.area.name
//                    newPersistenceData.startDate = $0.currentSeason?.startDate
//                    
//                    do {
//                        try self?.context?.save()
//                    }
//                    catch {
//                    }
//                    self?.fetchPersistedData()
//                    return newPersistenceData
//                }))!
//                self?.competitionViewModel = (self?.persistedData?.compactMap({
//                    CompetitionViewModel(
//                        id: $0.id,
//                        leagueName: $0.leagueName ?? "Premier League ",
//                        country: $0.country ?? "England",
//                        date: $0.startDate ?? "11 May, 2019"
//                    )}))!
//                
//                self?.brandCollectionView.reloadData()
//                
//            case .failure(let error):
//                
//                // MARK:  configure our viewmodel with what is in persistence
//                self?.competitionViewModel = (self?.persistedData?.compactMap({
//                    CompetitionViewModel(
//                        id: $0.id,
//                        leagueName: $0.leagueName ?? "Premier League ",
//                        country: $0.country ?? "England",
//                        date: $0.startDate ?? "11 May, 2019"
//                    )
//                }))!
//                
//                // MARK: display it
//                DispatchQueue.main.async {
//                    self?.brandCollectionView.reloadData()
//                }
//                print("The error: \(error.localizedDescription)")
//            }
//        })}
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return competitionViewModel.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompetitionCollectionViewCell.identifier, for: indexPath) as? CompetitionCollectionViewCell else { return UICollectionViewCell() }
//        cell.configure(with: competitionViewModel[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == collectionView {
//            print("Hello")
//            let newVc = LeagueViewController()
//            navigationController?.pushViewController(newVc, animated: true)
//        }
//    }
//}
