//
//  TableViewCell.swift
//  Homework6
//
//  Created by Daniil Chemaev on 19.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private let nameLabel: UILabel = .init()
    private let colorsLabel: UILabel = .init()
    private let storagesLabel: UILabel = .init()
    private let pricesLabel: UILabel = .init()
    

    func set(phone: Phone) {
        nameLabel.text = phone.name
        colorsLabel.text = phone.colors
        storagesLabel.text = phone.storage
        pricesLabel.text = phone.price
    }

    private func setup() {
//        nameLabel.font = .boldSystemFont(ofSize: 20)
//        ageLabel.font = .monospacedDigitSystemFont(ofSize: 17, weight: .regular)
//        let limbsLabel = UILabel()
//        limbsLabel.text = "# of limbs:"
//        let limbsStackView = UIStackView(
//            arrangedSubviews: [ limbsLabel, limbsNumberImageView ]
//        )
//        limbsStackView.spacing = 10
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel, colorsLabel, storagesLabel, pricesLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        limbsNumberImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//            limbsNumberImageView.widthAnchor.constraint(equalToConstant: 30),
//            limbsNumberImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}

