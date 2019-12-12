import UIKit

open class GradientButton: UIButton {
    @IBInspectable
    open var cornerRadius: CGFloat = Appearance.cornerRadiusHalfHeight

    public static var defaultAppearance = Appearance()

    private lazy var appearance = Appearance()

    override public class var layerClass: AnyClass {
        return GradientButtonLayer.self
    }
    private var gradientLayer: GradientButtonLayer {
        guard let gradientLayer =  layer as? GradientButtonLayer else {
            fatalError()
        }

        return gradientLayer
    }

    open override var isEnabled: Bool {
        didSet {
            if isEnabled != oldValue {
                updateAppearance()
            }
        }
    }
    open override var isHighlighted: Bool {
        didSet {
            if isHighlighted != oldValue {
                updateAppearance()
            }
        }
    }
    open override var isSelected: Bool {
        didSet {
            if isSelected != oldValue {
                updateAppearance()
            }
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        updateAppearance()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        updateAppearance()
    }

    open func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        defer {
            if state == self.state {
                updateGradient()
            }
        }

        guard let backgroundColor = color else {
            appearance.setGradient(nil, for: state)
            return
        }
        let gradient = Gradient(colors: [backgroundColor])
        appearance.setGradient(gradient, for: state)
    }

    open func backgroundColor(for state: UIControl.State) -> UIColor? {
        let gradient = self.gradient(for: state)
        return gradient?.colors.first
    }

    open func setGradient(_ gradient: Gradient?, for state: UIControl.State) {
        appearance.setGradient(gradient, for: state)

        if state == self.state {
            updateGradient()
        }
    }

    open func gradient(for state: UIControl.State) -> Gradient? {
        appearance.gradient(for: state) ?? Self.defaultAppearance.gradient(for: state)
    }

    open func setBorder(_ border: Border?, for state: UIControl.State) {
        appearance.setBorder(border, for: state)

        if state == self.state {
            updateBorder()
        }
    }

    open func border(for state: UIControl.State) -> Border? {
        appearance.border(for: state) ?? Self.defaultAppearance.border(for: state)
    }

    open func setShadow(_ shadow: NSShadow?, for state: UIControl.State) {
        appearance.setShadow(shadow, for: state)

        if state == self.state {
            updateShadow()
        }
    }

    open func shadow(for state: UIControl.State) -> NSShadow? {
        appearance.shadow(for: state) ?? Self.defaultAppearance.shadow(for: state)
    }

    private func updateAppearance() {
        updateGradient()
        updateBorder()
        updateShadow()
    }

    private func updateGradient() {
        var gradientValue: Gradient? = appearance.gradient(for: state) ?? Self.defaultAppearance.gradient(for: state)
        if gradientValue == nil {
            gradientValue = appearance.gradient(for: .normal) ?? Self.defaultAppearance.gradient(for: .normal)
        }

        guard let currentGradient = gradientValue else {
            gradientLayer.colors = nil
            return
        }

        gradientLayer.colors = currentGradient.cgColors
        gradientLayer.locations = currentGradient.locations as [NSNumber]?
        gradientLayer.startPoint = currentGradient.startPoint
        gradientLayer.endPoint = currentGradient.endPoint
    }

    private func updateBorder() {
        var borderValue: Border? = appearance.border(for: state) ?? Self.defaultAppearance.border(for: state)
        if borderValue == nil {
            borderValue = appearance.border(for: .normal) ?? Self.defaultAppearance.border(for: .normal)
        }

        guard let currentBorder = borderValue else {
            gradientLayer.borderColor = nil
            gradientLayer.borderWidth = 0
            return
        }

        gradientLayer.borderColor = currentBorder.color.cgColor
        gradientLayer.borderWidth = currentBorder.width
    }

    private func updateShadow() {
        var shadowValue: NSShadow? = appearance.shadow(for: state) ?? Self.defaultAppearance.shadow(for: state)
        if shadowValue == nil {
            shadowValue = appearance.shadow(for: .normal) ?? Self.defaultAppearance.shadow(for: .normal)
        }

        guard let currentShadow = shadowValue,
            let shadowColor = currentShadow.shadowColor as? UIColor else {
            gradientLayer.shadowColor = UIColor.clear.cgColor
            gradientLayer.shadowOffset = .zero
            gradientLayer.shadowRadius = 0
            gradientLayer.shadowOpacity = 0
            return
        }

        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        shadowColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        gradientLayer.shadowColor = UIColor(red: r, green: g, blue: b, alpha: 1).cgColor
        gradientLayer.shadowOpacity = Float(a)
        gradientLayer.shadowOffset = currentShadow.shadowOffset
        gradientLayer.shadowRadius = currentShadow.shadowBlurRadius
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        if cornerRadius == Appearance.cornerRadiusHalfHeight &&
            gradientLayer.cornerRadius != bounds.height / 2 {
            gradientLayer.cornerRadius = bounds.height / 2
        }
    }
}
