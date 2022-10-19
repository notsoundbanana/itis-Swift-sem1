import UIKit

class AnimalPagelViewController: UIViewController {

    @IBOutlet var animelUIImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        animelUIImageView.image = UIImage(named: String(Int.random(in: 1...3)))
        setConstraints()
    }
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setConstraints() {
        animelUIImageView.contentMode = .scaleAspectFit
        animelUIImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animelUIImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            animelUIImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            animelUIImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animelUIImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
