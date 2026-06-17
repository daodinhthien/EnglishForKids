//
//  TopicCell.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import UIKit

class TopicCell: UICollectionViewCell {
    static let identifier = "TopicCell"

    private let emojiLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 48)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let nameLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .bold)
        l.textAlignment = .center
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let nameViLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 13)
        l.textAlignment = .center
        l.textColor = UIColor.white.withAlphaComponent(0.85)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let wordCountLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 11)
        l.textAlignment = .center
        l.textColor = UIColor.white.withAlphaComponent(0.75)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 8

        [emojiLabel, nameLabel, nameViLabel, wordCountLabel].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            emojiLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            nameViLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            nameViLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameViLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            wordCountLabel.topAnchor.constraint(equalTo: nameViLabel.bottomAnchor, constant: 4),
            wordCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            wordCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }

    func configure(with topic: Topic) {
        emojiLabel.text = topic.emoji
        nameLabel.text = topic.name
        nameViLabel.text = topic.nameVi
        wordCountLabel.text = "\(topic.words.count) từ"
        backgroundColor = UIColor(hex: topic.color)
    }
}

// MARK: - UIColor hex extension
extension UIColor {
    convenience init(hex: String) {
        var hexStr = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexStr.hasPrefix("#") { hexStr.removeFirst() }
        var rgb: UInt64 = 0
        Scanner(string: hexStr).scanHexInt64(&rgb)
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: 1
        )
    }
}
