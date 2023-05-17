//
//  ContentView.swift
//  ApiLoginView
//
//  Created by ErRayn on 9.05.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var isShowingForgotPassword: Bool = false
    @State private var isShowingSignUp: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var backgroundColor = Color.blue
    
    let colors = [Color.red, Color.yellow, Color.green, Color.blue, Color.purple, Color.orange]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome To Venüs Cafe!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding([.top, .bottom], 50)
                    .shadow(radius: 6.0, x: 10, y: 10)
                
                Image("Venus")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle()
                    .stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 9.0, x: 20, y: 10)
                    .padding(.bottom, 40)
                
                
                VStack(spacing: 15) {
                    TextField("User Name", text: $username)
                        .padding()
                        .foregroundColor(.white)
                        .textContentType(.username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(25.0)
                        .shadow(radius: 10.0, x: 5, y: 10)
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                                .textContentType(.password)
                            
                        } else {
                            SecureField("Password", text: $password)
                                .textContentType(.password)
                        }
                        
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(25.0)
                    .shadow(radius: 10.0, x: 5, y: 10)
                }
                .padding(.horizontal, 30)
                
                Button(action: {
                    AuthenticationService.shared.signIn(username: username, password: password) { result in
                        switch result {
                        case .success(let token):
                            // Giriş başarılı olduğunda yapılacak işlemleri burada gerçekleştirin
                            isLoggedIn = true
                        case .failure(let error):
                            // Giriş başarısız olduğunda yapılacak işlemleri burada gerçekleştirin
                            print("Giriş başarısız: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color(.blue))
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Text("Don't have an account? ")
                        .foregroundColor(.white)
                    Button(action: {
                        isShowingSignUp = true
                    } ) {
                        Text("Sign Up")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 110, height: 50)
                            .background(Color(.blue))
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                        
                    }
                    
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    isShowingForgotPassword = true
                }) {
                    Text("Forgot Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color(.blue))
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .onAppear() {
                animateBackground()
            }
            .sheet(isPresented: $isShowingForgotPassword) {
                ForgotPasswordView()
            }
            .sheet(isPresented: $isShowingSignUp) {
                SignUpView()
            }
        }
    }
    
    func animateBackground() {
        let colorCount = colors.count
        var i = 0
        
        withAnimation(.linear(duration: 2.0)) {
            backgroundColor = colors[i]
        }
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            i = (i + 1) % colorCount
            
            withAnimation(.linear(duration: 2.0)) {
                backgroundColor = colors[i]
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
