//
//  ViewController.swift
//  Homework8
//
//  Created by Daniil Chemaev on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemGray6
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
    }

    private let sections = MockData.shared.pageData

    private func setupViews() {
        view.backgroundColor = .systemGray6
        title = "My Memes"

        view.addSubview(collectionView)
        collectionView.register(FavouriteMemesCollectionViewCell.self, forCellWithReuseIdentifier: "FavouriteMemesCollectionViewCell")
        collectionView.register(MemesCollectionViewCell.self, forCellWithReuseIdentifier: "MemesCollectionViewCell")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")

        collectionView.collectionViewLayout = createLayout()
    }

    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Create Layout

extension ViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {

        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .favouriteMemes(_):
                return self.createFavouriteMemesSection()
            case .memes(_):
                return self.createMemesSection()
            }
        }
    }

    private func createFavouriteMemesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(320)
            ),
            repeatingSubitem: item, count: 1
        )

        let section = NSCollectionLayoutSection(
            group: group
        )
        section.orthogonalScrollingBehavior = .groupPaging

        section.boundarySupplementaryItems = [supplementaryHeaderItem()]

        return section
    }

    private func createMemesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(240)
            ),
            repeatingSubitem: item, count: 1
        )
        let section = NSCollectionLayoutSection(
                group: group
        )

        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        
        return section
    }

    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .fractionalWidth(0.1)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

//MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {

}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {

        case .favouriteMemes(let favouriteMeme):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteMemesCollectionViewCell", for: indexPath) as? FavouriteMemesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: favouriteMeme[indexPath.row].image)
            return cell

        case .memes(let meme):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemesCollectionViewCell", for: indexPath) as? MemesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(memeName: meme[indexPath.row].title, imageName: meme[indexPath.row].image)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplementaryView

            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

//MARK: Set Constraints

extension ViewController {

    private func setConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }

}
