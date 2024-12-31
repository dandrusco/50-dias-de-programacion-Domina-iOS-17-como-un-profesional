//
//  ContentView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//

import SwiftUI
import SwiftData

//1. Crearemos un enumerado para los ingresos, gastos o todo
enum TransactionType {
    case all
    case income
    case expense
}

struct DashboardView: View {
    
    //2. Crearemos la variable de entorno para nuestro modelContext
    @Environment(\.modelContext) var modelContext
    
    //3. Necesitaremos dos variables de estado de tipo booleano, una para generar un registro y la otra para los detalles
    @State private var showPaymentDetails = false
    @State private var editPaymentDetails = false
    
    //4. Este estado nos ayudara para saber cual registro tengo seleccionado, como opcional
    @State private var selectedPaymentRecord : PaymentRecord?
    
    //5. crearemos una variable de estado que en principio muestre todas las transacciones
    @State private var transactionType: TransactionType = .all
    
    //6. Necesitamos una Query para obtener los datos de SwiftData, que sera del tipo arrays PaymentRecord
    @Query var paymentRecords : [PaymentRecord]
    
    //7. Creamos una variable pára el total de ingresos
    private var totalIncome: Double{
        //8. calcularemos el total haciendo un filtro
        let total = self.paymentRecords
            .filter {
                //9. Le diremos que sea de tipo ingreso
                $0.type == .income
            }
            //10. Lo reduciremos al valor 0
            .reduce(0){
                //11. Le sumaremos el valor reducido al valor del totral del numero anterior
                $0+$1.amount
            }
        //12. Devolvemos el total
        return total
    }
    //13. Creamos una variable pára el total de gastos y sera igual al totalIncome pero de gastos
    private var totalExpense: Double{
        let total = self.paymentRecords
            .filter{
                $0.type == .expense
            }.reduce(0) {
                $0 + $1.amount
            }
        return total
    }
    //14. Creamos una variable pára el balance
    private var totalBalance: Double{
        //XX Devolvemos la resta entre los ingresos menos los gastos
        return self.totalIncome - self.totalExpense
    }
    
    //15 Creamos una variable para mostrar con los filtros
    private var paymentRecordsForView: [PaymentRecord]{
        //16. realizamos un switch de la variable transactionType
        switch self.transactionType {
        //17. Temeemos 3 casos: .all, .income y .expense
        case .all:
            //18. devolvemos todo ordenado por fecha descendiente
            return self.paymentRecords
                .sorted {
                    $0.date.compare($1.date) == .orderedDescending
                }
        case .income:
            //19. Para el income y expense es lo mismo, salvo que metemos un filtro para que solo sea income o expense segun corresponda
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
        //20. Creamos la grafica metida en una Zstack seguida de una ScrollView
        ZStack{
            ScrollView(showsIndicators: false) {
                //21. Crearemos un menuBar que le pasaremos un contexto de PaymentFormView
                MenuBar() {
                    PaymentFormView()
                }
                //22. le meteremos un listRowInsets para que se quede al interior de la lista
                .listRowInsets(EdgeInsets())
                
                //37. para ver los cambio meteremos dentro de una VStack el TotalBalanceCard con un padding en horizontal
                VStack{
                    TotalBalanceCard(balance: self.totalBalance)
                        .padding(.horizontal)
                    //45. Creamos una HZtack y meteremos el TotalIncomeCard
                    HStack(spacing: 16){
                        TotalIncomeCard(balance: self.totalIncome)
                        //50. Para poder verla tambiem pondremos la TotalExpenseCard
                        TotalExpenseCard(balance: self.totalExpense)
                    }
                    //51 metemos un paffing en horizontal
                    .padding(.horizontal)
                    //56. llamaremos a la estrucrura para ir visualizando los cambios
                    RecordHeader(transactionType: self.$transactionType)
                        .padding(.all)
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}

//23. Creamos la estructura para el MenuBar
struct MenuBar<Content>: View where Content: View{
    
    //24. Necesitamos el estado para saer si lo mostramos o no
    @State private var showPaymentForm = false
    //25. Creamos la constante para el contenido
    let modalContent: () -> Content
    
    var body: some View {
        //26. metemos una ZStack, segudo de una HStack y un Spacer
        ZStack(alignment: .trailing, content: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                //27. Metemos una VStack para introducir un texto con la fecha de hoy
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                    Text(Date.today.string(with: "EEEE, d MMM, yyyy"))
                        .font(.caption)
                        .foregroundStyle(.teal)
                    //28. Como titulo metemos un texto de Mis Finanzas
                    Text("Mis Finanzas")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundStyle(.teal)
                })
                //29. metemos otro Spacer
                Spacer()
            })
            //30. meteremos un boton
            Button(action: {
                //31. La accion es pasar el showPaymentForm a verdadeor
                self.showPaymentForm = true
            }, label: {
                //32. Como imagen pondremos un signo +
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundStyle(.teal)
                    .padding(.trailing)
            })
            //33. Al precionar el boton cambiamos el estado y presentamos un contenido, por lo tanto el onDismiss cerraremos el formulario
            .sheet(isPresented: self.$showPaymentForm, onDismiss: {
                self.showPaymentForm = false
            }){
                //24. El conteendio sera el modalContent
                self.modalContent()
            }
        })
    }
}

//35. Creamos la tarjeta para el balance
struct TotalBalanceCard: View {
    //26. El balance partira en 0
    var balance = 0.0
    
    var body: some View {
        //38 Creamos una ZStack seguido de un rectanhle
        ZStack{
            Rectangle()
            //39. Creamo un nuevo color que llamaremos MainColor que sera de 8Bit hexadecimal #449CB9 (Color teal)
            //40. Ahora lo podremos de fondo este color4 con un borde redondeado de 16
                .foregroundStyle(Color("MainColor"))
                .cornerRadius(16)
            //41. Dentro de una VStack pondremos un titulo de balance toral
            VStack{
                Text("Balance Total")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                //42. Mostramos el valor del valance
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 50, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        //43. Tendra un frame de 200 en altura
        .frame(height: 200)
    }
}

//44. Creamom una esctructura para el total de ingreso, que sera igual al TotalBalanceCard pero con algunos pequeños cambios
struct TotalIncomeCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
                //45. Sera de color Income
                .foregroundStyle(Color("Income"))
                .cornerRadius(16)
            
            VStack{
                //46. El texto ingreso pero como .title
                Text("Ingresos")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                //47. EL tamaño sera a 30
                Text(NumberFormatter.currency(from: self.balance))
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.4)
            }
        }
        //48. El frame a 150
        .frame(height: 150)
    }
}

//49. Creamom una esctructura para el total de gastos, que sera igual al TotalIncomeCard pero con algunos pequeños cambios
struct TotalExpenseCard: View {
    var balance = 0.0
    
    var body: some View {
        ZStack{
            Rectangle()
            //52. Color sera Expense
                .foregroundStyle(Color("Expense"))
                .cornerRadius(16)
            
            VStack{
                //53. El texto sera Gastos
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

//54. Creamos ahora la estructura para el filtrado de datos
struct RecordHeader: View {
    
    //55. deberemos crear un Binding para las TransactionType
    @Binding var transactionType: TransactionType

    var body: some View {
        //57. Creamos una VStack, seguida de una HStack, en su interior un texto de headline
        VStack{
            HStack{
                Text("Últimas Transacciones")
                    .font(.headline)
                    .foregroundStyle(Color("MainColor"))
                //58. Metemos un Spacer
                Spacer()
            }
            //59. Xreamos una HStack y en su interior contendra un grupo para poner 3 botones
            HStack{
                Group {
                    //60. El primero para TODOS
                    Text("Todos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .all ? Color("MainColor") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .all
                        }
                    //61. El segundo para los ingresos
                    Text("Ingresos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .income ? Color("Income") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .income
                        }
                    //62. El tercerro para los gastos
                    Text("Gastos")
                        .padding(8)
                        .padding(.horizontal, 16)
                        .background(self.transactionType == .expense ? Color("Expense") : Color("NoActive"))
                        .onTapGesture {
                            self.transactionType = .expense
                        }
                }
                //63. configuramos el group
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.white)
                .cornerRadius(16)
          
            }
        }
    }
}
