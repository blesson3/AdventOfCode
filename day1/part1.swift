import Foundation

// Read data from this file.
let path = "input.txt"

do {
    var data = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding)
    var l = 0
    for c in String(data).characters {
        switch c {
        case "(":
            l++
        case ")":
            l--
        default:
            break
        }
    }
    print(l)
}