//
//  IssueModel.swift
//  ArchitectureStudy
//
//  Created by Lee Junho on 2017. 1. 8..
//  Copyright © 2017년 Lee Junho. All rights reserved.
//

import Foundation
import SwiftyJSON

class IssueModel {
    var id: Int?
    var title: String?
    var number: Int?
    var htmlURL: String?
    var state: String?
    var user: String?
    var createdDate: String?
    var updatedDate: String?
    var closedDate: String?
    
    fileprivate var dateFormatter: DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            
            return formatter
        }
    }
    fileprivate var created_at: Date? {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = NSLocalizedString("날짜포맷", tableName: "Strings", comment: "")
            createdDate = (created_at != nil) ? formatter.string(from: created_at!) : ""
        }
    }
    fileprivate var updated_at: Date? {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = NSLocalizedString("날짜포맷", tableName: "Strings", comment: "")
            updatedDate = (updated_at != nil) ? formatter.string(from: updated_at!) : ""
        }
    }
    fileprivate var closed_at: Date? {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = NSLocalizedString("날짜포맷", tableName: "Strings", comment: "")
            closedDate = (closed_at != nil) ? formatter.string(from: closed_at!) : ""
        }
    }
    
    init(json: JSON) {
        parseObject(json: json)
    }
}

extension IssueModel {
    fileprivate func parseObject(json: JSON) {
        print("\(json)")
        self.id = json["id"].int
        self.title = json["title"].string
        self.number = json["number"].int
        self.htmlURL = json["html_url"].string
        self.state = json["state"].string
        self.user = json["user"]["login"].string
        self.created_at = dateFormatter.date(from: json["created_at"].string ?? "")
        self.updated_at = dateFormatter.date(from: json["updated_at"].string ?? "")
        self.closed_at = dateFormatter.date(from: json["closed_at"].string ?? "")
    }
}
