//
//  ThirdStepViewController.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 09/03/24.
//

import UIKit

class ThirdStepView: UIViewController {

    var item: Flight? = nil

    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .white
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.identifier)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 120
        return tableView
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        return datePicker
    }()
    
    private let titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.text = "Select date"
        titleLabel.font = .systemFont(ofSize: 26, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.configuration = .filled()
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .systemGray
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 5
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        
        datePicker.addTarget(self, action: #selector(datePickerPressed), for: .valueChanged)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)

        view.addSubview(tableView)
        view.addSubview(titleLabel)
        view.addSubview(datePicker)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: self.titleLabel.layoutMarginsGuide.bottomAnchor, constant: 10),
            datePicker.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: 120),
            
            nextButton.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

    @objc private func nextButtonPressed() {
        let fourthVC = FourthStepView()
        item?.date = datePicker.date
        fourthVC.item = item
        navigationController?.pushViewController(fourthVC, animated: true)
        item = nil
    }
    
    @objc private func datePickerPressed() {
        presentedViewController?.dismiss(animated: true)
    }
}

extension ThirdStepView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier, for: indexPath) as? FlightCell else {fatalError("cannot dequeue flight cell in thirvc")}
        if let item = item {
            cell.configure(with: item)
        }
        return cell
    }
    
    
}
