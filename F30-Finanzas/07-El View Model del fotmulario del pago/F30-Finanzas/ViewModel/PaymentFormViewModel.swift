//
//  PaymentFormViewModel.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 24-12-24.
//

import Foundation
//2. Importamos Combine para la validacion
import Combine

//3. creamos la clase PaymentFormViewModel de tipo ObservableObject
class PaymentFormViewModel : ObservableObject {
    
    //4. Creamos las variables que seran bindeables, por lo tanto deben ser @Published
    //MARK: Datos del Formulario
    @Published var name = ""
    @Published var location = ""
    @Published var amount = ""
    //5. El tipo de pago por defecto seran gastos
    @Published var type = PaymentCategory.expense
    //6. La fecha por defecto sera el dia de hoy
    @Published var date = Date.today
    @Published var notes = ""
    
    //7. Del mismo modo necesitamos las variables de validacion de ingreso de datos
    //MARK: Resultado de Validación
    @Published var isNameValid = false
    @Published var isAmountValid = true
    @Published var isNoteValid = true
    @Published var isFormValid = false
    
    //8. Creamos la variable privada cancellableSet de tipó AnyCancellable con un arrays vacio
    private var cancellableSet: Set<AnyCancellable> = []
    
    //9. ¿Quienes seran los suscriptores?, sera el PaymentFormView, nos vamos para alla...
    
    //12. Creamos el init para el payment de tipo PaymentFormViewModel opcional
    init(payment: PaymentRecord?){
        //13. El nombre, la location y las notes, como es opcional lo dejamos como string vacio
        self.name = payment?.name ?? ""
        self.location = payment?.location ?? ""
        //14. EN el caso del amount como es de tipo Double, lo dejaremos como 0.0
        self.amount = "\(payment?.amount ?? 0.0)"
        self.notes = payment?.notes ?? ""
        //15. El tipo por defecto sera gastos
        self.type = payment?.type ?? .expense
        //16. Y la fecha sera por defecto el dia de hoy
        self.date = payment?.date ?? Date.today
        //17. Ahora nuevamente nos vamos al PaymentFormView
    }
    
}
