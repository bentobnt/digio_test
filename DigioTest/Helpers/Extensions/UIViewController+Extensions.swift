//
//  UIViewController+Extensions.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import UIKit
import SnapKit

extension UIViewController {
    func install(_ child: UIViewController) {
        install(child, in: view)
    }

    func install(_ child: UIViewController, in view: UIView) {
        addChild(child)

        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)

        child.view.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })

        child.didMove(toParent: self)
    }
}
