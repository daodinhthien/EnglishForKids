import UIKit

class FillBlankViewController: UIViewController {

    private let exercises = AppData.fillExercises
    private var currentIndex = 0
    private var score = 0

    private let questionCard = UIView()
    private let hintLabel = UILabel()
    private let sentenceStack = UIStackView()
    private var blankField: UITextField!
    private let wordBankStack = UIStackView()
    private let resultLabel = UILabel()
    private let progressLabel = UILabel()
    private var wordChips: [ChipButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Điền vào chỗ trống"
        view.backgroundColor = Theme.background
        setupUI()
        loadQuestion()
    }

    private func setupUI() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(content)
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: scrollView.topAnchor),
            content.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            content.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        // Progress
        progressLabel.font = .systemFont(ofSize: 14)
        progressLabel.textColor = Theme.textSecondary
        progressLabel.textAlignment = .center

        // Question card
        questionCard.backgroundColor = Theme.surface
        questionCard.layer.cornerRadius = Theme.cornerLg
        questionCard.layer.borderWidth = 0.5
        questionCard.layer.borderColor = Theme.border.cgColor

        hintLabel.font = .systemFont(ofSize: 13)
        hintLabel.textColor = Theme.textSecondary
        hintLabel.numberOfLines = 0

        sentenceStack.axis = .horizontal
        sentenceStack.spacing = 6
        sentenceStack.alignment = .center
        sentenceStack.flexibleStack()

        let cardStack = UIStackView(arrangedSubviews: [hintLabel, sentenceStack])
        cardStack.axis = .vertical
        cardStack.spacing = 14
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        questionCard.addSubview(cardStack)
        NSLayoutConstraint.activate([
            cardStack.topAnchor.constraint(equalTo: questionCard.topAnchor, constant: 20),
            cardStack.leadingAnchor.constraint(equalTo: questionCard.leadingAnchor, constant: 16),
            cardStack.trailingAnchor.constraint(equalTo: questionCard.trailingAnchor, constant: -16),
            cardStack.bottomAnchor.constraint(equalTo: questionCard.bottomAnchor, constant: -20),
        ])

        // Word bank
        let bankLabel = UILabel()
        bankLabel.text = "Chọn từ:"
        bankLabel.font = .systemFont(ofSize: 14, weight: .medium)
        bankLabel.textColor = Theme.textSecondary

        wordBankStack.axis = .horizontal
        wordBankStack.spacing = 8
        wordBankStack.flexibleStack()

        // Result
        resultLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        resultLabel.textAlignment = .center
        resultLabel.layer.cornerRadius = Theme.cornerMd
        resultLabel.clipsToBounds = true
        resultLabel.alpha = 0

        let mainStack = UIStackView(arrangedSubviews: [progressLabel, questionCard, bankLabel, wordBankStack, resultLabel])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: content.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -16),
            mainStack.bottomAnchor.constraint(lessThanOrEqualTo: content.bottomAnchor, constant: -20),
        ])

        resultLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func loadQuestion() {
        guard currentIndex < exercises.count else {
            showFinalScore(); return
        }
        let ex = exercises[currentIndex]
        progressLabel.text = "Câu \(currentIndex + 1) / \(exercises.count)  •  ⭐ \(score)"
        hintLabel.text = ex.hint

        // Build sentence parts
        sentenceStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        blankField = nil
        for part in ex.parts {
            if part == "__" {
                let field = UITextField()
                field.placeholder = "..."
                field.textAlignment = .center
                field.font = .systemFont(ofSize: 16, weight: .semibold)
                field.textColor = Theme.purpleDark
                field.borderStyle = .none
                field.layer.borderWidth = 2
                field.layer.borderColor = Theme.purpleMid.cgColor
                field.layer.cornerRadius = 6
                field.widthAnchor.constraint(equalToConstant: 100).isActive = true
                field.heightAnchor.constraint(equalToConstant: 36).isActive = true
                field.addTarget(self, action: #selector(checkAnswer), for: .editingChanged)
                sentenceStack.addArrangedSubview(field)
                blankField = field
            } else {
                let lbl = UILabel()
                lbl.text = part
                lbl.font = .systemFont(ofSize: 16)
                lbl.textColor = Theme.textPrimary
                lbl.numberOfLines = 0
                sentenceStack.addArrangedSubview(lbl)
            }
        }

        // Word bank chips
        wordBankStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        wordChips = []
        for word in ex.wordBank {
            let chip = ChipButton(title: word)
            chip.addTarget(self, action: #selector(chipTapped(_:)), for: .touchUpInside)
            wordBankStack.addArrangedSubview(chip)
            wordChips.append(chip)
        }

        resultLabel.alpha = 0
    }

    @objc private func chipTapped(_ sender: ChipButton) {
        guard let text = sender.title(for: .normal) else { return }
        wordChips.forEach { $0.setUsed(false) }
        blankField?.text = text
        sender.setUsed(true)
        checkAnswer()
    }

    @objc private func checkAnswer() {
        let ex = exercises[currentIndex]
        guard let input = blankField?.text?.trimmingCharacters(in: .whitespaces), !input.isEmpty else { return }
        let correct = input.lowercased() == ex.answer.lowercased()

        if correct {
            score += 1
            showResult(correct: true, message: "✅ Đúng rồi! \"\(ex.answer)\"")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.currentIndex += 1
                self.loadQuestion()
            }
        } else {
            showResult(correct: false, message: "❌ Sai rồi! Thử lại nhé!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.blankField?.text = ""
                self.wordChips.forEach { $0.setUsed(false) }
                UIView.animate(withDuration: 0.2) { self.resultLabel.alpha = 0 }
            }
        }
    }

    private func showResult(correct: Bool, message: String) {
        resultLabel.text = message
        resultLabel.backgroundColor = correct ? Theme.greenLight : Theme.redLight
        resultLabel.textColor = correct ? Theme.green : Theme.red
        UIView.animate(withDuration: 0.2) { self.resultLabel.alpha = 1 }
    }

    private func showFinalScore() {
        let vc = ScoreViewController(score: score, total: exercises.count, title: "Điền vào chỗ trống")
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - FlexibleStack helper
extension UIStackView {
    func flexibleStack() {
        isLayoutMarginsRelativeArrangement = true
        wrap()
    }
    func wrap() {
        // Enable wrapping for horizontal stacks
        if #available(iOS 15.0, *) {
            // Nothing needed; use system layout
        }
    }
}
