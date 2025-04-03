//
//  Ganhos.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 02/04/25.
//

import SwiftUI

struct Ganhos: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 150)
                    
                }
                
            }
        }
    }
}

#Preview {
    Ganhos()
}
