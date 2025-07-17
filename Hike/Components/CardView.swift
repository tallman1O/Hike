//
//  CardView.swift
//  Hike
//
//  Created by Mehul Uttam on 16/07/25.
//

import SwiftUI

struct CardView: View {
    // MARK - PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    // MARK: - Functions
    func RandomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
                    
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            // Action : Show a sheet
                            print("The Button was pressed.")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor acitivity for friends and family.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                // MARK - Main Content
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color("ColorIndigoMedium"), Color("ColorSalmonLight")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 256, height: 256)
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.3),
                                   value: imageNumber)
                    
                }
                // MARK - Footer
                Button {
                    //Action : Generate a random number
                    print("Explore Button was pressed.")
                    RandomImage()
                    
                } label: {
                    Text("Explore More")
                        .fontWeight(.black)
                        .font(.title2)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25) , radius:0.25, x:1, y: 2 )
                }
                .buttonStyle(GradientButton())
                
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
