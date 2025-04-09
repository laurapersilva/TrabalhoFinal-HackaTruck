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
                    
                    VStack {
                        HStack {
                            NavigationLink(destination: Ganhos()) {
                                Image("ganhos")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 130)
                                    .padding(5)
                            }
                            NavigationLink(destination: Gastos()) {
                                Image("gastos")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 130)
                                    .padding(5)
                            }
                        }
                        
                        HStack {
                            NavigationLink(destination: Graficos()) {
                                Image("grafico")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 130)
                                    .padding(5)
                            }
                            
                            NavigationLink(destination: Graficos()) {
                                Image("taxas")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 130)
                                    .padding(5)
                            }
                        }
                    }.padding(EdgeInsets(top: 50, leading: 40, bottom: 40, trailing: 40))
                    
                }
                
            }
        }.tint(.white)
    }
}

#Preview {
    ContentView()
}
