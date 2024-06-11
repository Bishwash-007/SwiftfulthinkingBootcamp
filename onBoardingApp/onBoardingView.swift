//
//  onBoardingView.swift
//  onBoardingApp
//
//  Created by Bishwash Chaudhari on 10/06/2024.
//

import SwiftUI

struct onBoardingView: View {
    @State var name : String = ""
    @State var onBoardingState: Int = 0
    @State var age : Float = 50
    @State var gender : String = ""
    var body: some View {
        ZStack{
            
            ZStack{
                switch onBoardingState{
                case 0 : welcomeScreen
                case 1 : nameScreen
                case 2 : ageScreen
                case 3 : genderScreen
                default : Text("this is default screen")
                }
            }
            
            VStack{
                Spacer()
                buttomButton
            }.padding(30)
        }
    }
}

#Preview {
    onBoardingView()
        .background(Color.pink)
}

// MARK: COMPONENTS
extension onBoardingView {
    
    private var buttomButton : some View{
        Text(onBoardingState == 0 ? "Sign Up" :
                onBoardingState == 3 ? "Finish" : "Next"
        )
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.pink)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(14)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeScreen : some View {
        VStack(spacing : 40){
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200 , height: 200)
                .foregroundColor(.white)
            Text("Find Your Match")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y : 5)
                        .foregroundColor(.white)
                        ,
                    alignment : .bottom
                )
                
            Text("this is the no 1 app to find your fucking match online for a day so you can fuck around , cum  , etc , etc")
                .font(.headline)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Spacer()
        }
        .padding()
    }
    
    private var nameScreen : some View {
        VStack(spacing : 40){
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                
            TextField("Enter your Name", text : $name)
                .font(.headline)
                .frame(height: 40)
                .padding()
                .background(.white)
                .cornerRadius(14)
            Spacer()
            Spacer()
        }
        .padding()
    }
    
    private var ageScreen : some View {
        VStack(spacing : 40){
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                
            Text("\(String(format:"%.0f" ,age))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Slider(value: $age, in: 18 ... 100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding()
    }
    
    private var genderScreen: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Spacer()
            
            Text("What's your Gender?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)

            Picker(selection: $gender,
                   
                   label:
                    Text(gender.count > 1 ? gender : "Select a Gender")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white),
                   
                   content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
            )
            .pickerStyle(MenuPickerStyle())
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .cornerRadius(12)
            
            Spacer()
        }
        .padding()
    }
}

// MARK: FUNCTIONS
extension onBoardingView {
    func handleNextButtonPressed() {
        withAnimation(.spring()) {
            onBoardingState += 1
        }
    }
}
