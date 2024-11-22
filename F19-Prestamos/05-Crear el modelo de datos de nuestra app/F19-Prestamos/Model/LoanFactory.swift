//
//  LoanFactory.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

import Foundation

//9. Crearemos una clase de tipo Decodable, Anterior mente utlizamos el protocolo Codable (codificable), y ahora Decodable (descodificable) Como solo necesitamos descodificar y no codificar, por lo tanto utilizamos Decodable, como mostraremos los prestamos en una lista, vamos a necestiar que las variables sea del protocolo ObservableObject
//11. Vemos que ahora nos da un error, y es que tanto Decodable como Codable, no se llevan bien con @Published
class LoanFactory: Decodable, ObservableObject{
    
    //30. Crearemos un arrays de loan vacio
    private var downloadedLoans: [Loan] = []
    
    //10. Creamos una variable de loans inicalizada por un array de Load, en principio vacio, como pertenecera al ObservableObject deberemos anteponer @Published
    @Published var loans: [Loan] = []
    
    //13. Para poder decodificar debemos tener las claves que van a formar parte del fichero donde sacaremos los prestamos (loans), para ello creamos el enumerado
    enum CodingKeys: CodingKey {
        case loans
    }
    
    //12. Para sollucionar este error deberemos crear un constructor requerido a partir de un decoder
    //MARK: Constructores
    required init(from decoder: Decoder) throws {
        //14. Una vez creado el enumerado intentaremos decodificar para que el contenedor encuentre los datos
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //15. AHora el loans intentara descodificar el arrays de Loan para la clave loans
        self.loans = try container.decode([Loan].self, forKey: .loans)
    }
    
    //16. A pesar de que no es necesario podemos inicalizar un constructor vacio, si no tenemos un descodificador podemos crear un arrays vacio para inicalizar los prestamos
    init(){
        self.loans = []
    }
    
    //17. Para conectarnos con un sitio web y descargar los JSON declararemos una variable con su URL
    //MARK: Descarga de la API
    private static var apiUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    //24. Crearemos una funcion para restatar los prestamos de la Api
    func fetchFromApi(){
        //25. Intentar3emos crear la URL apartir de un string
        guard let url = URL(string: LoanFactory.apiUrl) else{
            return
        }
        //26. Si conectamos solicitaremos una peticion web
        let request = URLRequest(url: url)
        //27. Crearemos una tarea de ejecucion de la clase URLSession con la peticion del request, nos quedaremos con el dato, la respuesta del servidor y el error
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //28. Caso donde hay un error en la descarga
            if let error = error {
                print(error)
                return
            }
            
            //29. Caso donde nos llega el JSON correctamente
            if let data = data {
                //Cuando haces una peticion a una appiesta se realiza en segundo plano, con main.async obligamos a que se ejecute en primer plano (en la principal)
                DispatchQueue.main.async{
                    //31. los datos los enviadmos al arrays downloadedLoans
                    self.downloadedLoans = self.parseJson(data: data)
                }
            }
        }
        //32. Ahora deberemos arrancar la tarea
        task.resume()
        
    }
    
    //18. Creamos otra funcion que nos permita devolver el arrays de prestamos
    func parseJson(data: Data) -> [Loan]{
        //19. Utlizaremos la misma logica que en el PlayGound
        let decoder = JSONDecoder()
        //20. Creamos el arrays de prestamos vacio
        var loans: [Loan] = []
        
        do {
            //21. Descodificamos los datos obtenido por parametro
            let loanFactory = try decoder.decode(LoanFactory.self, from: data)
            //22. Los almacenamos
            loans = loanFactory.loans
        } catch {
            print(error)
        }
        //23. Los devolvemos
        return loans
    }
    
    //33. como los datos se guardaran en downloadedLoans deberemos crear una funcion para filtrar los datos
    //MARK: Filtrado de los préstamos
    func filterLoans(maxAmout : Int){
        //34 Ahora lo que filtremos lo guardaremos en la variable loans
        self.loans = self.downloadedLoans.filter { $0.amount < maxAmout }
    }
}
