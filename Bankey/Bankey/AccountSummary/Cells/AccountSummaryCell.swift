//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 28/07/22.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension AccountSummaryCell {
    
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .systemCyan
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.text = "Account name"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = .preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .center
        balanceLabel.text = "Some balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .center
        balanceAmountLabel.text = "$232,232.02"
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = UIImage(systemName: "chevron.right")?.withTintColor(UIColor(named: "color")!, renderingMode: .alwaysOriginal)
        
        contentView.addSubview(typeLabel) //importante: adicionar ao contentView
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        contentView.addSubview(balanceStackView)
        
        contentView.addSubview(chevronImageView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2)
        ])
        NSLayoutConstraint.activate([
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4)
        ])
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2)
        ])
        NSLayoutConstraint.activate([
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4)
        ])
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
    }
    
}
