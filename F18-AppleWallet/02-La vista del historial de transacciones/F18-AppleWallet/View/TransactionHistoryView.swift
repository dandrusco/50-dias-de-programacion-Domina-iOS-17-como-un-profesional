//
//  TransactionHistoryView.swift
//  F18-AppleWallet
//
//  Created by Danilo Andrusco on 12-11-24.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    //2. Crearemos un arrays de transacciones
    var currentTransactions: [Transaction]
    
    var body: some View {
        //3. Configuraremos la pantalla
        VStack() {
            Text("Historial de transacciones")
            //6. Ahora que ya podemos ver la preview continuaremos creando la pantlla
                .font(.system(size: 22, weight: .black, design: .rounded))
                .foregroundStyle(.teal)
                .padding()
            //7. Crearemos una ScrollView horizontal y ocultaremos la barra
            ScrollView(.horizontal, showsIndicators: false) {
                //8. Meteremos una HStack con un spacing de 24 puntos, contendra un ForEach para ver las transacciones del merchant
                HStack (spacing: 24) {
                    ForEach(currentTransactions) {
                        transaction in
                        //13. Ahora reemplazamos este texto
                        /*Text(transaction.merchant)*/
                        TransactionView(transaction: transaction)
                    }
                }
                //14. AL finalizar la scrollview meteremos un pading
                .padding()
            }
        }
    }
}

//9. Creamos una structura para cada uno de los pagos
struct TransactionView: View {
    //10. Creamos una variable para las transacciones
    var transaction: Transaction
    
    //11. Creamos el body
    var body: some View {
        //15. Meteremos las tarjetas en un RoundedRectangle
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.teal)
            .overlay(
                //16. Creamores un VStac y meteremos el texto que ya creamos
                VStack() {
                    //23. Y uno aca para que todo quede centrado
                    Spacer()
                    //18. Meteremos los iconos
                    Image(systemName: transaction.icon)
                        .font(.system(size: 40))
            //12. Por ahora meteremos este texto
                    Text(transaction.merchant)
                    //19 Enchulamos el texto
                        .font(.system(.title3, design: .rounded))
                        .bold()
                    
                    //20. Formatearemos un texto para poner los valores
                    Text("\(String(format: "$%.2f", transaction.amount))")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(8)
                    
                    //21. Pondremos la fecha
                    Text(transaction.date)
                        .font(.system(.caption, design: .rounded))
                    
                    //22. Meteremos un Spacer al final
                    Spacer()
                }
                //24. Cambiaremos el color
                    .foregroundStyle(.white)
            )
        //17. Crearemos un frame de 200X200
            .frame(width: 200, height: 200)
    }
}

//4. A la previe le pondremos un titulo para diferenciarla en la Preview
#Preview("Historial de transacciones") {
    //5. Le pasaremos la currentTransactions con las transactions
    TransactionHistoryView(currentTransactions: transactions)
}
