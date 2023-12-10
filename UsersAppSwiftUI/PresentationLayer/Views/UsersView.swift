//
//  UsersView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    
    struct Bla: Identifiable{
        let id = UUID().uuidString
        let name: String
    }
    
    @State private var array: [Bla] = [Bla(name: "blah"), Bla(name: "blah")]
    
    var body: some View {
        
        NavigationStack {
            buttonView
            List {
                ForEach(array, id: \.id) { item in
                    NavigationLink {
                        Text("\(item.name)")
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("\(item.name)")
                        }
                    }
                    .padding()
                }
                .listRowBackground(
                    LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .leading, endPoint: .trailing)
                )
            }
            .padding()
            .listStyle(.plain)
            .navigationBarTitle("Users")
        }
    }
}

#Preview {
    UsersView()
}

extension UsersView {
    private var buttonView: some View {
        Button(action: {
            
        }, label: {
            Text("Click to download users")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.gray)
        })
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(10)
        .padding()
        .shadow(radius: 15)
    }
}
