//
//  Profile.swift
//  Campus Parking Pal (CPP)
//
//  Created by YUMirinBrah on 11/25/23.
//
import Foundation
import ParseSwift
struct Profile: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // Custom properties
    var user: User?
    var imageFile: ParseFile?
}

