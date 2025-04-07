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
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 130)
                    Text("PechinchaCat")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    NavigationLink(destination: Ganhos()) {
                        Image("ganhos")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 130, height: 150)
                            .padding(10)
                    }
                    NavigationLink(destination: Gastos()) {
                        Image("gastos")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 130, height: 150)
                            .padding(10)
                    }
                    NavigationLink(destination: Graficos()) {
                        Image("grafico")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .frame(width: 130, height: 150)
                            .padding(10)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
