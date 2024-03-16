//
//  SecondStepViewController.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 09/03/24.
//

import UIKit
class SecondStepView: UIViewController {
    
    var item: Flight? = nil
    
    
    //MARK: - UI COMPONENTS
    var dropdown: DropDownView?
    var secondStepViewModel = SecondStepViewModel()
    
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
    
    private let titleStep: UILabel = {
        let title = UILabel()
        title.text = "Where will you be flying to?"
        title.font = .systemFont(ofSize: 26, weight: .bold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        return title
    }()
    
    private var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.configuration = .filled()
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .systemGray
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.isEnabled = false
        nextButton.layer.cornerRadius = 5
        return nextButton
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        dropdown = DropDownView(titleText: "Select a country", subtitleText: "Country selected", options: secondStepViewModel.countries)
        dropdown!.delegate = self
        setupUI()
    }
    func setupUI(){
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        dropdown?.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        view.addSubview(dropdown!)
        view.addSubview(titleStep)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            tableView.heightAnchor.constraint(equalToConstant: 120),
            
            titleStep.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20),
            titleStep.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            titleStep.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),

            dropdown!.topAnchor.constraint(equalTo: self.titleStep.bottomAnchor, constant: 50),
            dropdown!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            dropdown!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            
            nextButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10),
            nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    
    @objc func nextButtonPressed() {
        let thirdStepVC = ThirdStepView()
        item?.destinationCountry = secondStepViewModel.countrySelected
        item?.destinationCity = secondStepViewModel.citySelected
        thirdStepVC.item = item
        navigationController?.pushViewController(thirdStepVC, animated: true)
    }
}



extension SecondStepView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier, for: indexPath) as? FlightCell else {fatalError("Cannot dequeue reusable cell in SecondStep VC")}
        if let item = item {
            cell.configure(with: item)
        }
        return cell
    }

}

extension SecondStepView: DropDownViewDelegate{
    func onSelectItem(at index: (Int)) {
        secondStepViewModel.selectingDestination(at: index)
        nextButton.isEnabled = true
        nextButton.backgroundColor = .systemBlue
    }

}
