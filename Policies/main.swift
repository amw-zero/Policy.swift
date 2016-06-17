//
//  main.swift
//  Policies
//
//  Created by Alex Weisberger on 6/16/16.
//  Copyright © 2016 AMW. All rights reserved.
//

import Foundation

protocol PrintPolicy {
    func printMessage()
}


struct HelloWorld: PrintPolicy {
    func printMessage() {
        print("Hello world")
    }
}

struct HelloName: PrintPolicy {
    func printMessage() {
        print("Hello Alex")
    }
}

protocol Base: class {
    func printMessage()
}

class Hello<T: PrintPolicy>: Base {
    let printer: T
    
    init(printer: T) {
        self.printer = printer
    }
    
    func printMessage() {
        printer.printMessage()
    }
}

let hw = Hello(printer: HelloWorld())

let hn = Hello(printer: HelloName())

let printers: [Base] = [hw, hn]
for printer in printers {
    printer.printMessage()
}
