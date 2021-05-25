//
//  ContentView.swift
//  AmountSplitApp
//
//  Created by Raza Khan on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount  = ""
    @State var numberOfPeople  = 2
    @State  var tipPercentage = 2
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    var total = 0.0
    var totalPerson: Double{
        //Calcutalete the total person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal  = orderAmount + tipValue
        let amountPerPerson  = grandTotal / peopleCount
        return amountPerPerson
        
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Text("Paying amount is  : \(checkAmount) $")
                    
                    Picker("Number of people", selection:$numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you wish to leave?")){
                    Picker("Tip Percentages", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0]) %")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                }
                
                Section{
                    Text("$\(totalPerson, specifier: "%.2f")")
                }
            }
            
            .navigationBarTitle("@razakhan.dev")
        }
        
        
    }
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
