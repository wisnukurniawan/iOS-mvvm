//
//  Profile.swift
//  TableViewExample
//
//  Created by Wisnu on 3/1/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class Profile {
    var fullName: String?
    var pictureUrl: String?
    var email: String?
    var about: String?
    var friends = [Friend]()
    var profileAttributes = [Attribute]()
    
    init?(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? JSONDictionary, let body = json["data"] as? JSONDictionary {
                self.fullName = body["fullName"] as? String
                self.pictureUrl = body["pictureUrl"] as? String
                self.about = body["about"] as? String
                self.email = body["email"] as? String
                if let friends = body["friends"] as? [JSONDictionary] {
                    self.friends = friends.map { Friend(json: $0) }
                }
                if let profileAttributes = body["profileAttributes"] as? [JSONDictionary] {
                    self.profileAttributes = profileAttributes.map { Attribute(json: $0) }
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
    }
    
}
