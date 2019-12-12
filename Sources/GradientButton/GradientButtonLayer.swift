//
//  GradientButtonLayer.swift
//  GradientButton
//
//  Created by 王要正 on 2019/12/11.
//

import UIKit

class GradientButtonLayer: CAGradientLayer {
    var enableCustomAnimations = true

    private static let customAnimationKeys: Set<String> = [
        "colors",
        "locations",
        "startPoint",
        "endPoint",
        "borderWidth",
        "borderColor",
        "shadowColor",
        "shadowOpacity",
        "backgroundColor",
        "shadowOffset",
        "shadowRadius"
    ]

    override func animationKeys() -> [String]? {
        let keys = super.animationKeys() ?? []
        guard enableCustomAnimations else {
            return keys
        }
        
        return Self.customAnimationKeys + keys
    }

    override func action(forKey event: String) -> CAAction? {
        guard enableCustomAnimations && Self.customAnimationKeys.contains(event) else {
            return super.action(forKey: event)
        }

        let animation = CABasicAnimation(keyPath: event)
        animation.duration = 0.25
        animation.fromValue = presentation()?.value(forKeyPath: event)
        animation.fillMode = .forwards

        return animation
    }
}
