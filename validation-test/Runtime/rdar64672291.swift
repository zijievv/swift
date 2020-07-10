// RUN: %target-run-simple-swift
// REQUIRES: objc_interop
// REQUIRES: executable_test

import Foundation

final class Storage<T: NSObject> {
    weak var object: T?
    init(object: T) {
        self.object = object
    }
}


@objc protocol MyProtocol {}
typealias MyStorage = Storage<NSObject & MyProtocol>

class Gadget: NSObject, MyProtocol {
    func testit() {
        _ = MyStorage(object: self)
    }
}

let gadget = Gadget()
gadget.testit()
