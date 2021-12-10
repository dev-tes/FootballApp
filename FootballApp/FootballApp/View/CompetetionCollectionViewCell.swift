//
//  CompetetionCollectionViewCell.swift
//  FootballApp
//
//  Created by  Tes on 10/12/2021.
//

import UIKit

class CompetetionCollectionViewCell: UICollectionViewCell {
    static let identifier = "CompetetionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
