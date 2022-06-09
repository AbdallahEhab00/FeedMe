//
//  CategoryCollectionViewCell.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 07/06/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseID     = "CategoryCell"
    let categoryFoodLabel  = FMBodyLabel(textAlignment: .center)
    let foodImageView      = FoodImageView(foodImage: "korean")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
        
    private func configure(){
        let padding:CGFloat = 8
        contentView.addSubview(foodImageView)
        contentView.addSubview(categoryFoodLabel)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor    = .secondarySystemBackground
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            foodImageView.heightAnchor.constraint(equalToConstant: 100),
            
            categoryFoodLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: padding),
            categoryFoodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            categoryFoodLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            categoryFoodLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    
}

