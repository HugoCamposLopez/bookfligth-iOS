
import UIKit

class FirstStepView: UIViewController {
 
    
    //MARK: - UI COMPONENTS
    var dropDown: DropDownView?
    var firstStepViewModel = FirstStepViewModel()
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
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Where are you now?"
        self.view.backgroundColor = .systemBackground
        dropDown = DropDownView(titleText: "Select a country", subtitleText: "Country selected", options: firstStepViewModel.countries)
        dropDown?.delegate = self
        setupUI()
    }
    
    //MARK: - Setup UI

    private func setupUI(){
        nextButton.addTarget(self, action:#selector(nextButtonPressed), for: .touchUpInside)
        
        view.addSubview(dropDown!)
        view.addSubview(nextButton)
        
        
        NSLayoutConstraint.activate([
            
            dropDown!.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            dropDown!.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 10),
            dropDown!.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            dropDown!.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10),
            nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])

    }
    
    @objc private func nextButtonPressed(){
        let vc = SecondStepView()
        vc.item = Flight()
        vc.item?.originCountry = firstStepViewModel.countrySelected
        vc.item?.originCity = firstStepViewModel.citySelected
        navigationController?.pushViewController(vc, animated: true)
    }

}


extension FirstStepView: DropDownViewDelegate {
    func onSelectItem(at index: (Int)) {
        firstStepViewModel.setValues(index: index)
        nextButton.isEnabled = true
        nextButton.backgroundColor = .systemBlue
    }
    
    
}
