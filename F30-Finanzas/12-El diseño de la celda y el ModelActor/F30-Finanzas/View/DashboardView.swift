//
//  ContentView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//

import SwiftUI
import SwiftData

enum TransactionType {
    case all
    case income
    case expense
}

struct DashboardView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var showPaymentDetails = false
    @State private var editPaymentDetails = false
    
    @State private var selectedPaymentRecord : PaymentRecord?
    
    @State private var transactionType: TransactionType = .all
    
    @Query var paymentRecords : [PaymentRecord]
    
    private var totalIncome: Double{
        let total = self.paymentRecords
            .filter {
                $0.type == .income
            }.reduce(0){
                $0+$1.amount
            }
        return total
    }
    
    private var totalExpense: Double{
        let total = self.paymentRecords
            .filter{
                $0.type == .expense
            }.reduce(0) {
                $0 + $1.amount
            }
        return total
    }
    
    private var totalBalance: Double{
        return self.totalIncome - self.totalExpense
    }
    
    private var paymentRecordsForView: [PaymentRecord]{
        switch self.transactionType {
        case .all:
            return self.paymentRecords
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        case .income:
            return self.paymentRecords
                .filter { $0.type == .income }
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        case .expense:
            return self.paymentRecords
                .filter { $0.type == .expense }
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        }
    }
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                MenuBar() {
                    PaymentFormView()
                }
                .listRowInsets(EdgeInsets())

                VStack{
                    TotalBalanceCard(balance: self.totalBalance)
                        .padding(.horizontal)
                    HStack(spacing: 16){
                        TotalIncomeCard(balance: self.totalIncome)
                        TotalExpenseCard(balance: self.totalExpense)
                    }
                    .padding(.horizontal)
                    RecordHeader(transactionType: self.$transactionType)
                        .padding(.all)
                }
                
                //1. Para mostrar todos los registros lo vamos a recorrer con un bucle
                ForEach(self.paymentRecordsForView) { record in
                    //20. Lo pintamos en la app
                    RecordCellView(record: record)
                        //21. Meteremos un onTapGesture para cuando cliquemos en el registro el showPaymentDetails pasara a ser true y el selectedPaymentRecord asociada al registro
                        .onTapGesture {
                            self.showPaymentDetails = true
                            self.selectedPaymentRecord = record
                        }
                    //25. Creamos un menu contextual que tendra un boton
                        .contextMenu{
                            Button(action: {
                                //26. editPaymentDetails pasara a true del registro seleccionado
                                self.editPaymentDetails = true
                                self.selectedPaymentRecord = record
                            }, label: {
                                //27. Creamos una HStack con el texto a editar y un icono de un lapiz
                                HStack{
                                    Text("Editar")
                                    Image(systemName: "pencil")
                                }
                            })
                            //28. Creamos un segundo boton pero para borrar
                            Button(action: {
                                //31 LLamamos a la accion del borrado
                                self.delete(record: record)
                            }, label: {
                                //32. Ponemos un texto y un icono
                                Text("Eliminar")
                                Image(systemName: "trash")
                            })
                        }
                }
                //22. Meteremos una sheet, si $showPaymentDetails es true
                .sheet(isPresented: self.$showPaymentDetails){
                    //23. creamos una constante que sera igual al selectedPaymentRecord para presentar el PaymentDetailView del pago seleccionado
                    if let selected = self.selectedPaymentRecord {
                        PaymentDetailView(payment: selected)
                            //24. Presentamos dos vistas
                            .presentationDetents([.medium, .large])
                    }
                }
                //33. Creamos una segunda Shit asociado a editPaymentDetails
                .sheet(isPresented: self.$editPaymentDetails){
                    //34. Si se puede hacer el casting al valor requerido
                    if let selected = self.selectedPaymentRecord {
                        //35. Entonces la PaymentFormView arrancara con selected
                        PaymentFormView(payment: selected)
                    }
                }
                
                
                
            }
            //36. Programaremos la pagina en blanco, para cuando selecciones un registro
            if self.showPaymentDetails{
                //37. Llamamos a BlankView con el color MainColor con una opacidad del 40% el cual quedara por debajo del registro
                BlankView(bgColor: Color("MainColor"))
                    .opacity(0.4)
                //38. Nos vamos a la PaymentFormView
            }
        }
    }

    
    //29. Creamos la funcion para eliminar
    func delete(record: PaymentRecord){
        //30. Borramos el registro
        self.modelContext.delete(record)
    }

}

#Preview {
    DashboardView()
        //6. Modificaremos la preview a previewContainer para poder tener datos de prueba y asi ir viendo los cambios mientras programamos los registros
        .modelContainer(previewContainer)
}

//7. Creamos el previewContainer llamando a un MainActor
@MainActor
let previewContainer: ModelContainer = {
    //8. Como puede dar errores lo meteremos en un DO
    do {
        //9. Creamos el contenedor
        let container = try ModelContainer(for: PaymentRecord.self,
                                           configurations: ModelConfiguration(isStoredInMemoryOnly:true))
        
        //10. Creamos un for del 0...10
        for idx in 0...10{
            //11. Creamos los datos random
            let newItem = PaymentRecord(date: Bool.random() ? .today : .tomorrow,
                                        name: Bool.random() ? "Curso online" : "Servicio",
                                        amount: Bool.random() ? 150 : 260,
                                        type: Bool.random() ? .income : .expense)
            //12. Este container temporal hacemos que persista
            container.mainContext.insert(newItem)
        }
        //13 devolvemos el contenedor
        return container
    //14 En caso de error
    } catch{
        fatalError("Imposible crear el Preview Container")
    }
}()


struct MenuBar<Content>: View where Content: View{
    
    @State private var showPaymentForm = false

    let modalContent: () -> Content
    
    var body: some View {
        ZStack(alignment: .trailing, content: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                    Text(Date.today.string(with: "EEEE, d MMM, yyyy"))
                        .font(.caption)
                        .foregroundStyle(.teal)
                    Text("Mis Finanzas")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundStyle(.teal)
                })
                Spacer()
            })
            Button(action: {
                self.showPaymentForm = true
            }, label: {
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.trailing)
            })
            .sheet(isPresented: self.$showPaymentForm, onDismiss: {
                self.showPaymentForm = false
            }){
                self.modalContent()
            }
        })
    }
}

struct TotalBalanceCard: View {

    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("MainColor"))
                .cornerRadius(16)
            VStack{
                Text("Balance Total")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        .frame(height: 200)
    }
}

struct TotalIncomeCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("Income"))
                .cornerRadius(16)
            
            VStack{
                Text("Ingresos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        .frame(height: 150)
    }
}

struct TotalExpenseCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("Expense"))
                .cornerRadius(16)
            
            VStack{
                Text("Gastos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        .frame(height: 150)
    }
}

struct RecordHeader: View {

    @Binding var transactionType: TransactionType

    var body: some View {
        VStack{
            HStack{
                Text("Últimas Transacciones")
                    .font(.headline)
                    .foregroundStyle(Color("MainColor"))
                Spacer()
            }
            HStack{
                Group {
                    Text("Todos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .all ? Color("MainColor") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .all
                        }
                    Text("Ingresos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .income ? Color("Income") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .income
                        }
                    Text("Gastos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .expense ? Color("Expense") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .expense
                        }
                }
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.white)
                .cornerRadius(16)
          
            }
        }
    }
}

//2. Creamos una estructura para mostrar los registros
struct RecordCellView : View {
    
    //3. Creamos la variable de tipo PaymentRecord
    var record: PaymentRecord
    
    var body: some View {
        //4. Creamos una HStacl con 16 de separacion
        HStack(spacing: 16){
            //5. Ponemos la imagen segun corresponda a ingreso o gasto
            Image(systemName: self.record.type == .income ? "arrowshape.up.circle.fill": "arrowshape.down.circle.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(self.record.type == .income ? Color("Income") : Color("Expense")))
            //15. Ahora devemos poner el contenido dentro de una VStack
            VStack(alignment: .leading, content: {
                //16. Ponemos el nombre y la fecha
                Text(self.record.name)
                    .font(.system(.body, design: .rounded))
                Text(self.record.date.string())
                    .font(.system(.caption, design: .rounded))
                    .foregroundStyle(.teal)
            })
            //17. Tiramos con un Spacer
            Spacer()
            
            //18. Ahora ponemos el valor
            Text((self.record.type == .income ? "+" : "-") + NumberFormatter.currency(from: self.record.amount))
                .font(.system(.headline, design: .rounded))
        }
        //19. Le metemos un padding horizontal
        .padding(.horizontal)
    }
}

