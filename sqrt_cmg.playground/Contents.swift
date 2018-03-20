//: Playground - noun: a place where people can play
import UIKit

var r = Double(42)
let n = Double(500)
let margem = Double(1e-5)
let MAXIT = 1000000


while !((n - margem) <= r*r && (n + margem) >= r*r) {
    r = (r + n/r)/2
}

print("num:", r, "| result:", r*r, "| original", n)
