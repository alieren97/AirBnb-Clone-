//
//  User.swift
//  AirBnbClone
//
//  Created by Ali Eren on 24.10.2022.
//

import Foundation
import FirebaseFirestoreSwift

struct UserModel:Identifiable, Codable {
    @DocumentID public var id: String?
    let email: String
    let password: String
    
}
