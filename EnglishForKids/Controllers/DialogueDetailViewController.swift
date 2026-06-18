import UIKit
import AVFoundation

class DialogueDetailViewController: UIViewController {

    private let topic: DialogueTopic
    private var tableView: UITableView!
    private var playButton: UIButton!
    private var synthesizer = AVSpeechSynthesizer()
    private var isPlaying = false
    private var currentLineIndex = 0
    private var playTimer: Timer?

    init(topic: DialogueTopic) {
        self.topic = topic
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = topic.label
        view.backgroundColor = Theme.background
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopPlayback()
    }

    private func setupUI() {
        // Header card
        let headerCard = makeHeaderCard()

        // TableView for chat lines
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(BubbleCell.self, forCellReuseIdentifier: BubbleCell.id)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80

        // Play button
        playButton = UIButton(type: .system)
        playButton.setTitle("▶  Nghe hội thoại", for: .normal)
        playButton.setTitle("⏹  Dừng lại", for: .selected)
        playButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        playButton.setTitleColor(Theme.purpleDark, for: .normal)
        playButton.backgroundColor = Theme.purpleLight
        playButton.layer.cornerRadius = Theme.cornerMd
        playButton.layer.borderWidth = 0.5
        playButton.layer.borderColor = Theme.purpleMid.cgColor
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        playButton.configuration = config
        playButton.addTarget(self, action: #selector(togglePlay), for: .touchUpInside)

        // Layout
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        [headerCard, tableView, playButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview($0)
        }
        view.addSubview(container)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            headerCard.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            headerCard.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            headerCard.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),

            tableView.topAnchor.constraint(equalTo: headerCard.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -12),

            playButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            playButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            playButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            playButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    private func makeHeaderCard() -> UIView {
        let card = UIView()
        card.backgroundColor = Theme.purpleLight
        card.layer.cornerRadius = Theme.cornerLg
        card.layer.borderWidth = 0.5
        card.layer.borderColor = Theme.purpleMid.cgColor

        let emojiLabel = UILabel()
        emojiLabel.text = topic.emoji
        emojiLabel.font = .systemFont(ofSize: 36)

        let titleLabel = UILabel()
        titleLabel.text = topic.title
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = Theme.purpleDark
        titleLabel.numberOfLines = 0

        let subtitleLabel = UILabel()
        subtitleLabel.text = topic.subtitle
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = Theme.purple

        let textStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStack.axis = .vertical
        textStack.spacing = 2

        let row = UIStackView(arrangedSubviews: [emojiLabel, textStack])
        row.axis = .horizontal
        row.spacing = 12
        row.alignment = .center
        row.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(row)
        NSLayoutConstraint.activate([
            row.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            row.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            row.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            row.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -14),
        ])
        return card
    }

    // MARK: - Playback

    @objc private func togglePlay() {
        if isPlaying { stopPlayback() } else { startPlayback() }
    }

    private func startPlayback() {
        isPlaying = true
        currentLineIndex = 0
        playButton.isSelected = true
        synthesizer.delegate = self
        speakCurrentLine()
    }

    private func stopPlayback() {
        isPlaying = false
        playTimer?.invalidate()
        synthesizer.stopSpeaking(at: .immediate)
        playButton.isSelected = false
        tableView.visibleCells.forEach { ($0 as? BubbleCell)?.setHighlighted(false) }
    }

    private func speakCurrentLine() {
        guard isPlaying, currentLineIndex < topic.lines.count else {
            stopPlayback(); return
        }
        let line = topic.lines[currentLineIndex]
        highlightLine(at: currentLineIndex)
        let utt = AVSpeechUtterance(string: line.english)
        utt.voice = AVSpeechSynthesisVoice(language: "en-US")
        utt.rate = 0.45
        synthesizer.speak(utt)
    }

    private func highlightLine(at index: Int) {
        tableView.visibleCells.forEach { ($0 as? BubbleCell)?.setHighlighted(false) }
        let ip = IndexPath(row: index, section: 0)
        tableView.scrollToRow(at: ip, at: .middle, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            (self.tableView.cellForRow(at: ip) as? BubbleCell)?.setHighlighted(true)
        }
    }
}

extension DialogueDetailViewController: UITableViewDataSource {
    func tableView(_ tv: UITableView, numberOfRowsInSection s: Int) -> Int { topic.lines.count }
    func tableView(_ tv: UITableView, cellForRowAt ip: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: BubbleCell.id, for: ip) as! BubbleCell
        cell.configure(with: topic.lines[ip.row])
        return cell
    }
}

extension DialogueDetailViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        (tableView.cellForRow(at: IndexPath(row: currentLineIndex, section: 0)) as? BubbleCell)?.setHighlighted(false)
        currentLineIndex += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.speakCurrentLine() }
    }
}

// MARK: - Bubble Cell

class BubbleCell: UITableViewCell {
    static let id = "BubbleCell"

    private let avatarLabel = UILabel()
    private let speakerLabel = UILabel()
    private let englishLabel = UILabel()
    private let vietnameseLabel = UILabel()
    private let bubbleView = UIView()
    private var isRight = false
    private var avatarLeading: NSLayoutConstraint!
    private var avatarTrailing: NSLayoutConstraint!
    private var bubbleLeading: NSLayoutConstraint!
    private var bubbleTrailing: NSLayoutConstraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        avatarLabel.font = .systemFont(ofSize: 28)
        avatarLabel.textAlignment = .center

        speakerLabel.font = .systemFont(ofSize: 11)
        speakerLabel.textColor = Theme.textSecondary

        englishLabel.font = .systemFont(ofSize: 14, weight: .medium)
        englishLabel.textColor = Theme.textPrimary
        englishLabel.numberOfLines = 0

        vietnameseLabel.font = .systemFont(ofSize: 12)
        vietnameseLabel.textColor = Theme.textSecondary
        vietnameseLabel.numberOfLines = 0

        bubbleView.layer.cornerRadius = 12
        bubbleView.layer.borderWidth = 0.5
        bubbleView.layer.borderColor = Theme.border.cgColor

        let textStack = UIStackView(arrangedSubviews: [englishLabel, vietnameseLabel])
        textStack.axis = .vertical
        textStack.spacing = 3
        textStack.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.addSubview(textStack)

        [avatarLabel, speakerLabel, bubbleView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            textStack.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: padding),
            textStack.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: padding),
            textStack.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -padding),
            textStack.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -padding),

            avatarLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            avatarLabel.widthAnchor.constraint(equalToConstant: 40),
            avatarLabel.heightAnchor.constraint(equalToConstant: 40),

            speakerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            bubbleView.topAnchor.constraint(equalTo: speakerLabel.bottomAnchor, constant: 2),
            bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bubbleView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.72),
        ])

        avatarLeading   = avatarLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        avatarTrailing  = avatarLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        bubbleLeading   = bubbleView.leadingAnchor.constraint(equalTo: avatarLabel.trailingAnchor, constant: 8)
        bubbleTrailing  = bubbleView.trailingAnchor.constraint(equalTo: avatarLabel.leadingAnchor, constant: -8)
    }

    func configure(with line: DialogueLine) {
        isRight = line.side == .right
        avatarLabel.text = line.avatar
        speakerLabel.text = line.speaker
        englishLabel.text = line.english
        vietnameseLabel.text = line.vietnamese

        if isRight {
            bubbleView.backgroundColor = Theme.purpleLight
            bubbleView.layer.borderColor = Theme.purpleMid.cgColor
            avatarLeading.isActive = false
            avatarTrailing.isActive = true
            bubbleLeading.isActive = false
            bubbleTrailing.isActive = true
            speakerLabel.textAlignment = .right
            [avatarLabel, speakerLabel, bubbleView].forEach { contentView.bringSubviewToFront($0) }
            // Speaker aligns to avatar's leading
            speakerLabel.trailingAnchor.constraint(equalTo: avatarLabel.leadingAnchor, constant: -8).isActive = true
        } else {
            bubbleView.backgroundColor = Theme.surface
            bubbleView.layer.borderColor = Theme.border.cgColor
            avatarTrailing.isActive = false
            avatarLeading.isActive = true
            bubbleTrailing.isActive = false
            bubbleLeading.isActive = true
            speakerLabel.textAlignment = .left
            speakerLabel.leadingAnchor.constraint(equalTo: avatarLabel.trailingAnchor, constant: 8).isActive = true
        }
    }

    func setHighlighted(_ on: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.bubbleView.transform = on ? CGAffineTransform(scaleX: 1.03, y: 1.03) : .identity
            self.bubbleView.backgroundColor = on ? Theme.purpleLight : (self.isRight ? Theme.purpleLight : Theme.surface)
        }
    }
}
