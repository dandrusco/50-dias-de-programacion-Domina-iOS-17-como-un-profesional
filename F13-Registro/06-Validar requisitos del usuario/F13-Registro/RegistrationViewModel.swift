//
//  RegistrationViewModel.swift
//  F13-Registro
//
//  Created by Danilo Andrusco on 26-04-24.
//


//1. Hasta ahora tenemos una pantalla donde el usuario pondra su nombre de usuario
//2. cada tecla que el usuario va introduciondo la @Published var username es la encargada de agisnar el valor a dicha variable
//3. Y tambien a la @Published var isUsernameLengthValid = false quien pasara de false a true dependiendo si se cumple o no con los requisitos para que sea un nombre valido
//4. Por lo tanto ahora tenemos que unir tanto username como isUsernameLengthValid para que se pueda comprobar y asi devolver la validacion

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
    
    //5. Para ello crearemos un inicializador para conectar dichas variables
    init(){
        //6. En el caso del nombre de usuario: cuando el useername reciva en el hilo de ejecucion principal (RunLoop.main) el tecleo de letras o caracteres
        $username
            .receive(on: RunLoop.main)
            //7. Ahora lo vamos a mapear, tomando el texto escrito en la variable username
            .map{ username in
                //8. Ahora lo devolveremos como True si el si el valor del username es igual o mayor a 6 caracteres, de lo contrario devolveremos False
                return username.count >= 6
            }
            //9. Ya sea True o False se lo deberemos asignar a nuestra variable de validacion que es isUsernameLengthValid en el propio objeto (self)
            .assign(to: \.isUsernameLengthValid, on: self)
    }
}
