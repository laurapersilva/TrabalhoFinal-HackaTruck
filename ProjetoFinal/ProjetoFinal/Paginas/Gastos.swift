//
//  Ganhos.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 02/04/25.
//

import SwiftUI

struct Gastos: View {
    
    @State private var sheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 100)
                    
                    ZStack{
                        Color(.white)
                            .padding()
                            .cornerRadius(30)
                        
                        VStack{
                            Button(action: { sheet = true }) {
                                Text("Adicionar gasto")
                                    .font(.title)
                                    .frame(width: 250, height: 70)
                                    .foregroundColor(.white)
                                    .background(Color("Principal"))
                                    .padding(EdgeInsets(top: 50, leading: 50, bottom: 0, trailing: 50))
                            }
                            .sheet(isPresented: $sheet) {
                                                print("Sheet dismissed!")
                                            } content: {
                                                AddGastoView()
                                            }
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct AddGastoView: View {
    @Environment(\.dismiss) private var dismiss

    @State var title: String = ""

    var body: some View {
        VStack() {
            Text("Adicione um novo gasto")
                .font(.system(size: 25))
                .scaledToFit()
            TextField(text: $title, prompt: Text("Nome do gasto")) {
                Text("Title")
            }

            HStack {
                Button("Cancelar") {
                    // Cancel saving and dismiss.
                    dismiss()
                }.foregroundStyle(Color(.red))
                
                Spacer()
                Button("Confirmo") {
                    // Save the article and dismiss.
                    dismiss()
                }.foregroundStyle(Color("Principal"))
            }
        }
            .padding(20)
            .frame(width: 300, height: 200)
    }
}

#Preview {
    Gastos()
}
