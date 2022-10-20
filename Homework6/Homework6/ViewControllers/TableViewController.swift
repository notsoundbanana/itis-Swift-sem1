//
//  TableViewController.swift
//  Homework6
//
//  Created by Daniil Chemaev on 19.10.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private var supportedPhones: [Phone] = Data.getSupportedPhonesData()
    private var allPhones: [Phone] = Data.getAllPhonesData()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.register(
            TableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.supportedPhone.rawValue
        )

        tableView.register(
            TableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.phone.rawValue
        )

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    enum CellIdentifier: String {
        case supportedPhone
        case phone
    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        if indexPath.section == 0 {
            let phone = supportedPhones[indexPath.row]

            let cell = UITableViewCell(style: .value1, reuseIdentifier: CellIdentifier.supportedPhone.rawValue)

            var configuration = UIListContentConfiguration.valueCell()
            configuration.text = phone.name

            cell.contentConfiguration = configuration
            cell.selectionStyle = .none

            return cell
        }

        else {
            guard let cell = tableView.dequeueReusableCell( withIdentifier: CellIdentifier.phone.rawValue, for: indexPath) as? TableViewCell
            else {
                fatalError("Could not deque cell of type \(TableViewCell.self)")
            }

            let phone = allPhones[indexPath.row]
            cell.set(phone: phone)
            return cell
        }
    }

    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        section == 0 ? supportedPhones.count : allPhones.count
    }

    func tableView( _ tableView: UITableView, viewForHeaderInSection section: Int ) -> UIView? {
        let stackView = UIStackView()
        let label = UILabel()
        label.text = section == 0 ? "Supported:" : "All:"
        label.font = .boldSystemFont(ofSize: 30)
        stackView.addArrangedSubview(label)
        return stackView
    }

    func tableView( _ tableView: UITableView, heightForRowAt indexPath: IndexPath ) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 1) {
            tableView.deselectRow(at: indexPath, animated: true)
            allPhones[indexPath.row].printInfo()
        }
    }
}

