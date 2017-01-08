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
    
    var issue: IssueModel? {
        didSet {
            self.titleLabel.text = issue?.issueTitle
        }
    }
}
