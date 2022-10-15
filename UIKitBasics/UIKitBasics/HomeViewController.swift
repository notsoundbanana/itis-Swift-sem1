import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    var username: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        greetingLabel.text = "Hello, \(username)"
    }

    @IBAction func browseCatalogButtonDidTap(_ sender: Any) {
        let browseVC: CatalogPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
        navigationController?.pushViewController(browseVC, animated: true)
    }

    @IBAction func animalImagesButtonDidTap(_ sender: Any) {
        let animalVC: AnimalPagelViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AnimalPagelViewController") as! AnimalPagelViewController
        present(animalVC, animated: true)
        
    }
}
