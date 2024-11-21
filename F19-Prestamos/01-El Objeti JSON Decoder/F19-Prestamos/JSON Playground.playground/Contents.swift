import UIKit

//2. Crearemos una constante de json
let json = """
{
    "name" : "Juan Gabriel",
    "country" : "Spain",
    "use" : "To build a beautiful school for poor children",
    "amount" : 250
}
"""

//3. Crearemos una estructura para los prestamos que sea de tipo Codable para que pueda codificar o decodificar este formato JSON
struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
}

//4. Ahora es el turno de descodificarlo que hjara una instancia a la clase JSONDecoder
let decoder = JSONDecoder()

//5. Creamos el opcional banding utilizando la decodificacion con el protocolo utf8
if let jsonData = json.data(using: .utf8) {
    //6. Si somos capaza de decodificar el JSON obtenido ejecutaremos un DO (intenta hacer esto)
    do {
        //7. Crearemos una instancia de loan intentando decodificar la clase Loan pasandole el jsonData que acabo de descodificar
        let loan = try decoder.decode(Loan.self, from: jsonData)
        //8. SI esto es posible lo imprimiremos
        print(loan)
    //9. SI el DO da error utilizaremos el catch para imprimir el error
    } catch {
        print(error)
    }
} //10. Ahora le damos Play 



