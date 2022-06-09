//
//  FMTitleLabel.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 07/06/2022.
//

import UIKit

class FMTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment:NSTextAlignment,fontSize:CGFloat,textColor:UIColor) {
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.textColor      = textColor
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure (){
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth       = true
        minimumScaleFactor              = 0.8
        lineBreakMode                   = .byTruncatingTail
     
    }
}
