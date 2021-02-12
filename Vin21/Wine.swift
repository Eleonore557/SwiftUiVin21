//
//  Vine.swift
//  Vin21
//
//  Created by Ayari Eléonore on 10/02/2021.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift


struct Wine: Identifiable, Codable {
    @DocumentID var id: String?
    let title: String
    let producer: String
    let region: String
    let cepage: String
    let millesime: String
    let when: String
    let before: String
    let rating: Int
    let quantity: Int
    let comment: String
    let selectorIndexOfWine : Int

    
    static func test() -> Wine {
        Wine(
            id: .none,
            title: "",
            producer: "",
            region: "",
            cepage: "",
            millesime: "",
            when: "",
            before: "",
            rating: 0,
            quantity: 0,
            comment: "",
            selectorIndexOfWine: 0
       
        )
    }
}
