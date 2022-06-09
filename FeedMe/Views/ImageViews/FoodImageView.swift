//
//  FoodImageView.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 07/06/2022.
//

import UIKit

class FoodImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(foodImage:String) {
        super.init(frame: .zero)
        self.image = UIImage(named: foodImage)
        configure()
    }
    
    private func configure() {
        contentMode = .scaleAspectFit
        layer.cornerRadius  = 10
        clipsToBounds       = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
