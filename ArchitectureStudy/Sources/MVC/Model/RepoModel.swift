//
//  RepoModel.swift
//  ArchitectureStudy
//
//  Created by Lee Junho on 2017. 1. 8..
//  Copyright © 2017년 Lee Junho. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RepoModel {
    static var issueList: [IssueModel] = []
    
    var repoOwner: String = ""
    var repoTitle: String = ""
    
    init(owner: String, repoName: String) {
        self.repoOwner = owner
        self.repoTitle = repoName
    }
}

extension RepoModel {
    func loadRepoIssues() {
        Alamofire.request("https://api.github.com/repos/\(repoOwner)/\(repoTitle)/issues").responseJSON { response in
            guard let data = response.data else {
                return
            }
            
            RepoModel.issueList.removeAll()
            JSON(data: data).forEach { jsonObject in
                RepoModel.issueList.append(IssueModel(json: jsonObject.1))
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RepoUpdated"), object: nil)
        }
    }
}
