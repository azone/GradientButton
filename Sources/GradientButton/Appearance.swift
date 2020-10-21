//
//  Appearance.swift
//  GradientButton
//
//  Created by 王要正 on 2019/12/12.
//

import UIKit

extension UIControl.State: Hashable {}

public extension GradientButton {
    class Appearance {
        public static let cornerRadiusHalfHeight: CGFloat = -1
        public var cornerRadius: CGFloat = cornerRadiusHalfHeight

        private var gradientsForState = [UIControl.State: Gradient]()
        private var bordersForState = [UIControl.State: Border]()
        private var shadowsForState = [UIControl.State: NSShadow]()

        public func setGradient(_ gradient: Gradient?, for state: UIControl.State) {
            gradientsForState[state] = gradient
        }

        public func gradient(for state: UIControl.State) -> Gradient? {
            gradientsForState[state]
        }

        public func setBorder(_ border: Border?, for state: UIControl.State) {
            bordersForState[state] = border
        }

        public func border(for state: UIControl.State) -> Border? {
            bordersForState[state]
        }

        public func setShadow(_ shadow: NSShadow?, for state: UIControl.State) {
            shadowsForState[state] = shadow
        }

        public func shadow(for state: UIControl.State) -> NSShadow? {
            shadowsForState[state]
        }
    }
}
