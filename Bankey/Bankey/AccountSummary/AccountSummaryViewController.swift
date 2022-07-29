//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 28/07/22.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts: [AccountSummaryCell.ViewModel] = []
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
    
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            size.width = UIScreen.main.bounds.width
            header.frame.size = size
        tableView.tableHeaderView = header
    }
}

extension AccountSummaryViewController {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        //registrar a cell a tableview
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as? AccountSummaryCell else { return UITableViewCell() }
        
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Basic Savings")
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Visa Avion Card")
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver")

        accounts.append(savings)
        accounts.append(visa)
        accounts.append(investment)
    }
}


