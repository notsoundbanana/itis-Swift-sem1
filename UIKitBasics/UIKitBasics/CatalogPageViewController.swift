import UIKit

class CatalogPageViewController: UIViewController {
    var pageNumber: Int = 1

    @IBOutlet var pageNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        pageNumberLabel.text = "PAGE: \(pageNumber)"
    }

    @IBAction func browseCatalogButtonDidTap(_ sender: Any) {
        let browseVC: CatalogPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CatalogPageViewController") as! CatalogPageViewController
        browseVC.pageNumber = pageNumber + 1
        navigationController?.pushViewController(browseVC, animated: true)
    }
}
