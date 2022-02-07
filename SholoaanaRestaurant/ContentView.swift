//
//  ContentView.swift
//  SholoaanaRestaurant
//
//  Created by Anupama Biswas on 07/02/22.
//

import SwiftUI

struct ContentView: View {
    
    let location = [
        "Siliguri",
        "Kolkata",
        "Bangalore",
        "Delhi",
        "Mumbai",
        "Pune",
        "Indore",
        "Lucknow"
    ]
    
    let menuItem = [
        "Chingri maach r malai",
        "Bhetki maach r paturi",
        "Ilish maach bhaja",
        "Ilish bhapa",
        "Katla Kalia",
        "Aalu posto",
        "Steam Rice",
        "Phulka",
        "Naan",
        "Dal Fry",
        "Moong Dal",
        "Musoor Dal",
        "Mix-Veg",
        "Beguni",
        "Chicken Kasha",
        "Koi maach Bhapa",
        "Muro ghonto",
        "Khichuri",
        "veg Biryani",
        "Chicken Biryani"
    ]
    
    let pickupTime = [
        "5 pm",
        "6 pm",
        "7 pm",
        "8 pm",
        "9 pm"
    ]
    
    @State private var locationSelection = 1
    @State private var menuSelection = 1
    @State private var timeSelection = 1
    @State private var time = Date()

    var body: some View {
        VStack(spacing: 80){
            Text("Sholoaana Restaurant")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
            
            HStack {
                Text("Location:")
                Picker("Location:", selection: $locationSelection ){
                    ForEach(0..<location.count){ index in
                        Text(location[index]).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Text(location[locationSelection])
                    .padding(.leading, 20)
            }
            
            VStack {
                Text("Order:")
                Picker("Menu:", selection: $menuSelection ){
                    ForEach(0..<menuItem.count){ index in
                        Text(menuItem[index]).tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
            }
             
            
            VStack {
                Text("Pickup Time:")
                Picker("Menu:", selection: $timeSelection ){
                    ForEach(0..<pickupTime.count){ index in
                        Text(pickupTime[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button("Pick for me!"){
                locationSelection = .random(in: 0..<location.count)
                menuSelection = .random(in: 0..<menuItem.count)
                timeSelection = .random(in: 0..<pickupTime.count)
            }
             
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
