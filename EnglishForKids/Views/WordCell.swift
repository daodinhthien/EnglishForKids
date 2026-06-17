//
//  WordCell.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import UIKit

class WordCell: UITableViewCell {
    static let identifier = "WordCell"

    private let emojiLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 36)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let englishLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 18, weight: .bold)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let vietnameseLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .secondaryLabel
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let speakerIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "speaker.wave.2.fill"))
        iv.tintColor = .systemBlue
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .secondarySystemBackground
        v.layer.cornerRadius = 12
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(cardView)
        [emojiLabel, englishLabel, vietnameseLabel, speakerIcon].forEach { cardView.addSubview($0) }

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),

            emojiLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            emojiLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            emojiLabel.widthAnchor.constraint(equalToConstant: 44),

            englishLabel.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 12),
            englishLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            englishLabel.trailingAnchor.constraint(equalTo: speakerIcon.leadingAnchor, constant: -8),

            vietnameseLabel.leadingAnchor.constraint(equalTo: englishLabel.leadingAnchor),
            vietnameseLabel.topAnchor.constraint(equalTo: englishLabel.bottomAnchor, constant: 4),
            vietnameseLabel.trailingAnchor.constraint(equalTo: englishLabel.trailingAnchor),

            speakerIcon.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            speakerIcon.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            speakerIcon.widthAnchor.constraint(equalToConstant: 24),
            speakerIcon.heightAnchor.constraint(equalToConstant: 24),
        ])
    }

    func configure(with word: Word) {
        emojiLabel.text = word.emoji
        englishLabel.text = word.english
        vietnameseLabel.text = word.vietnamese
    }
}
