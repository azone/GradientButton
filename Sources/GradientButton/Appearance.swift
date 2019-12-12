//
//  Appearance.swift
//  GradientButton
//
//  Created by 王要正 on 2019/12/12.
//

import UIKit

public extension GradientButton {
    class Appearance {
        public static let cornerRadiusHalfHeight: CGFloat = -1
        public var cornerRadius: CGFloat = cornerRadiusHalfHeight

        private var gradientsForState = [UInt: Gradient]()
        private var bordersForState = [UInt: Border]()
        private var shadowsForState = [UInt: NSShadow]()

        public func setGradient(_ gradient: Gradient?, for state: UIControl.State) {
            gradientsForState[state.rawValue] = gradient
        }

        public func gradient(for state: UIControl.State) -> Gradient? {
            gradientsForState[state.rawValue]
        }

        public func setBorder(_ border: Border?, for state: UIControl.State) {
            bordersForState[state.rawValue] = border
        }

        public func border(for state: UIControl.State) -> Border? {
            bordersForState[state.rawValue]
        }

        public func setShadow(_ shadow: NSShadow?, for state: UIControl.State) {
            shadowsForState[state.rawValue] = shadow
        }

        public func shadow(for state: UIControl.State) -> NSShadow? {
            shadowsForState[state.rawValue]
        }
    }
}
