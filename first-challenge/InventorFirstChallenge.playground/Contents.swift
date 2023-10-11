import Foundation

let inventor = "Steve"
var lastName: String? = "Jobs"

print("\(inventor) \(lastName ?? "Wozniak")")

if let lastName = lastName {
    print("\(inventor) \(lastName)")
}
