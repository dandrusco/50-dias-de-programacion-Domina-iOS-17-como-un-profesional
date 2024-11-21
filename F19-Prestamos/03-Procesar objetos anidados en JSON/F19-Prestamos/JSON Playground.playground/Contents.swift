import UIKit

//1. Vamos a complicar mas aun el JSON, meteremos una localizarion, que contrantra el country (ya creado) y el idioma
let json = """
{
    "name" : "Juan Gabriel",
    "location" : {
        "country" : "Spain",
        "locale" : "ES"
    },
    "use" : "To build a beautiful school for poor children",
    "loan_amount" : 250
}
"""

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    //9. Meteremos la variable locale para poder extraerla tambien
    var locale: String
    
    enum CodingKeys: String, CodingKey {
        case name
        //2. Como es de esperar deberemos mapear el country
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    //3. Pero como la clave location esta anidada a country y locale, deberemos crear un enumerado
    enum LocationKeys: String, CodingKey {
        case country
        case locale
    }
    //4. Como es un mapeo directo necesitamos crear un constructor (inicilizador) para poder descodificarlos correctamente
    init(from decoder: Decoder) throws {
        //5. container intentara que el descodificador obtenga el contenedor a partir de la clave CodingKeys.self que son basicamente las claves del nivel superior del JSON
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //6. EN el caso del name lo saca del contenddor name y lo procesa de tipo string
        self.name = try container.decode(String.self, forKey: .name)
        //7. EN el caso del country no lo podemos extraer del contenedor original, por que les recuerdo que la tiene anidada, deberemos sacar la locationContainer invocando a nestedContainer (contenedor anidado) asociado a las claves LocationKeys para la clave country
        let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        //8. AHora si el country lo sacamos el locationContainer en formato exting de la clave country
        self.country = try locationContainer.decode(String.self, forKey: .country)
        //10. La extraimos
        self.locale = try locationContainer.decode(String.self, forKey: .locale)
        //11. En cuanto al user y amount mantememos la misma estructura
        self.use = try container.decode(String.self, forKey: .use)
        self.amount = try container.decode(Int.self, forKey: .amount)
    }
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    do {
        let loan = try decoder.decode(Loan.self, from: jsonData)
        print(loan)
    } catch {
        print(error)
    }
}
