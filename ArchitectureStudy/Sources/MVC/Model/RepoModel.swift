//
//  RepoModel.swift
//  ArchitectureStudy
//
//  Created by Lee Junho on 2017. 1. 8..
//  Copyright © 2017년 Lee Junho. All rights reserved.
//

import Foundation
import Alamofire

class RepoModel {
    var repoOwner: String?
    var repoTitle: String?
    
    init(owner: String, repoName: String) {
        self.repoOwner = owner
        self.repoTitle = repoName
    }
}

extension RepoModel {
    func loadRepoIssues() {
        Alamofire.request("https://api.github.com/repos/\(repoOwner)/\(repoTitle)/issues").responseJSON { response in
            print("\(response.result.value)")
        }
    }
}
