//
//  ViewController.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit

class CompetitionViewController: UIViewController {
    
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
        collectionView.register(CompetetionCollectionViewCell.self, forCellWithReuseIdentifier: CompetetionCollectionViewCell.identifier)
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
    }
    
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
        view.addSubview(brandCollectionView)
    }
}

extension CompetitionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompetetionCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
}
