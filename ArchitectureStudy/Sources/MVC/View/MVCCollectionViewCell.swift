//
//  MVCCollectionViewCell.swift
//  ArchitectureStudy
//
//  Created by Lee Junho on 2017. 1. 8..
//  Copyright © 2017년 Lee Junho. All rights reserved.
//

import UIKit

class MVCCollectionViewCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var subtitleLabel: UILabel!
    
    var issue: IssueModel? {
        didSet {
            titleLabel.text = issue?.title
            subtitleLabel.text = "#\(issue?.number ?? 0) opened on \(issue?.createdDate ?? "") by \(issue?.user ?? "")"
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        var targetSize = layoutAttributes.bounds.size
        targetSize.width = UIScreen.main.bounds.width
        
        layoutAttributes.bounds.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriorityRequired, verticalFittingPriority: UILayoutPriorityDefaultLow)
        
        return layoutAttributes
    }
}
