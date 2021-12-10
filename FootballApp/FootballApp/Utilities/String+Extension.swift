//
//  String+Extension.swift
//  TheClosedCircuit
//
//  Created by  Tes on 10/12/2021.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
