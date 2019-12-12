//
//  Gradient.swift
//  GradientButton
//
//  Created by 王要正 on 2019/12/11.
//

import UIKit

public extension GradientButton {
    struct Gradient {
        public var colors: [UIColor] {
            didSet {
                if colors.count == 1 {
                    colors = Array(repeating: colors[0], count: 2)
                }
            }
        }
        public var locations: [CGFloat]? = nil
        public var startPoint: CGPoint = .zero
        public var endPoint: CGPoint = CGPoint(x: 1, y: 0)
        var cgColors: [CGColor] { colors.map { $0.cgColor } }
        
        public init(colors: [UIColor],
                    locations: [CGFloat]? = nil,
                    startPoint: CGPoint = .zero,
                    endPoint: CGPoint = CGPoint(x: 1, y: 0)) {
            self.colors = colors.count == 1 ? Array(repeating: colors[0], count: 2) : colors
            self.locations = locations
            self.startPoint = startPoint
            self.endPoint = endPoint
        }
    }
}
