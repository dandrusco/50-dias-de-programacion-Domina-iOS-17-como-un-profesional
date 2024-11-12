//
//  RegistrationViewModel.swift
//  F13-Registro
//
//  Created by Danilo Andrusco on 26-04-24.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject{
    @Published var username = ""
    @Published var password = ""
    @Published var passwordValidation = ""
    
    @Published var isUsernameLengthValid = false
    @Published var isPassordLengthValid = false
    @Published var isPassordCapitalValid = false
    @Published var isPassordConfirmedValid = false
    
    //1. Crearemos una octava variable quien sera la encargada de registrar los cambios automaticamente
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(){
        $username
            .receive(on: RunLoop.main)
            .map{ username in
                return username.count >= 6
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            //2. La funcion assing(to) devuelve siempre un objeto de tipo cancelable, por lo tanto ahora deveremos almacenar .store y que luego los podamos utlizarlos
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                return password.count >= 8
            }
            .assign(to: \.isPassordLengthValid, on: self)
            //3. Repetiremos lo mismo en las 3 advertencias
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                let pattern = "[A-Z]" //Si quisieramos que fuera digito seria asi [0-9]
                if let _ = password.range(of: pattern, options: .regularExpression){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPassordCapitalValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordValidation)
            .receive(on: RunLoop.main)
            .map { (password1, password2) in
                return !password1.isEmpty && !password2.isEmpty && (password1 == password2)
            }
            .assign(to: \.isPassordConfirmedValid, on: self)
            .store(in: &cancellableSet)
            //4. Ahora cada uno de los cambios seran almacenado en el conjunto de manera booleano (de acuerdo a lo que se devuelva dentro de las validaciones) 
    }
}
