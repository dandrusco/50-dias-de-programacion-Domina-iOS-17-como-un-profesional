import UIKit

//1. Que pasa si procesams un arrays en el JSON?. modificaremos el JSON
//2. EL objeto mas externo sera loans
//3. Creamos el Arrays de un solo elemento [{}]
//4. Creamos otra persona María Santos dentro del Arrays
//5. Osea que tenemos 2 prestamos dentro del JSON
let json = """
{
"loans":
[{
    "name" : "Juan Gabriel",
    "location" : {
        "country" : "Spain",
        "locale" : "ES"
    },
    "use" : "To build a beautiful school for poor children",
    "loan_amount" : 250
},
{
    "name" : "María Santos",
    "location" : {
        "country" : "Spain",
        "locale" : "ES"
    },
    "use" : "To show people how to code in Python",
    "loan_amount" : 150
}]
}
"""

//6. Deberemnos crear otra estructura para la coleccion de los prestamos
struct LoanFactory : Codable {
    var loans: [Loan]
}

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    var locale: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    enum LocationKeys: String, CodingKey {
        case country
        case locale
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try locationContainer.decode(String.self, forKey: .country)
        self.locale = try locationContainer.decode(String.self, forKey: .locale)
        self.use = try container.decode(String.self, forKey: .use)
        self.amount = try container.decode(Int.self, forKey: .amount)
    }
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    do {
        //7. Aqui descodificabamos un solo prestamo loan, por lo tanto deberemos ahora descodificarlos todos (LoanFactory) en la consntante loanFactory
        let loanFactory = try decoder.decode(LoanFactory.self, from: jsonData)
        //8. Medificaremos el print y le damos en play
        /*print(LoanFactory)*/
        //9. Para poder ver linea a linea comentaremos el print y lo meteremos en un for
        for loan in loanFactory.loans {
            print(loan)
        }
    } catch {
        print(error)
    }
}
