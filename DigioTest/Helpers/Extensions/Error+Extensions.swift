//
//  Error+Extensions.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import Foundation

extension Error {
    var localizedDescription: String {
        debugPrint(self)
        if let error = self as? DigioError {
            return error.localizedDescription
        } else {
            return DigioError.genericError.localizedDescription
        }
    }
}
