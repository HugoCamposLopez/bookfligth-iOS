//
//  ViewController.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 07/03/24.
//

import UIKit
import RealmSwift

class HomeView: UIViewController {
    let realm = try! Realm()
    var flights: Results<Flight>?
    
    let button: UIButton = {
        let button = UIButton()
        button.configuration?.baseBackgroundColor = .red
        button.configuration = .filled()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = button.frame.height / 2;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .black
        tableView.separatorInset.bottom = 2.0
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My flights"
        self.navigationItem.hidesBackButton = true

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        flights = realm.objects(Flight.self)
        setupUI()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI(){

        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.identifier)
        tableView.register(NoFlightsCell.self, forCellReuseIdentifier: NoFlightsCell.identifier)
        
        tableView.rowHeight = 120
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            
            button.widthAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
        ])
    }
    
    @objc func nextButtonTapped(){
        let vc = FirstStepView()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flights!.isEmpty {
              return 1
          } else {
              return flights!.count
          }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if flights!.isEmpty {
                  guard let cell = tableView.dequeueReusableCell(withIdentifier: NoFlightsCell.identifier, for: indexPath) as? NoFlightsCell else {
                      fatalError("NoFlightsCell no pudo cargar en HomeView")
                  }
                  return cell
              } else {
                  guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier, for: indexPath) as? FlightCell else {
                      fatalError("FlightCell no pudo cargar en HomeView")
                  }
                  let flight = flights![indexPath.row]
                  cell.configure(with: flight)
                  return cell
              }
    }

    
    
}
