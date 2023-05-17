//
//  ForgotPasswordView.swift
//  ApiLoginView
//
//  Created by ErRayn on 17.05.2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.title)
                .foregroundColor(.blue)
                .padding([.top, .bottom], 50)
                .shadow(radius: 6.0, x: 10, y: 10)
            
            TextField("E-posta", text: $email)
                .padding()
                .foregroundColor(.white)
                .padding()
                .background(Color.cyan)
                .cornerRadius(25.0)
                .shadow(radius: 10.0, x: 5, y: 10)
                .padding()
            
            Button(action: {
                AuthenticationService.shared.resetPassword(email: email) { result in
                    switch result {
                    case .success(let token):
                        // Şifre sıfırlama başarılı olduğunda yapılacak işlemleri burada gerçekleştirin
                        print("Şifre sıfırlama başarılı: \(token)")
                    case .failure(let error):
                        // Şifre sıfırlama başarısız olduğunda yapılacak işlemleri burada gerçekleştirin
                        print("Şifre sıfırlama başarısız: \(error.localizedDescription)")
                    }
                }
                
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Şifremi Sıfırla")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .shadow(radius: 6.0, x: 10, y: 10)
            }
            .padding()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Geri")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .shadow(radius: 6.0, x: 10, y: 10)
            }
            .padding()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
