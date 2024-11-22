//
//  FilterView.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 22-11-24.
//

//1. Crearemos un slider para poder movernos entre el valor minimo y maximo
import SwiftUI

struct FilterView: View {
    
    //2. Creamos un Binding para el valor maximo
    @Binding var maxLoan: Double
    
    //3. Creamos el valor minimo y maximo
    var minAmount = 0.0
    var maxAmount = 1000.0
    
    var body: some View {
        VStack(alignment: .leading, content: {
            //5. Agregamos un texto con el valor
            Text("Filtrar préstamos con valor inferior a \(Int(self.maxLoan)) €")
                .font(.system(.title2, design: .rounded))
                .bold()
            
            HStack{
                //6. Meteremos el texto del valor minimo
                Text("\(Int(minAmount))")
                    .font(.system(.callout, design: .rounded))
                //7. Creamos el Slider con maxLoan que contenga el valor minimo y maximo que vaya de 50 en 50
                Slider(value: self.$maxLoan, in: minAmount...maxAmount, step: 50)
                    .accentColor(.teal)
                //8. Meteremos el texto del valor maximo
                Text("\(Int(maxAmount))")
                    .font(.system(.callout, design: .rounded))
            }
        })
        //9. Creamos el paddung para linearlo
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
    }
}

#Preview {
    //4. Creamos una contante para mostrar el valor de la preview (no lo podremos mover desde el emulador del iphone
    FilterView(maxLoan: .constant(600))
}
