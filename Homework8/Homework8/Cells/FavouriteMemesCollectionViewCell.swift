//
//  FavouriteMemesCollectionViewCell.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//


import UIKit

class FavouriteMemesCollectionViewCell: UICollectionViewCell {

    private var dataTask: URLSessionDataTask?

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
        super.init(coder: coder)

        setupView()
        setConstraints()
    }

    func setupView(){
        backgroundColor = .none
        addSubview(favouriteMemeImageView)
    }

    func configureCell(imageName: String){
        loadImage(url: URL(string: imageName)!)
        favouriteMemeImageView.contentMode = .scaleToFill
    }

    private func loadImage(url: URL) {
        favouriteMemeImageView.image = nil
        dataTask?.cancel()
        let urlRequest = URLRequest(
           url: url,
           cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        dataTask = URLSession.shared
           .dataTask(with: urlRequest) { [favouriteMemeImageView] data, _, _ in
               guard let data else {
                   return
               }

               let image = UIImage(data: data)
               DispatchQueue.main.async { [favouriteMemeImageView] in
                   guard let image else { return }
                   favouriteMemeImageView.image = image
               }
           }
        dataTask?.resume()
        }

    func setConstraints(){
        NSLayoutConstraint.activate([
            favouriteMemeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            favouriteMemeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            favouriteMemeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            favouriteMemeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
