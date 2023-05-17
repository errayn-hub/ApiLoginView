//
//  SignUpView.swift
//  ApiLoginView
//
//  Created by ErRayn on 17.05.2023.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .foregroundColor(.blue)
                .padding([.top, .bottom], 50)
                .shadow(radius: 6.0, x: 10, y: 10)
            
            TextField("Kullanıcı Adı", text: $username)
                .padding()
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(25.0)
                .shadow(radius: 10.0, x: 5, y: 10)
                .padding()
            
            SecureField("Parola", text: $password)
                .padding()
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(25.0)
                .shadow(radius: 10.0, x: 5, y: 10)
                .padding()
            
            Button(action: {
                AuthenticationService.shared.signUp(username: username, password: password) { result in
                    switch result {
                    case .success(let token):
                        // Kayıt başarılı olduğunda yapılacak işlemleri burada gerçekleştirin
                        print("Kayıt başarılı: \(token)")
                    case .failure(let error):
                        // Kayıt başarısız olduğunda yapılacak işlemleri burada gerçekleştirin
                        print("Kayıt başarısız: \(error.localizedDescription)")
                    }
                }
                
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Kayıt Ol")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 6.0, x: 10, y: 10)
            }
            .padding()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Geri")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 6.0, x: 10, y: 10)
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
