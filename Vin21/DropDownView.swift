//
//  DropDownView.swift
//  Vin21
//
//  Created by Ayari Eléonore on 11/02/2021.
//

import SwiftUI

struct DropDownView: View {
    var body: some View {
        VStack() {
            HStack {
                DropDown()
            }
        }
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView()
    }
}

struct DropDown: View {
    @State var expand = false
    var body: some View {
        VStack(spacing: 30) {
            HStack() {
                Text("Menu")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 13, height: 6)
                    .foregroundColor(.black)
            }.onTapGesture {
                self.expand.toggle()
            }
            if expand {
                Button(action: {
                    print("1")
                    self.expand.toggle()
                    
                }) {
                    Text("Profile")
                        .padding()
                }.foregroundColor(.black)
            }
        }
    }
}
