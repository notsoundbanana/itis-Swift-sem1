import UIKit


class ProfileViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!

    var username: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        greetingLabel.text = "Hello, \(username)"
    }
    
    @IBAction func signOutButtonDidTap(_ sender: Any) {
        guard let signInVC = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        signInVC.modalPresentationStyle = .fullScreen
    
        present(signInVC, animated: true, completion: nil)
    }
}
