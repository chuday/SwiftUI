//
//  ContentView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 06.12.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                Image("vk")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            ScrollView {
                
                VStack {
                    if shouldShowLogo {
                        Text("VK")
                            .padding(.top, 32)
                            .font(.largeTitle)
                    }
                    
                    VStack {
                        
                        HStack {
                            Text("Login")
                            Spacer()
                            TextField("Enter login", text: $login)
                                .frame(maxWidth: 160)
                        }
                        
                        HStack {
                            Text("Password")
                            Spacer()
                            SecureField("Enter password", text: $password)
                                .frame(maxWidth: 160)
                        }
                    }
                    .frame(maxWidth: 250)
                    
                    Button(action: self.onLoginPressed) {
                        
                        HStack {
                            Text("Log in")
                            Image(systemName: "arrow.up")
                        }
                    }
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
                    .disabled(login.isEmpty || password.isEmpty)
                    
                    Spacer()
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .onReceive(keyboardIsOnPublisher) { value in
            withAnimation {
                self.shouldShowLogo = !value
            }
        }
        .onTapGesture {
            self.endEditing()
        }
    }
    
    private func onLoginPressed() {
        
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

extension UIApplication {
    func endEditing() {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
