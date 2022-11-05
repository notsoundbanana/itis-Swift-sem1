//
//  HeaderSupplementaryView.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        addSubview(headerLabel)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }


    func configureHeader(categoryName: String){
        headerLabel.text = categoryName
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}


