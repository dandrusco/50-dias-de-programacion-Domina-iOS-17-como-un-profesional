//
//  LoanFactory.swift
//  F19-Prestamos
//
//  Created by Danilo Andrusco on 21-11-24.
//

import Foundation

class LoanFactory: Decodable, ObservableObject{
    
    private var downloadedLoans: [Loan] = []
    @Published var loans: [Loan] = []
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    //MARK: Constructores
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.loans = try container.decode([Loan].self, forKey: .loans)
    }
    
    init(){
        self.loans = []
    }
    
    //MARK: Descarga de la API
    private static var apiUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    func fetchFromApi(){
        guard let url = URL(string: LoanFactory.apiUrl) else{
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                DispatchQueue.main.async{
                    self.downloadedLoans = self.parseJson(data: data)
                }
            }
        }
        task.resume()
        
    }
    
    func parseJson(data: Data) -> [Loan]{
        let decoder = JSONDecoder()
        var loans: [Loan] = []
        
        do {
            let loanFactory = try decoder.decode(LoanFactory.self, from: data)
            loans = loanFactory.loans
        } catch {
            print(error)
        }
        return loans
    }
    
    //MARK: Filtrado de los préstamos
    func filterLoans(maxAmout : Int){
        self.loans = self.downloadedLoans.filter { $0.amount < maxAmout }
    }
}
