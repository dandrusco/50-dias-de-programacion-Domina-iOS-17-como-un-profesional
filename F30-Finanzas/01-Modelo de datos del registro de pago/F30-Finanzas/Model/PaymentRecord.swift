//
//  Item.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//

//4. Este codigo lo proporciona Swift, le vamos a realizar algunos cambios
import Foundation
import SwiftData

//6. Como podemos registrar ingresos o pagos, vamos a crear un enumerado
enum PaymentCategory: Int{
    case income = 0 // Ingresos
    case expense = 1 // Gastos
}

//5. Vamos a cambiar el nombre de Item por PaymentRecord (Boton derecho sobre Item, Refactor -> Rename), el final lo eliminaremos ya que no queremos que sea constante, por lo tanto lo dejaremos @Model class, en una sola linea
@Model class PaymentRecord {
    //6. Eliminamos todas la lineas que trar por defecto y comenzaremos a programar los atributos
    /*var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }*/
    
    //7. EL primer atributo sera para el model, tomando la clave primara para identificar el pago
    @Attribute(.unique) var paymentID: UUID
    //8. Creamos las variables neccesarias
    var date: Date // Fecha
    var name: String // Nombre de la transaccion
    var location: String? // La localidad donde hemos realizado la transaccion por ejemplo Frogames
    var amount: Double // La cantidad de la transaccion
    var notes: String? // Observacion adicional
    //9. Para el tipo de pago lo guardaremos como @Transient de tipo PaymentCategory
    @Transient var type: PaymentCategory {
        //10. En el get generamos nostros mismo un valor en crudo, dado por convertir entero de la variable typeNum, de lo contrario por defecto sera de gasto
        get {
            PaymentCategory(rawValue: Int(self.typeNum)) ?? .expense
        }
        //11. En el Set hacemos lo mismo convertimos en numero enterio el valor del rawValue
        set{
            self.typeNum = Int(newValue.rawValue)
        }
    }
    //12. Vamos a convertir el typeNum, asociado a @Attribute, sera llamado como type ya que esta asociado a la variable type del @Transient, la variable la llamaremos typeNum asociada al valor en crudo del PaymentCategory
    @Attribute(originalName: "type") var typeNum: PaymentCategory.RawValue
    
    //13. Debemos crear el inicializador
    init(paymentID: UUID = UUID(), date: Date, name: String, location: String? = nil, amount: Double, notes: String? = nil, type: PaymentCategory) {
        self.paymentID = paymentID
        self.date = date
        self.name = name
        self.location = location
        self.amount = amount
        self.notes = notes
        self.typeNum = Int(type.rawValue)
        self.type = type
    }
}
//14. Nos vamos al archivo F30_FinanzasApp
