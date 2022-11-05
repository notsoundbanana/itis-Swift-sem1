//
//  MemesCollectionViewCell.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import UIKit

class MemesCollectionViewCell: UICollectionViewCell {

    private let memeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let memeLabel: UILabel = {
        let label = UILabel()
        label.text = "Memes"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    func setupView(){
        clipsToBounds = true
//        backgroundColor = .white


        addSubview(memeImageView)
        addSubview(backgroundTitleView)
        addSubview(memeLabel)
    }

    func configureCell(memeName: String, imageName: String){
        memeLabel.text = memeName
        memeImageView.image = UIImage(named: imageName)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            memeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            memeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            memeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            memeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            backgroundTitleView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            memeLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            memeLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10)
        ])
    }
}

