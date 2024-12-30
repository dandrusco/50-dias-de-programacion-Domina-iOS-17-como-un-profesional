//
//  PaymentDetailViewModel.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 30-12-24.
//

import Foundation

//3. Creamos la estructura
struct PaymentDetailViewModel {
    //4. Para mostrar la estructura de un pago necesitaremos un pago
    var payment: PaymentRecord
    
    //5. Creamos el nombre de tipo String que devolveremos el nombre
    var name: String {
        return self.payment.name
    }
    //6. Creamos para la fecha, devolviendo la fecha de tipo string
    var date: String {
        return self.payment.date.string()
    }
    //7. La direccion como opcional
    var location: String {
        return self.payment.location ?? ""
    }
    //8. Pondremos la imagen
    var image: String = "money"
    //9. para el icono con el nombre en formato string
    var typeIcon: String {
        
        let icon : String
        //10. Creamos un switch para ver si es ingreso o gasto
        switch self.payment.type {
        case .expense:
            icon = "arrowshape.down.circle.fill"
        case .income:
            icon = "arrowshape.up.circle.fill"
        }
        return icon
    }
    
    //11. La cantidad tambien sera del tipo string
    var amount: String {
        //12. Creamos el valor a partir de la funcion currency pasandole el payment.amount
        let amountValue = NumberFormatter.currency(from: self.payment.amount)
        //13. formatearemos el valor, si es .income(ingreso) me metemos el signo +, de lo contrario el digno -
        let formattedValue = (self.payment.type == .income ? "+" : "-") + amountValue
        //14. lo devolvemos
        return formattedValue
    }
    //15. Las notas son String opcional
    var notes: String {
        return self.payment.notes ?? ""
    }
    
    //16. en el init recibiremos el PaymentRecord y se lo asignamos a la variable payment
    init(payment: PaymentRecord) {
        self.payment = payment
    }
}
//17. En la carpeta View seleccionaremos un nuevo fichero de swiftUI y lo llamaremos PaymentDetailView
