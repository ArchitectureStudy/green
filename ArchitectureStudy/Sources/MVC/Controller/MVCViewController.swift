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
}

extension MVCViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MVCIssueCell", for: indexPath) as! MVCCollectionViewCell
        
        return cell
    }
}

extension MVCViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: indexPath)
    }
}

extension MVCViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "ShowDetail" {
            guard let indexPath = sender as? IndexPath else {
                return
            }
            
            let vc = segue.destination as! IssueDetailViewController
        }
    }
}
