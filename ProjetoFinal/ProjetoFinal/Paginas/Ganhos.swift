//
//  Gastos.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 02/04/25.
//

import SwiftUI

struct Ganhos: View {
    @State public var image = ["estado1", "estado2", "estado3"]
    @State public var irPraTela: Bool = false
    @State public var ganho: String = ""
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 90)
                    
                    ZStack{
                        Color(.white)
                            .padding()
                            .cornerRadius(30)
                        
                        VStack{
                            VStack {
                                TextField("Adicione aqui seus ganhos", text: $ganho)
                                    .padding(EdgeInsets(top: 50, leading: 50, bottom: 0, trailing: 50))
                                    .foregroundStyle(.black)
                                NavigationLink(destination: Graficos()){
                                    Text("Ver ganhos do último mês")
                                }
                            }
                            Divider()
                                .frame(width: 300)
                            Spacer()
                            Image("Oncinha")
                                .resizable()
                                .scaledToFit()
                            
                            Divider()
                                .frame(width: 300)
                            
                            VStack {
                                Button(action: { irPraTela = true }) {
                                    Text("Fale com Gato")
                                        .font(.title)
                                        .frame(width: 200, height: 60)
                                        .foregroundColor(.white)
                                        .background(Color("Principal"))
                                        .padding(EdgeInsets(top: 10, leading: 50, bottom: 0, trailing: 50))
                                }
                                NavigationLink("", destination:  HistoriadoGato(), isActive: $irPraTela)
                                
                                Text("PROPAGANDA")
                                    .frame(width: 300, height: 100)
                                    .background(Color(.gray))
                                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                                
                            }
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    Ganhos()
}
