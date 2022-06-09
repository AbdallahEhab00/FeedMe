//
//  AdsCollectionViewCell.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 08/06/2022.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    static let reuseID     = "AdsCell"
    let foodImageView      = FoodImageView(foodImage: "mac")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
        
    private func configure(){
        contentView.addSubview(foodImageView)
        contentView.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            foodImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foodImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
    }
    
}
