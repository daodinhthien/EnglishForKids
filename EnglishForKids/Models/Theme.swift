import UIKit

enum Theme {
    // Purple accent (primary)
    static let purple       = UIColor(hex: "#534AB7")
    static let purpleLight  = UIColor(hex: "#EEEDFE")
    static let purpleMid    = UIColor(hex: "#AFA9EC")
    static let purpleDark   = UIColor(hex: "#3C3489")

    // Green (correct)
    static let green        = UIColor(hex: "#3B6D11")
    static let greenLight   = UIColor(hex: "#EAF3DE")

    // Red (wrong)
    static let red          = UIColor(hex: "#A32D2D")
    static let redLight     = UIColor(hex: "#FCEBEB")

    // Neutrals
    static let background   = UIColor.systemBackground
    static let surface      = UIColor.secondarySystemBackground
    static let border       = UIColor.separator
    static let textPrimary  = UIColor.label
    static let textSecondary = UIColor.secondaryLabel

    static let cornerMd: CGFloat = 10
    static let cornerLg: CGFloat = 14

    static func pillButton(title: String, target: Any?, action: Selector) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = purple
        btn.layer.cornerRadius = cornerMd
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        btn.configuration = config
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
}

extension UIColor {
    convenience init(hex: String) {
        var h = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if h.hasPrefix("#") { h = String(h.dropFirst()) }
        guard h.count == 6, let val = UInt64(h, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        self.init(
            red:   CGFloat((val >> 16) & 0xFF) / 255,
            green: CGFloat((val >> 8)  & 0xFF) / 255,
            blue:  CGFloat( val        & 0xFF) / 255,
            alpha: 1
        )
    }
}

// MARK: - Reusable chip button
class ChipButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        setTitleColor(Theme.textPrimary, for: .normal)
        backgroundColor = Theme.surface
        layer.cornerRadius = 18
        layer.borderWidth = 0.5
        layer.borderColor = Theme.border.cgColor
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        configuration = config
    }
    required init?(coder: NSCoder) { fatalError() }

    func setUsed(_ used: Bool) {
        alpha = used ? 0.35 : 1
        isUserInteractionEnabled = !used
    }

    func setSelected(_ sel: Bool) {
        backgroundColor = sel ? Theme.purpleLight : Theme.surface
        layer.borderColor = sel ? Theme.purpleMid.cgColor : Theme.border.cgColor
        setTitleColor(sel ? Theme.purpleDark : Theme.textPrimary, for: .normal)
    }

    func setMatched() {
        backgroundColor = Theme.greenLight
        layer.borderColor = Theme.green.cgColor
        setTitleColor(Theme.green, for: .normal)
        isUserInteractionEnabled = false
    }

    func setWrong() {
        backgroundColor = Theme.redLight
        layer.borderColor = Theme.red.cgColor
        setTitleColor(Theme.red, for: .normal)
    }
}
