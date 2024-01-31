//
//  ValidateUser.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 31/01/24.
//

import Foundation

struct ValidateUser {
    var email: String
    var password: String
    
    // Foydalanuvchi ma'lumotlarini tekshiruvchi funksiya
    func validateUser(_ user: ValidateUser) -> Bool {
        // Emailni tekshirish
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: user.email)
        
        // Parolni tekshirish (minimal uzunlik 6 belgi)
        let isPasswordValid = user.password.count >= 6
        
        return isEmailValid && isPasswordValid
    }
}
