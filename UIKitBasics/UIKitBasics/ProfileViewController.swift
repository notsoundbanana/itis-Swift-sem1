import UIKit


class ProfileViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var signOutButton: UIButton!
    var username: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, \(username)"
        setConstraints()
    }
    
    @IBAction func signOutButtonDidTap(_ sender: Any) {
        guard let signInVC = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        signInVC.modalPresentationStyle = .fullScreen
    
        present(signInVC, animated: true, completion: nil)
    }
    
    private func setConstraints() {
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
