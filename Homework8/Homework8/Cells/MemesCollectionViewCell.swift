//
//  MemesCollectionViewCell.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import UIKit

class MemesCollectionViewCell: UICollectionViewCell {

    private var dataTask: URLSessionDataTask?

    private let memeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let memeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
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
        clipsToBounds = true

        addSubview(memeImageView)
        addSubview(backgroundTitleView)
        addSubview(memeLabel)
    }

    func configureCell(memeName: String, imageName: String){
        loadImage(url: URL(string: imageName)!)
        memeLabel.text = memeName
        memeImageView.contentMode = .scaleToFill
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

            backgroundTitleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
            backgroundTitleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            backgroundTitleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            backgroundTitleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            memeLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor, constant: 0),
            memeLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 12)
        ])
    }
}

