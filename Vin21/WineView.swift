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
    @State var quantity = 0
    @State var comment: String = ""
    @State var selectorIndexOfWine = 0
    @State var numbers = [Image("BouteilleDeVinRouge"), Image("BouteilleDeVinRose"), Image("BouteilleDeVinBlanc")]

    
    var body: some View {
       
        VStack{
            Text("Ajouter un Vin")
                .fontWeight(.bold)
                .font(.title)
            VStack {
                GroupBox{
                TextField("Nom", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Producteur", text: $producer)          .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Localisation", text: $region)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Cépage", text: $cepage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Millésime", text: $millesime)          .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack{
                    Text("Quantité:")
                Stepper(value: $quantity, in: 0...999999999) {
                    Text("\(quantity)")
                    }
                }
              
                Picker("Numbers", selection: $selectorIndexOfWine) {
                    ForEach(0 ..< numbers.count) { index in
                        self.numbers[index].tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            DropDownView()
            GroupBox{
                TextField("A boire", text: $when)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("A boire avant", text: $before)          .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack{
                    Text("Note:")
                    RatingView(rating: $rating)
                }
           
                }

                HStack {
                            Text("Commentaire:")
                            TextField("Commentaire", text: $comment)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                Button("Ajouter un vin") {
                    let newWine = Wine(id: .none, title: title, producer: producer, region: region, cepage: cepage, millesime: millesime, when: when, before: before, rating: rating, quantity: quantity, comment: comment, selectorIndexOfWine: selectorIndexOfWine)
                    model.add(wine: newWine)
                }.position(x: 300, y: 20)
        }
    }

