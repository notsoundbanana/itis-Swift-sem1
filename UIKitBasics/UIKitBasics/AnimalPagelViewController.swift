import UIKit

class AnimalPagelViewController: UIViewController {

    @IBOutlet var animelUIImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        animelUIImageView.image = UIImage(named: String(Int.random(in: 1...3)))
    }
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
