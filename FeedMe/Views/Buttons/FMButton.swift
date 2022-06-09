//
//  FMButton.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 07/06/2022.
//

import UIKit

class FMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundImage:String) {
        super.init(frame: .zero)
        setImage(UIImage(named: backgroundImage), for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius = 10
        imageView?.contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
    }
    

}
