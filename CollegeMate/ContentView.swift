//
//  ContentView.swift
//  CollegeMate
//
//  Created by Tj Britt on 4/13/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer() // Spacer at the top to push everything to the middle
                
                // Welcome Text
                Text("Welcome to College Mate")
                    .font(.title) // Larger text size
                    .fontWeight(.bold)
                    .foregroundColor(.black) // Text color is black
                    .padding(.bottom, 20) // Adds space below the text
                
                // Dodecagon-shaped placeholder with a standard person icon
                ZStack {
                    Dodecagon()
                        .stroke(Color.white, lineWidth: 4)
                        .background(Dodecagon().fill(Color.green))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)

                // Username TextField
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                
                // Password SecureField
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                
                // Sign Up Button
                Button(action: signUp) {
                    Text("Sign Up")
                        .fontWeight(.medium)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 20) // Adds space below the button

                Spacer() // Spacer at the bottom to balance the content vertically
            }
            .navigationBarTitle("Sign Up", displayMode: .inline)
            .background(Color(.systemGroupedBackground)) // Sets a subtle background color
        }
    }
    
    func signUp() {
        // Implement the sign-up logic
        print("Username: \(username), Password: \(password)")
    }
}

struct Dodecagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let points = (0..<12).map { (i: Int) -> CGPoint in
            let angle = CGFloat(i) * (2 * .pi / 12)
            return CGPoint(x: rect.midX + rect.width / 2 * cos(angle), y: rect.midY + rect.height / 2 * sin(angle))
        }
        path.move(to: points[0])
        for point in points {
            path.addLine(to: point)
        }
        path.closeSubpath()
        return path
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
