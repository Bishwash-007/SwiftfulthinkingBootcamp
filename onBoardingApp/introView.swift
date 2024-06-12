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
                gradient: Gradient(colors : [Color(.systemRed),Color(.systemPink)]),
                center: .topTrailing,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                Text("profile view")
            }
            else
            {
               onBoardingView()
            }
            
        }
    }
}

#Preview {
    introView()
}
