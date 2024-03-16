//
//  FourthStepViewController.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 11/03/24.
//

import UIKit

class FourthStepView: UIViewController {

    var item: Flight? = nil {
        didSet{
            item?.passengers = 1
        }
    }
    let pickerData = [1, 2, 3, 4, 5]
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.identifier)
        tableView.isScrollEnabled = false
        tableView.separatorColor = .white
        tableView.rowHeight = 120
        return tableView
    }()
    
    private let VStackView: UIStackView = {
       let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .equalSpacing
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        return VStackView
    }()
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "How many passengers?"
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private var pickerNumber: UIPickerView = {
       let pickerNumber = UIPickerView()
        return pickerNumber
    }()
    
    private var nextButton: UIButton = {
       let nextButton = UIButton()
        nextButton.configuration = .filled()
        nextButton.setTitle("Next", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        nextButton.layer.cornerRadius = 5
        return nextButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        pickerNumber.delegate = self
        pickerNumber.dataSource = self
        setupUI()
    }
    private func setupUI(){
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)

        view.addSubview(tableView)
        view.addSubview(VStackView)
        VStackView.addArrangedSubview(titleLabel)
        VStackView.addArrangedSubview(pickerNumber)
        VStackView.addArrangedSubview(nextButton)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 120),
            
            VStackView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            VStackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            VStackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            VStackView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10),
            
            
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func nextButtonPressed() {
        let fifthVC = FifthStepView()
        fifthVC.item = item
        navigationController?.pushViewController(fifthVC, animated: true)
    }
}

extension FourthStepView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier, for: indexPath) as? FlightCell else {fatalError("cannot dequeue cell for fourthvc")}
        if let item = item {
            cell.configure(with: item)
        }
        return cell
    }
}

extension FourthStepView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        item?.passengers = pickerData[row]
        tableView.reloadData()
    }
    
}
