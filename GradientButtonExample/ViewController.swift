//
//  ViewController.swift
//  GradientButtonExample
//
//  Created by 王要正 on 2019/12/11.
//

import UIKit
import GradientButton

class ViewController: UIViewController {

    @IBOutlet weak var buttonStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let appreance = GradientButton.defaultAppearance
        let gradient = GradientButton.Gradient(colors: [#colorLiteral(red:0.1647, green:0.5137, blue:0.9529, alpha:1.0), #colorLiteral(red:0.3294, green:0.4784, blue:0.9804, alpha:1.0)])
        appreance.setGradient(gradient, for: .normal)
        let highlightGradient = GradientButton.Gradient(colors: [#colorLiteral(red:0.3373, green:0.6118, blue:0.9686, alpha:1.0), #colorLiteral(red:0.502, green:0.6157, blue:0.9961, alpha:1.0)])
        appreance.setGradient(highlightGradient, for: .highlighted)


        let button1 = gradientButton()
        button1.setTitle("Button with default appearance", for: .normal)
        buttonStackView.addArrangedSubview(button1)

        let button2 = button(with: #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0), endColor: #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0),
                             reverseColors: false,
                             withShadow: false)
        button2.setTitle("Button with gradient", for: .normal)
        buttonStackView.addArrangedSubview(button2)

        let button3 = button(with: #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0), endColor: #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0))
        button3.setTitle("Button with gradient and shadow", for: .normal)
        buttonStackView.addArrangedSubview(button3)

        let button4 = borderButton()
        button4.setTitle("Button with border and background color", for: .normal)
        buttonStackView.addArrangedSubview(button4)

        let button5 = verticalGradientButton()
        button5.cornerRadius = 6
        button5.setTitle("Button with vertical gradient", for: .normal)
        buttonStackView.addArrangedSubview(button5)
    }

    private func borderButton() -> GradientButton {
        let button = gradientButton(.custom)
        button.titleLabel?.font = .systemFont(ofSize: 15)

        let border = GradientButton.Border(color: #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0))
        button.setBorder(border, for: .normal)

        let highLightBorder = GradientButton.Border(color: #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0))
        button.setBorder(highLightBorder, for: .highlighted)

        button.setBackgroundColor(.white, for: .normal)
        button.setBackgroundColor(#colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0), for: .highlighted)

        button.setTitleColor(#colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0), for: .normal)
        button.setTitleColor(.white, for: .highlighted)

        return button
    }

    private func gradientButton(_ type: UIButton.ButtonType = .system) -> GradientButton {
        let button = GradientButton(type: type)
        button.tintColor = .white
        button.setTitle("Button", for: .normal)

        return button
    }

    private func button(with startColor: UIColor,
                        endColor: UIColor,
                        reverseColors: Bool = true,
                        withShadow: Bool = true) -> GradientButton {
        let button = gradientButton()
        let colors = [startColor, endColor]
        let gradient = GradientButton.Gradient(colors: colors)
        button.setGradient(gradient, for: .normal)

        var highlight = gradient
        if reverseColors {
            highlight.colors = colors.reversed()
        } else {
            highlight.colors = colors.map({ $0.withAlphaComponent(0.8) })
        }
        button.setGradient(highlight, for: .highlighted)

        if withShadow {
            let shadow = NSShadow()
            shadow.shadowColor = startColor
            shadow.shadowBlurRadius = 8
            button.setShadow(shadow, for: .normal)

            let highlightShadow = NSShadow()
            highlightShadow.shadowColor = endColor
            highlightShadow.shadowBlurRadius = 8
            button.setShadow(highlightShadow, for: .highlighted)
        }

        return button
    }

    private func verticalGradientButton() -> GradientButton {
        let button = gradientButton()
        let startColor = #colorLiteral(red:1.0, green:0.5647, blue:0.0, alpha:1.0)
        let endColor = #colorLiteral(red:1.0, green:0.3137, blue:0.0, alpha:1.0)
        let colors = [startColor, endColor]
        let gradient = GradientButton.Gradient(colors: colors, endPoint: .init(x: 0, y: 1))
        button.setGradient(gradient, for: .normal)

        var highlight = gradient
        highlight.colors = colors.map({ $0.withAlphaComponent(0.8) })
        button.setGradient(highlight, for: .highlighted)

        button.cornerRadius = 6
        button.setTitle("Button with vertical gradient", for: .normal)

        return button
    }
}

