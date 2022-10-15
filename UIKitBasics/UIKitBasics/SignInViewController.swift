import UIKit

class SignInViewController: UIViewController {

    private let LOGIN = "admin"
    private let PASSWORD = "admin"

    @IBOutlet var usernameTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInButtonDidTap(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if (username != LOGIN || password != PASSWORD){
            let alert = UIAlertController(title: "Error", message: "Wrong username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let mainTabBarController = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }

            let homeNVC = mainTabBarController.viewControllers![0] as! UINavigationController
            let homeVC = homeNVC.topViewController as! HomeViewController
            homeVC.username = usernameTextField.text!

            let profileNVC = mainTabBarController.viewControllers![1] as! UINavigationController
            let profileVC = profileNVC.topViewController as! ProfileViewController
            profileVC.username = usernameTextField.text!

            mainTabBarController.modalPresentationStyle = .fullScreen

            present(mainTabBarController, animated: true, completion: nil)
        }
    }

}
