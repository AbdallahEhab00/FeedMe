//
//  FMBodyLabel.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 07/06/2022.
//

import UIKit

class FMBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment:NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        textColor                     = .black
        font                          = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth     = true
        minimumScaleFactor            = 0.75
        lineBreakMode                 = .byWordWrapping
    
    }

}
