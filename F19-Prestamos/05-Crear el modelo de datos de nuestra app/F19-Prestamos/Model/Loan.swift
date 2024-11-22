//
//  Loan.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

import Foundation

//2. Creamos una estructura de tipo Identifiable
struct Loan: Identifiable {
    var id = UUID()
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    //3. Creamos el constructor
    init(name: String, country: String, use: String, amount: Int) {
        self.name = name
        self.country = country
        self.use = use
        self.amount = amount
    }
}

//4. Una buena practica es separar el modelo de datos, de las funcionalidades, por lo tanto ahora meteremos una extencion para el protocolo Codable
extension Loan: Codable{
    //5. Meteremos el enumerado
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    
    //6. Creamos el segundo enumeroado para las LocationKeys, pero en esta prueba solo nos meteremos en el country dejando afuera el locale
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    //7. Creamos el inicializador
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try locationContainer.decode(String.self, forKey: .country)
        self.use = try container.decode(String.self, forKey: .use)
        self.amount = try container.decode(Int.self, forKey: .amount)
    }
}
//8. Crearemos un nuevo fichero Swift File dentro del Model llamado LoanFactory, quien sera la encargada de conectar a la Api de un sitio web
