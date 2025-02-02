//
//  PaymentFormViewModel.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 24-12-24.
//

import Foundation
import Combine

class PaymentFormViewModel : ObservableObject {
    
    //MARK: Datos del Formulario
    @Published var name = ""
    @Published var location = ""
    @Published var amount = ""
    @Published var type = PaymentCategory.expense
    @Published var date = Date.today
    @Published var notes = ""
    
    //MARK: Resultado de Validación
    @Published var isNameValid = false
    @Published var isAmountValid = true
    @Published var isNoteValid = true
    @Published var isFormValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(payment: PaymentRecord?){
        self.name = payment?.name ?? ""
        self.location = payment?.location ?? ""
        self.amount = "\(payment?.amount ?? 0.0)"
        self.notes = payment?.notes ?? ""
        self.type = payment?.type ?? .expense
        self.date = payment?.date ?? Date.today
        
        //1. Comenzaremos validar el nombre
        self.$name
            //2. Cuando recibamos de un suscriptor del programa principal
            .receive(on: RunLoop.main)
            //3. realizaremos un mapeo del nombre para ver si es valido o no
            .map { name in
                //4. Para que el   nombre sea valido debe terenr mas de 3 caracteres
                return name.count > 3
            }
            //5. Ese return nos devolvera un valir booleano que debemos asignar a la variable isNameValid
            .assign(to: \.isNameValid, on: self)
            //6. Con .store lo almacenamos, con una referencia (&) a cancellableSet
            .store(in: &cancellableSet)
        
       //7. Creamos la validacion del amount
        self.$amount
            .receive(on: RunLoop.main)
            .map { amount in
                //8. creamos un guard let para convertir el amount en double
                guard let validAmount = Double(amount) else{
                    //9. Si no lo podemos convertir devolvemos falso
                    return false
                }
                //10. Si pasamos la validacion sera un numero positivo
                return validAmount > 0
            }
            //11. lo asignamos en isAmountValid
            .assign(to: \.isAmountValid, on: self)
            .store(in: &cancellableSet)
        
        //12. Ahora las notas
        self.$notes
            .receive(on: RunLoop.main)
            .map { notes in
                //13. Las notas no deben superar los 150 caracteres
                return notes.count < 150
            }
            //14. lo asignamos a isNoteValid
            .assign(to: \.isNoteValid, on: self)
            .store(in: &cancellableSet)
        
        //15. Ahora debemos combinar estas 3 con CombineLatest3
        Publishers.CombineLatest3(self.$isNameValid, self.$isAmountValid, self.$isNoteValid)
            .receive(on: RunLoop.main)
            .map{ (isNameValid, isAmountValid, isNoteValid) in
                //16. Si las 3 son validas devolveremo true
                return isNameValid && isAmountValid && isNoteValid
            }
            //17. Se lo asignamos a isFormValid
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellableSet)
            //18. Nos vamos al PaymentFormView
    }
    
}
