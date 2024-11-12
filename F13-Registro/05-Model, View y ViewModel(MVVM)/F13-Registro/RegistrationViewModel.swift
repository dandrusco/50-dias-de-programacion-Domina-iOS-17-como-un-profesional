//
//  RegistrationViewModel.swift
//  F13-Registro
//
//  Created by Danilo Andrusco on 26-04-24.
//

import Foundation
//3. importaremos Combine
import Combine

//4. Crearemos la clase que sea del tipo ObservableObject
class RegistrationViewModel: ObservableObject{
    //3. Aqui dentro tendra entreda como:
    @Published var username = ""
    @Published var password = ""
    @Published var passwordValidation = ""
    
    //4. Tendra salidas que seran validaciones
    @Published var isUsernameLengthValid = false
    @Published var isPassordLengthValid = false
    @Published var isPassordCapitalValid = false
    @Published var isPassordConfirmedValid = false
    
    //5. Como se puede apreciar cada propiedades se componen de @Published por que queremos notificar a los susciptores, en nuestro caso las vistas para que puedan abrir o cerrar los candados
    
    //6. Si se preguntan por que no utilizamos un @State, es por que estos son utilizados principalmente para almacenar datos que son especificos de una vista y que pueden cambiar durante el ciclo de vida de esa vista
    
    //7. En cambio @Published se utilizara en clases observables y se utiliza para marcar propiedades cuyos cambios deberian ser anunciados a cualquer vista de que este observando esa clase. Se utiliza comunmente en el MVVM para la comunicacion entre el modedo y la vista
    
    //8. En resumen, @State se usa principalmente para gestionar el estado interno de una vista, mientras que @Published se utiliza para propagar cambios desde un objeto observable a las vistas que lo observan.
}
