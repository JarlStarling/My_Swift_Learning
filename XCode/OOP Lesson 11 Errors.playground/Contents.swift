import UIKit
import Security

var greeting = "Hello, playground"

print("Errors handling")

// making mistakes / errors

enum AuthError: Error {
    case wrongPassword
    case dataNotExist
    case serverLost
}

// проброс ошибки

func auth(login: String, password: String) throws -> String {
    
    let trueLogin = "Jarl"
    let truePass = "123"
    
    guard login == trueLogin else {
        throw AuthError.dataNotExist
    }
    
    guard password == truePass else {
        throw AuthError.wrongPassword
    }
            
    print("Hello, Master!")
    
    return "OK"
}

// do-catch

var string = ""

do {
    string = try auth(login: "Jarl", password: "123" )
} catch AuthError.dataNotExist {
    string = "Data is not exist"
} catch AuthError.wrongPassword {
     string = "Wrong password"
//} catch {
//     print("Some other mistake")

}

print(string)

// Convertation to optional

// try? auth(login: "Jarl", password: "223" )

// Assertion of inerrancy

//try! auth(login: "Jarl", password: "223" )









