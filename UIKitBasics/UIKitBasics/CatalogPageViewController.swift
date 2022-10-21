import UIKit

class CatalogPageViewController: UIViewController {
    
    var pageNumber: Int = 1
    @IBOutlet var pageNumberLabel: UILabel!
    @IBOutlet var browseCatalogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageNumberLabel.text = "PAGE: \(pageNumber)"
        setConstraints()
    }
    
    @IBAction func browseCatalogButtonDidTap(_ sender: Any) {
        let browseVC: CatalogPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
        browseVC.pageNumber = pageNumber + 1
        navigationController?.pushViewController(browseVC, animated: true)
    }
    
    private func setConstraints() {
        
        pageNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pageNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            pageNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            pageNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        browseCatalogButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            browseCatalogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            browseCatalogButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
