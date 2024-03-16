//
//  FlightCell.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 08/03/24.
//

import UIKit

class FlightCell: UITableViewCell {

    static let identifier = "FlightCell"
    private let dateFormatter = DateFormatter()

    private (set) var flight: Flight!
    
    //MARK: - UI Components
    public var originCountryLabel: UILabel = {
        let originCountryLabel = UILabel()
        originCountryLabel.textColor = .label
        originCountryLabel.font = .systemFont(ofSize: 22, weight: .bold)
        originCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        return originCountryLabel
    }()
    
    public var originCityLabel: UILabel = {
        let originCityLabel = UILabel()
        originCityLabel.textColor = .label
        originCityLabel.font = .systemFont(ofSize: 16, weight: .regular)
        originCityLabel.translatesAutoresizingMaskIntoConstraints = false
        return originCityLabel
    }()
    
    private var flightIcon: UIImageView = {
        var flightIcon = UIImageView()
        flightIcon.contentMode = .scaleAspectFit
        flightIcon.image = UIImage(named: "plane")
        flightIcon.translatesAutoresizingMaskIntoConstraints = false
        flightIcon.tintColor = .label
        return flightIcon
    }()
    
    public var destinationCountryLabel: UILabel = {
        let destinationCountryLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 10))
        destinationCountryLabel.textColor = .label
        destinationCountryLabel.font = .systemFont(ofSize: 22, weight: .bold)
        destinationCountryLabel.textAlignment = .right
        destinationCountryLabel.translatesAutoresizingMaskIntoConstraints = false
        return destinationCountryLabel
    }()
    
    public var destinationCityLabel: UILabel = {
        let destinationCityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 10))
        destinationCityLabel.textColor = .label
        destinationCityLabel.textAlignment = .right
        destinationCityLabel.font = .systemFont(ofSize: 16, weight: .regular)
        destinationCityLabel.translatesAutoresizingMaskIntoConstraints = false
        return destinationCityLabel
    }()
    
    public var dateLabel: UILabel = {
       let dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        dateLabel.textColor = .label
        dateLabel.font = .systemFont(ofSize: 16, weight: .medium)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    public var passengerLabel: UILabel = {
        let passengerLabel = UILabel()
        passengerLabel.textColor = .label
        passengerLabel.font = .systemFont(ofSize: 16, weight: .medium)
        passengerLabel.translatesAutoresizingMaskIntoConstraints = false
        return passengerLabel
    }()
    
    private var originLabelslVStackView: UIStackView = {
       let originLabelslVStackView = UIStackView()
        originLabelslVStackView.axis = .vertical
        originLabelslVStackView.translatesAutoresizingMaskIntoConstraints = false
        originLabelslVStackView.distribution = .fillEqually
        originLabelslVStackView.spacing = 10
        return originLabelslVStackView
    }()
    
    private var destinationLabelsVStackView: UIStackView = {
       let destinationLabelsVStackView = UIStackView()
        destinationLabelsVStackView.axis = .vertical
        destinationLabelsVStackView.distribution = .fillEqually
        destinationLabelsVStackView.spacing = 10
        destinationLabelsVStackView.translatesAutoresizingMaskIntoConstraints = false
        return destinationLabelsVStackView
    }()
    
    private var footerLabelsHStackView: UIStackView = {
       let footerLabelsHStackView = UIStackView()
        footerLabelsHStackView.axis = .horizontal
        footerLabelsHStackView.distribution = .equalSpacing
        footerLabelsHStackView.spacing = 10
        footerLabelsHStackView.translatesAutoresizingMaskIntoConstraints = false
        return footerLabelsHStackView
    }()
    
    private var containerVStackView: UIStackView = {
       let containerVStackView = UIStackView()
        containerVStackView.axis = .vertical
        containerVStackView.translatesAutoresizingMaskIntoConstraints = false
        return containerVStackView
    }()
    private var horizontalStackView: UIStackView = {
       let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalSpacing
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStackView
    }()
    
    private var lineView: UIView = {
        let lineView = UIView()
        lineView.layer.borderWidth = 1
        lineView.layer.borderColor = UIColor.lightGray.cgColor
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.alpha = 0.2
         return lineView
    }()
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with flight: Flight){
        dateFormatter.dateStyle = .long
        self.flight = flight
        self.originCountryLabel.text = flight.originCountry
        self.originCityLabel.text = flight.originCity
        self.destinationCityLabel.text = flight.destinationCity
        self.destinationCountryLabel.text = flight.destinationCountry
        if let date = flight.date {
            self.dateLabel.text = dateFormatter.string(from: date)
        } else {
            self.dateLabel.text = ""
        }
        if let passengers = flight.passengers{
            self.passengerLabel.text = passengers > 1 ? "\(passengers) passengers" : "\(passengers) passenger"
        } else {
            self.passengerLabel.text = ""
        }
    }
    
    //MARK: - SetupUI
    private func setupUI(){
        
        
        self.contentView.addSubview(containerVStackView)
        
        containerVStackView.addArrangedSubview(horizontalStackView)
        containerVStackView.addArrangedSubview(lineView)
        containerVStackView.addArrangedSubview(footerLabelsHStackView)
        
        horizontalStackView.addArrangedSubview(originLabelslVStackView)
        horizontalStackView.addArrangedSubview(flightIcon)
        horizontalStackView.addArrangedSubview(destinationLabelsVStackView)
        
        originLabelslVStackView.addArrangedSubview(originCountryLabel)
        originLabelslVStackView.addArrangedSubview(originCityLabel)
        
        destinationLabelsVStackView.addArrangedSubview(destinationCountryLabel)
        destinationLabelsVStackView.addArrangedSubview(destinationCityLabel)
        
        footerLabelsHStackView.addArrangedSubview(dateLabel)
        footerLabelsHStackView.addArrangedSubview(passengerLabel)
        
        
        NSLayoutConstraint.activate([
    
            containerVStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerVStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerVStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerVStackView.heightAnchor.constraint(equalToConstant: 120),
            
            flightIcon.widthAnchor.constraint(equalToConstant: 20),
            flightIcon.centerXAnchor.constraint(equalTo: horizontalStackView.centerXAnchor),
            
            
            horizontalStackView.heightAnchor.constraint(equalToConstant: 80),
            horizontalStackView.topAnchor.constraint(equalTo: containerVStackView.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: containerVStackView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: containerVStackView.trailingAnchor),
            
            lineView.leadingAnchor.constraint(equalTo: containerVStackView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: containerVStackView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
