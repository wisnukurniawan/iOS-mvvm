//
//  ServerRequestManager.swift
//  TableViewExample
//
//  Created by Wisnu on 3/1/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

class ServerRequestManager {
    
    public func dataFromFile(_ filename: String) -> Data? {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        if let path = bundle.path(forResource: filename, ofType: "json") {
            return (try? Data(contentsOf: URL(fileURLWithPath: path)))
        }
        return nil
    }
    
}

