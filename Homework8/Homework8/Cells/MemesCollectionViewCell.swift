//
//  MemesCollectionViewCell.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import UIKit

class MemesCollectionViewCell: UICollectionViewCell {

    private var dataTask: URLSessionDataTask?
    private var aspectRatioConstraint: NSLayoutConstraint?
    private let imageView: UIImageView = .init()
    private let label: UILabel = .init()
    private var workItem: DispatchWorkItem?

    private let memeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let memeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
        super.init(coder: coder)

        setupView()
        setConstraints()
    }

    func setupView(){
//        clipsToBounds = true
        memeImageView.translatesAutoresizingMaskIntoConstraints = false
        memeImageView.backgroundColor = .systemGray3
        addSubview(memeImageView)

        memeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(memeLabel)
    }

    func configureCell(memeName: String, imageName: String, imageSize: CGSize){
        loadImage(url: URL(string: imageName)!)
        setupRatio(imageSize: imageSize)
        memeLabel.text = memeName
        memeImageView.contentMode = .scaleAspectFit
    }

    private func loadImage(url: URL) {
        memeImageView.image = nil
        dataTask?.cancel()
        let urlRequest = URLRequest(
           url: url,
           cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        dataTask = URLSession.shared
           .dataTask(with: urlRequest) { [memeImageView] data, _, _ in
               guard let data else {
                   return
               }

               let image = UIImage(data: data)
               DispatchQueue.main.async { [memeImageView] in
                   guard let image else { return }
                   memeImageView.image = image
               }
           }
        dataTask?.resume()
        }


    func setConstraints(){
        NSLayoutConstraint.activate([
            memeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            memeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            memeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            memeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),

            memeLabel.leadingAnchor.constraint(equalTo: memeImageView.leadingAnchor, constant: 12),
            memeLabel.trailingAnchor.constraint(equalTo: memeImageView.trailingAnchor, constant: -12),
            memeLabel.bottomAnchor.constraint(equalTo: memeImageView.bottomAnchor, constant: -12),
        ])

        setupDefaultRatio()
    }

    private func setupDefaultRatio() {
        aspectRatioConstraint?.isActive = false
        aspectRatioConstraint = memeImageView.widthAnchor.constraint(
            equalTo: memeImageView.heightAnchor, multiplier: 1
        )
        aspectRatioConstraint?.isActive = true
    }

    private func setupRatio(imageSize: CGSize) {
        aspectRatioConstraint?.isActive = false
        aspectRatioConstraint = memeImageView.widthAnchor.constraint(
            equalTo: memeImageView.heightAnchor,
            multiplier: imageSize.width / imageSize.height,
            constant: -12
        )
        aspectRatioConstraint?.isActive = true
    }
}

