//
//  BlankView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 23-12-24.
//

import SwiftUI

struct BlankView: View {
    
    //2. Creamos una variable de tipo color
    var bgColor: Color
    
    var body: some View {
        //3. Pondremos una VStack seguido de un Spacer
        VStack{
            Spacer()
        }
        //4. Configuramos el frame
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.bgColor)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    //5. Para poder probarla le pasamos al bgColor, el color ue estimemos conveniente
    BlankView(bgColor: .teal)
    //6. Nos sigue dado error ya que deberemos arreglar la ContentView
}
