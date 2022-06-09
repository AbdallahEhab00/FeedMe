//
//  OfferCollectionViewCell.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 08/06/2022.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    static let reuseID     = "OfferCell"
    let categoryFoodLabel  = FMTitleLabel(textAlignment: .center, fontSize: 15, textColor: .black)
    let foodImageView      = FoodImageView(foodImage: "kfc")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    var offersCellViewModel : OfferCellViewModel? {
        didSet {
            categoryFoodLabel.text = offersCellViewModel?.disscount
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
        
    private func configure(){
        let padding:CGFloat = 8
        contentView.addSubview(foodImageView)
        contentView.addSubview(categoryFoodLabel)
        categoryFoodLabel.backgroundColor = .systemOrange
        categoryFoodLabel.alpha  = 0.3
        contentView.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 75),
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            foodImageView.heightAnchor.constraint(equalToConstant: 110),
            
            categoryFoodLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: padding),
            categoryFoodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            categoryFoodLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            categoryFoodLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
    }
    
    
}
