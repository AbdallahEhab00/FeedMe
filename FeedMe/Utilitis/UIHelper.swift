//
//  UIHelper.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 09/06/2022.
//

import UIKit

struct UIHelper {
    
    static func createColumnFlowLayout(view:UIView,itemSize:CGFloat)-> UICollectionViewFlowLayout{
        
        let width                             = view.bounds.width
        let padding: CGFloat                  = 12
        let minimumSpaceBetweenItem: CGFloat  = 10
        let availableWidth                    = width - (padding * itemSize) - (minimumSpaceBetweenItem * itemSize)
        let itemWidth                         = availableWidth / itemSize
        
        let flowLayout                        = UICollectionViewFlowLayout()
        flowLayout.sectionInset               = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                   = CGSize(width: itemWidth, height: itemWidth + 40)
        flowLayout.scrollDirection            = .horizontal
        return flowLayout
    }
}
