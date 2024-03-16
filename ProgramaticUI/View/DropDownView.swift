//
//  DropDownView.swift
//  ProgramaticUI
//
//  Created by Nancy Silva on 09/03/24.
//

import UIKit
import DropDown

protocol DropDownViewDelegate: AnyObject {
    func onSelectItem(at index: (Int)) -> Void
}

class DropDownView: UIView {
    private var dropdown = DropDown()
    private var countries: [String]?

    weak var delegate: DropDownViewDelegate?
    
    private let titleDropDown: UILabel = {
       let titleDropDown = UILabel()
        titleDropDown.translatesAutoresizingMaskIntoConstraints = false
        titleDropDown.font = .systemFont(ofSize: 18, weight: .thin)
        titleDropDown.textColor = .label
        return titleDropDown
    }()
    
    private let countryName: UILabel = {
       let countryName = UILabel()
        countryName.textColor = .label
        countryName.font = .systemFont(ofSize: 16, weight: .semibold)
        countryName.translatesAutoresizingMaskIntoConstraints = false
        return countryName
    }()
    
    private var arrowIcon: UIButton = {
       let arrowIcon = UIButton()
        arrowIcon.setImage(UIImage(systemName: "arrowtriangle.down.circle.fill"), for: .normal)
        arrowIcon.contentMode = .scaleAspectFit
        arrowIcon.tintColor = .label
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        return arrowIcon
    }()
    
    init(titleText: String, subtitleText: String, options: [String]) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        titleDropDown.text = titleText
        countryName.text = subtitleText
        dropdown.dataSource = options
        self.setupUI()
        self.setupDropdown()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDropdown() {
        dropdown.anchorView = self
        dropdown.direction = .bottom
        dropdown.bottomOffset = CGPoint(x: 0, y: 50)
        arrowIcon.addTarget(self, action: #selector(arrowIconPressed), for: .touchUpInside)
        
        dropdown.selectionAction = {[weak self] index, item  in
            self?.countryName.text = item
            self?.delegate?.onSelectItem(at: index)
        }
        
        dropdown.cancelAction = { [unowned self] in
            arrowIcon.setImage(UIImage(systemName: "arrowtriangle.down.circle.fill"), for: .normal)
        }
    }
    
    private func setupUI(){
        addSubview(titleDropDown)
        addSubview(countryName)
        addSubview(arrowIcon)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.topAnchor),
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: 50),

            titleDropDown.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            titleDropDown.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            countryName.topAnchor.constraint(equalTo: titleDropDown.layoutMarginsGuide.bottomAnchor, constant: 10),
            countryName.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            arrowIcon.topAnchor.constraint(equalTo: self.topAnchor),
            arrowIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            arrowIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            arrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

    //MARK: - Actions
    @objc func arrowIconPressed() {
        dropdown.show()
        arrowIcon.setImage(UIImage(systemName: "arrowtriangle.up.circle.fill"), for: .normal)
    }
    
}
