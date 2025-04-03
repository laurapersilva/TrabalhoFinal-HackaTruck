//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 02/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("Image")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 150)
                    Spacer()
                    
                    NavigationLink(destination: Gastos()) {
                        Image("quadrado")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 180, height: 180)
                    }
                    NavigationLink(destination: Ganhos()) {
                        Image("quadrado")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 180, height: 180)
                    }
                    NavigationLink(destination: Graficos()) {
                        Image("quadrado")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 180, height: 180)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
