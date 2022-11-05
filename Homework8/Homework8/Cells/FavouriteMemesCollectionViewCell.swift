//
//  FavouriteMemesCollectionViewCell.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//


import UIKit

class FavouriteMemesCollectionViewCell: UICollectionViewCell {

    private let favouriteMemeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        backgroundColor = .white
        addSubview(favouriteMemeImageView)
    }

    func configureCell(imageName: String){
        favouriteMemeImageView.image = UIImage(named: imageName)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            favouriteMemeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            favouriteMemeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            favouriteMemeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            favouriteMemeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
}
