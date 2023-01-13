//
//  UICollectionViewReusableView+Extensions.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 12/01/23.
//

import UIKit

extension UICollectionReusableView {
    class func uid() -> String {
        return String(describing: self)
    }
}
