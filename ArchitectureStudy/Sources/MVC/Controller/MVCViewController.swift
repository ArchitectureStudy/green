//
//  MVCViewController.swift
//  ArchitectureStudy
//
//  Created by Lee Junho on 2017. 1. 8..
//  Copyright © 2017년 Lee Junho. All rights reserved.
//

import UIKit

class MVCViewController: UIViewController {
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    fileprivate var repoIssueList: [IssueModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension MVCViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repoIssueList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MVCIssueCell", for: indexPath) as! MVCCollectionViewCell
        cell.issue = repoIssueList[indexPath.item]
        
        return cell
    }
}

extension MVCViewController {
    func updateRepoIssues() {
        repoIssueList = RepoModel.issueList
    }
}

extension MVCViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RepoModel(owner: "JakeWharton", repoName: "DiskLruCache").loadRepoIssues()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateRepoIssues),
                                               name: NSNotification.Name(rawValue: "RepoUpdated"),
                                               object: nil)
    }
}
