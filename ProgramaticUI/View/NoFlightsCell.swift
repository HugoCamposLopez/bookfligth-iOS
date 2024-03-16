//
//  NoFlightsCell.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 11/03/24.
//

import UIKit

class NoFlightsCell: UITableViewCell {

    static let identifier = "NoFlightsCell"
    public var title: UILabel = {
        let originCountryLabel = UILabel()
        originCountryLabel.textColor = .label
        originCountryLabel.font = .systemFont(ofSize: 22, weight: .bold)
        originCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        originCountryLabel.text = "No hay vuelvos agregados"
        originCountryLabel.textAlignment = .center
        return originCountryLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
}
