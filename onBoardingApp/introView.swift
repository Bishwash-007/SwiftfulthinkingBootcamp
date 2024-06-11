 //
//  introView.swift
//  onBoardingApp
//
//  Created by Bishwash Chaudhari on 10/06/2024.
//

import SwiftUI

struct introView: View {
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    var body: some View {
        ZStack{
            // background
            RadialGradient(
                gradient: Gradient(colors: [Color(.white),Color(.blue)]),
                center: .topLeading,
                startRadius: 25,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                Text("profile view")
            }
            else
            {
                Text("onBoarding view")
            }
            
        }
    }
}

#Preview {
    introView()
}
