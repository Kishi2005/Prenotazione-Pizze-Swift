//
//  ContentView.swift
//  First App
//
//  Created by Lorenzo Fravolini  on 05/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var pizze : Int = 0
    @State var cokes : Int = 0
    @State var address : String = ""
    @State var delivery : Bool = false
    
    let pizzaPrezzo : Double = 8.50
    let cokePrezzo : Double = 2.50
    let deliveryPrezzo : Double = 2.50
    
    var tot : Double{
        (Double(pizze) * pizzaPrezzo)
        +
        (Double(cokes) * cokePrezzo)
        +
        (delivery ? Double(deliveryPrezzo) : 0)
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Menù")
                    .padding()
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    Spacer()
                Button("Reset", action: {
                    self.pizze = 0
                    self.cokes = 0
                    self.address = ""
                    self.delivery = false
                })
                .padding()
            }
        HStack{
            Stepper(value: $pizze, in: 0...10, label: {
                Text("Pizze")
                Text("\(pizze)")
            })
            .padding()
          }
        HStack{
            Stepper(value: $cokes, in: 0...10, label: {
                Text("Coca Cola")
                Text("\(cokes)")
            })
            .padding()
            }
        HStack{
            Text("Prezzo Finale")
            .padding()
            Spacer()
            Text("\(format(x : tot))")
            .padding()
        }
    
            Spacer()
            if(tot > 0){
                VStack{
                        Toggle(isOn: $delivery, label: {
                            HStack{
                                Text("Priorità Spedizione")
                                Spacer()
                            }
                        })
                        .padding()

                    .multilineTextAlignment(.leading)
                TextField("Via...", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    Spacer()
                }
            }
        }
    }
    
    func format(x : Double) -> String {
        String(format: "%.2f", x)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
