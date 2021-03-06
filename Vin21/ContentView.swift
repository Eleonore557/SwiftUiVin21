//
//  ContentView.swift
//  Vin21
//
//  Created by Ayari Eléonore on 08/02/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model: Model
    
    // Etat définissant l'affichage de la vue de login
    @State var isShowingLogin: Bool
    
    
    @State var title = ""
    
    var body: some View {
        VStack {
            
            if (model.user?.email == .none) {
                Text("Tchin, User!")
                    .position(x:310)
            } else {
                Text("Tchin, \(model.user!.email!)!")
                    .position(x: 250, y: 0)
            }
            
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130.0, height: 50.0)
                .position(x: 60, y: 0)
            
            WineView(model: model)
            
//            List(model.wines) { wine in
//                WineView(model: model, wine: wine)
//            }

            Button("Sign Out") {
                model.signOut()
                
                // Sign Out sans Future
//                do {
//                    try Auth.auth().signOut()
//                    model.user = .none
//                } catch {
//                    print("Sign Out Error: \(error.localizedDescription)")
//                }
            }.padding()
            
        }
        
        // Observation de la valeur de model.user
        // Si user est défini, isShowingLogin prend la valeur false
        // Si user n'est pas défini, isShowingLogin prend la valeur true
        .onChange(of: model.user) { (user) in
            isShowingLogin = model.noSignedUser
        }
        
        // La vue LoginView est affichée par dessus VStack lorsque isShowingLogin est vrai
        .sheet(isPresented: $isShowingLogin) {
            LoginView(model: model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        return ContentView(model: model, isShowingLogin: model.noSignedUser)
    }
}
