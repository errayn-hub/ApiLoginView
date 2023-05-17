//
//  AuthenticationService.swift
//  ApiLoginView
//
//  Created by ErRayn on 17.05.2023.
//

import Foundation

class AuthenticationService {
    static let shared = AuthenticationService()
    
    func signIn(username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Kullanıcı adı ve parolayı kullanarak giriş yapma işlemlerini gerçekleştirin
        // JWT token'ı başarılı bir giriş durumunda completion handler aracılığıyla döndürün
        // Hata durumunda da uygun bir hata nesnesi döndürün
        // Örnek olarak, aşağıdaki kodu kullanabilirsiniz:
        
        if username == "example" && password == "password" {
            completion(.success("dummy_token"))
        } else {
            let error = NSError(domain: "Authentication", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid username or password"])
            completion(.failure(error))
        }
    }
    
    func signUp(username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Yeni kullanıcı kaydı işlemlerini gerçekleştirin
        // JWT token'ı başarılı bir kayıt durumunda completion handler aracılığıyla döndürün
        // Hata durumunda da uygun bir hata nesnesi döndürün
        // Örnek olarak, aşağıdaki kodu kullanabilirsiniz:
        
        // Burada kayıt işlemlerini gerçekleştirin
        
        let token = "dummy_token"
        completion(.success(token))
    }
    
    func resetPassword(email: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Şifre sıfırlama işlemlerini gerçekleştirin
        // JWT token'ı başarılı bir şifre sıfırlama durumunda completion handler aracılığıyla döndürün
        // Hata durumunda da uygun bir hata nesnesi döndürün
        // Örnek olarak, aşağıdaki kodu kullanabilirsiniz:
        
        // Burada şifre sıfırlama işlemlerini gerçekleştirin
        
        let token = "dummy_token"
        completion(.success(token))
    }
}
