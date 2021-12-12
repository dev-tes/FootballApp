//
//  ViewController.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit
import CoreData

class CompetitionViewController: UIViewController {
    // MARK: Context for persistence purpose
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    // MARK: properties
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
    
    // MARK: view lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        addDefaultViews()
        navigationController?.isNavigationBarHidden = true
        populateCompetitionCollectionView()
        fetchPersistedData()
    }
}
