//
//  Gastos.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 02/04/25.
//

import SwiftUI

struct Gastos: View {
    @State public var ganho: String = "
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("Image")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 100)
                    
                    ZStack{
                        Color(.white)
                            .padding()
                            .cornerRadius(30)
                        VStack{
                            TextField("Meus ganhos", text: $ganho)
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    Gastos()
}
