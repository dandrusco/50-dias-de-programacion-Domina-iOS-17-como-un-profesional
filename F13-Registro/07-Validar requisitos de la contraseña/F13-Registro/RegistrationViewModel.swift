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
    
    init(){
        $username
            .receive(on: RunLoop.main)
            .map{ username in
                return username.count >= 6
            }
            .assign(to: \.isUsernameLengthValid, on: self)
        
        //1. Ahora tendremos  que crear un suscriptor para la clave
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                return password.count >= 8
            }
            .assign(to: \.isPassordLengthValid, on: self)
        
        //2. Ahora crearemos para la validacion si la clave tiene una mayuscula
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                //3. Deberemos utilizar una expresion regular para validar que al menos tenga una mayuscula
                let pattern = "[A-Z]" //Si quisieramos que fuera digito seria asi [0-9]
                //4. Localizaremos si nuestra password contiene los caracteres de dentro de nuestro patron de busqueda
                if let _ = password.range(of: pattern, options: .regularExpression){
                    //5. Si se cumple devolveremos true
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPassordCapitalValid, on: self)
        
        //6. Ahora necesitamos contrastar el valor de diferenctes @Published ya que una se guardara en password y la otra en passwordValidation y necesitamos ver que ambos sean iguales
        Publishers.CombineLatest($password, $passwordValidation)
            .receive(on: RunLoop.main)
            //7. El map debera ser una tupla con las dos claves
            .map { (password1, password2) in
                //8. Comprovaremos que ambas claves NO esten vacias y que ademas password1 sea igual a la password2
                return !password1.isEmpty && !password2.isEmpty && (password1 == password2)
            }
            .assign(to: \.isPassordConfirmedValid, on: self)
    }
}
