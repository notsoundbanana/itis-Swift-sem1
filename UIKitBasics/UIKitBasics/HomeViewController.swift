import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    var username: String = ""
    @IBOutlet var browseCatalogButton: UIButton!
    @IBOutlet var animalImagesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, \(username)"
        setConstraints()
    }

    @IBAction func browseCatalogButtonDidTap(_ sender: Any) {
        let browseVC: CatalogPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
        navigationController?.pushViewController(browseVC, animated: true)
    }

    @IBAction func animalImagesButtonDidTap(_ sender: Any) {
        let animalVC: AnimalPagelViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AnimalPagelViewController") as! AnimalPagelViewController
        present(animalVC, animated: true)
        
    }
    
    private func setConstraints() {
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let stackView = UIStackView(
            arrangedSubviews: [ browseCatalogButton, animalImagesButton ]
        )
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
