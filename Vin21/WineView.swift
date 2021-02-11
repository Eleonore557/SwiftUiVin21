//
//  WineView.swift
//  Vin21
//
//  Created by Ayari Eléonore on 10/02/2021.
//

import Foundation
import SwiftUI


struct WineView: View {
    
    let model: Model
//    let wine: Wine
    @State var title = ""
    @State var producer = ""
    @State var region = ""
    @State var cepage = ""
    @State var millesime = ""
    @State var when = ""
    @State var before = ""
    @State var rating = 0
    @State private var sleepAmount = 0
    @State private var comment: String = ""

    
    var body: some View {
//            Text(wine.title)
//            Button("Delete") {
//                guard let wineId = wine.id else { return }
//                model.deleteWine(id: wineId)
//            }
//            type: string, number: int, place: string, place: string, comment: string
//            Button("Ajouter un vin") {
//                let newWine = Wine(id: .none, title: title, producer: producer, region: region, millesime: millesime,cepage: cepage, when: when, before: before)
//                model.add(wine: newWine)
//            }.position(x: 60, y: -200)
           
            GroupBox {
                TextField("Nom", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Producteur", text: $producer)          .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Localisation", text: $region)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Cépage", text: $cepage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Millésime", text: $millesime)          .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("A boire", text: $when)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("A boire avant", text: $before)          .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
            }
        DropDownView()
            RatingView(rating: $rating)
            Stepper(value: $sleepAmount, in: 0...999999999) {
                Text("\(sleepAmount)")
                HStack {
                    Text("Commentaire")
                    TextField("Commentaire", text: $comment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                  
        }
       
    }
}
   

}
