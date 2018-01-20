import Foundation

// Read data from this file.
let path = "input.txt"

do {
    var data = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding)
    var l = 0
    var p = 0
    for c in String(data).characters {
        guard l != -1 else { print("in basement!"); break; }
        switch c {
        case "(":
            l++
        case ")":
            l--
        default:
            break
        }
        p++
    }
    print(p)
}