import UIKit

//1. Vamos a cambiar el nombre de amount por loan_amount, si le damos en play vemos que nos da un error ya que en la estructura el nombre solicita var amount: Int
let json = """
{
    "name" : "Juan Gabriel",
    "country" : "Spain",
    "use" : "To build a beautiful school for poor children",
    "loan_amount" : 250
}
"""

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    //2. Para evitar esto y poder poner el nombre que nosostros queramos, deberemos crear un enumerado para crear un mapeo
    //3. Crearemos el enumerado llamado CodingKeys que utilizara claves de tipo String y conformado al protocolo CodingKey
    enum CodingKeys: String, CodingKey {
        //4. Si es el mimso nombre no le ponemos nada mas
        case name
        case country
        case use
        //5. En el caso de cambiar deberemos especificarselo
        case amount = "loan_amount"
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
