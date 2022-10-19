//
//  TableViewController.swift
//  Homework6
//
//  Created by Daniil Chemaev on 19.10.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private let tableView: UITableView = .init()

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let generateData = GenerateData()

        phones = generateData.getData()

        tableView.register(
            TableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.phone.rawValue
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    private var phones: [Phone] = []

    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        phones.count
    }

    enum CellIdentifier: String {
        case phone
        case text
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: CellIdentifier.phone.rawValue, for: indexPath
                )
                as? TableViewCell
        else {
            fatalError("Could not deque cell of type \(TableViewCell.self)")
        }

        let phone = phones[indexPath.row]
        cell.set(phone: phone)
        return cell
    }
}

