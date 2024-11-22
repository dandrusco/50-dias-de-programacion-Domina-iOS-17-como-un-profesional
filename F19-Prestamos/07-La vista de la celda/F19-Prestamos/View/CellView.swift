//
//  CellView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 22-11-24.
//

import SwiftUI

struct CellView: View {
    //1. Necesitamos una variable para poder representarla
    var loan: Loan
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, content: {
                //3. Pondremos el nombre del prestamista
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
                //4. Pondremos el pais
                Text(loan.country)
                    .font(.system(.subheadline, design: .rounded))
                //5. ponemos la descripcion
                Text(loan.use)
                    .font(.system(.caption, design: .rounded))
            })
            //6. Metemos un Spacer
            Spacer()
            
                //7. Ponemos el valor del prestamo
                Text("US \(loan.amount)")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.teal)
                    
        }
        //8. Agregaremos un padding
        .padding()
    }
}

#Preview {
    //2. Debemos crear una preview
    CellView(loan: Loan(name: "Danilo Andrusco", country: "Chile", use: "Para comprar un iPhone", amount: 999))
}
