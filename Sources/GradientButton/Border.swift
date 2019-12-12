//
//  Border.swift
//  GradientButton
//
//  Created by 王要正 on 2019/12/11.
//

import UIKit

public extension GradientButton {
    struct Border {
        public var width: CGFloat = 1
        public var color: UIColor = .black

        public init(width: CGFloat = 1, color: UIColor = .black) {
            self.width = width
            self.color = color
        }
    }
}
