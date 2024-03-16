//
//  FifthViewController.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 11/03/24.
//

import UIKit
class FifthStepView: UIViewController {
    
    var item: Flight? = nil
    
    let fifthStepViewModel = FifthStepViewModel()
    
    lazy private var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 120
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.identifier)
        return tableView
    }()
    
    lazy private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Your request was received"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.backgroundColor = .systemBackground
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy private var nextButton: UIButton = {
       let nextButton = UIButton()
        nextButton.setTitle("Finish", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.configuration = .filled()
        return nextButton
    }()
    
    lazy private var VStackView: UIStackView = {
       let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.spacing = 10
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        VStackView.backgroundColor = .systemBackground
        VStackView.distribution = .equalSpacing
        return VStackView
    }()
    
    lazy private var HeaderVStackView: UIStackView = {
       let HeaderVStackView = UIStackView()
        HeaderVStackView.axis = .vertical
        HeaderVStackView.spacing = 10
        HeaderVStackView.translatesAutoresizingMaskIntoConstraints = false
        HeaderVStackView.backgroundColor = .systemBackground
        HeaderVStackView.distribution = .equalSpacing
        return HeaderVStackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        setupUI()
    }

    
    private func setupUI(){
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        
        view.addSubview(VStackView)
        
        HeaderVStackView.addArrangedSubview(tableView)
        HeaderVStackView.addArrangedSubview(titleLabel)

        VStackView.addArrangedSubview(HeaderVStackView)
        VStackView.addArrangedSubview(nextButton)
        
        NSLayoutConstraint.activate([
        
            VStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 120),
            VStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            VStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            VStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: VStackView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: VStackView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: VStackView.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 120),
            
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

    @objc private func nextButtonPressed() {
        fifthStepViewModel.save(flight: item!)
        navigationController?.popToRootViewController(animated: true)
    }
    
 
}

extension FifthStepView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier, for: indexPath) as? FlightCell else {fatalError("cannot dequeue cell for fifth vc")}
        if let item = item {
            cell.configure(with: item)
        }
        return cell
    }
    
    
}
