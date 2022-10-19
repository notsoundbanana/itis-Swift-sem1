import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        NotificationCenter.default.addObserver(
            self, selector: #selector(reanimate),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    @objc func reanimate() {
        animate()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }

    private let button: UIButton = .init()
    private let label: UILabel = .init()
    private let car: CALayer = .init()
    

    private func setup() {
        view.backgroundColor = .purple
        
        view.layer.addSublayer(car)
        view.addSubview(label)
        view.addSubview(button)
        
        label.text = "ВАМ ПОДАРОК"
        label.font = .boldSystemFont(ofSize: 50)
        label.textColor = .green
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 15, y: 50)
        
        car.frame = CGRect(x: 45, y: 300, width: 300, height: 150)
        car.contents = UIImage(named: "car")?.cgImage
        
        button.frame = CGRect(x: 100, y: 550, width: 200, height: 50)
        button.backgroundColor = .blue
        button.setTitle("ЗАБРАТЬ ПРИЗ!!!", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0
        ) {[self] in
            UIView.addKeyframe(
                withRelativeStartTime: 0, relativeDuration: 1)
            { [self] in
                self.button.layer.position = (CGPoint(x: Int.random(in: 100...293), y: Int.random(in: 54...759)))
                self.button.transform = CGAffineTransformMakeRotation(.pi)
            }
            self.button.transform = CGAffineTransformMakeRotation(0)
        }
    }

    private func animate() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [ .repeat, .autoreverse ]
        ) { [self] in
            label.frame.origin.y = 100
        }
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 0.9
        rotationAnimation.repeatCount = .infinity
        car.add(rotationAnimation, forKey: "rotation animation")
    }
}
