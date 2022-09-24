import UIKit
import PlaygroundSupport

let size100 = CGSize(width: 100, height: 100)
let view = UIView()
view.backgroundColor = .blue
view.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 600))
PlaygroundPage.current.liveView = view

let layer = view.layer

let gradientLayer = CAGradientLayer()
gradientLayer.startPoint = .zero
gradientLayer.endPoint = CGPoint(x: 1, y: 1)
gradientLayer.colors = [
    UIColor.yellow.cgColor.copy(alpha: 0.6) as Any,
    UIColor.blue.cgColor.copy(alpha: 0.5) as Any,
]
gradientLayer.frame = layer.bounds
layer.addSublayer(gradientLayer)

let bodyLayer = CALayer()
bodyLayer.frame = CGRect(
    origin: CGPoint(x: -150, y: 410),
    size: CGSize(width: 700, height: 700)
)
bodyLayer.cornerRadius = 350
bodyLayer.backgroundColor = UIColor.init(red: 255.0/255.0, green: 223.0/255.0, blue: 196.0/255.0, alpha: 1).cgColor
layer.addSublayer(bodyLayer)

let rightEyeLayer = CALayer()
rightEyeLayer.frame = CGRect(
    origin: CGPoint(x: 290, y: 490),
    size: CGSize(width: 100, height: 100)
)
rightEyeLayer.cornerRadius = 50
rightEyeLayer.backgroundColor = UIColor.white.cgColor
layer.addSublayer(rightEyeLayer)

let rightEyeLayer2 = CALayer()
rightEyeLayer2.frame = CGRect(
    origin: CGPoint(x: 300, y: 465),
    size: CGSize(width: 30, height: 100)
)
rightEyeLayer2.cornerRadius = 50
rightEyeLayer2.borderWidth = 25
rightEyeLayer2.backgroundColor = UIColor.clear.cgColor
rightEyeLayer2.borderColor = UIColor.black.cgColor
rightEyeLayer2.transform = CATransform3DMakeRotation(45 / 180.0 * .pi, 0.0, 0.0, 1.0)
layer.addSublayer(rightEyeLayer2)

let leftEyeLayer = CALayer()
leftEyeLayer.frame = CGRect(
    origin: CGPoint(x: 10, y: 490),
    size: CGSize(width: 100, height: 100)
)
leftEyeLayer.cornerRadius = 50
leftEyeLayer.backgroundColor = UIColor.white.cgColor
layer.addSublayer(leftEyeLayer)

let leftEyeLayer2 = CALayer()
leftEyeLayer2.frame = CGRect(
    origin: CGPoint(x: 70, y: 465),
    size: CGSize(width: 30, height: 100)
)
leftEyeLayer2.cornerRadius = 50
leftEyeLayer2.borderWidth = 25
leftEyeLayer2.backgroundColor = UIColor.clear.cgColor
leftEyeLayer2.borderColor = UIColor.black.cgColor
leftEyeLayer2.transform = CATransform3DMakeRotation(135.0 / 180.0 * .pi, 0.0, 0.0, 1.0)
layer.addSublayer(leftEyeLayer2)

let mouthLayer = CALayer()
mouthLayer.frame = CGRect(
    origin: CGPoint(x: 125, y: 560),
    size: CGSize(width: 150, height: 150)
)
mouthLayer.cornerRadius = 50
mouthLayer.backgroundColor = UIColor.white.cgColor
layer.addSublayer(mouthLayer)


let textLayer = CATextLayer()
textLayer.foregroundColor = UIColor.orange.cgColor
textLayer.frame = CGRect(
    origin: CGPoint(x: 85, y: 80),
    size: CGSize(width: 310, height: 70)
)
textLayer.string = "С днём пива!"
layer.addSublayer(textLayer)

let circleLayer = CALayer()
circleLayer.frame = CGRect(
    origin: CGPoint(x: 180, y: 220),
    size: CGSize(width: 160, height: 160)
)
circleLayer.cornerRadius = 80
circleLayer.borderColor = UIColor.gray.cgColor
circleLayer.borderWidth = 25
circleLayer.backgroundColor = UIColor.clear.cgColor
layer.addSublayer(circleLayer)

let beerLayer = CALayer()
beerLayer.frame = CGRect(
    origin: CGPoint(x: 125, y: 170),
    size: CGSize(width: 150, height: 300)
)
beerLayer.backgroundColor = UIColor.init(red: 242.0/255.0, green: 142.0/255.0, blue: 28.0/255.0, alpha: 1.0).cgColor
layer.addSublayer(beerLayer)

let foamLayer = CALayer()
foamLayer.frame = CGRect(
    origin: CGPoint(x: 125, y: 170),
    size: CGSize(width: 150, height: 50)
)
foamLayer.backgroundColor = UIColor.white.cgColor
layer.addSublayer(foamLayer)

let bubbleLayer = CALayer()
bubbleLayer.frame = CGRect(
    origin: CGPoint(x: 180, y: 180),
    size: CGSize(width: 15, height: 15)
)
bubbleLayer.cornerRadius = 10
bubbleLayer.backgroundColor = UIColor.init(red: 242.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1).cgColor
layer.addSublayer(bubbleLayer)

let bubbleLayer2 = CALayer()
bubbleLayer2.frame = CGRect(
    origin: CGPoint(x: 135, y: 190),
    size: CGSize(width: 15, height: 15)
)
bubbleLayer2.cornerRadius = 10
bubbleLayer2.backgroundColor = UIColor.init(red: 242.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1).cgColor
layer.addSublayer(bubbleLayer2)

let bubbleLayer3 = CALayer()
bubbleLayer3.frame = CGRect(
    origin: CGPoint(x: 220, y: 190),
    size: CGSize(width: 15, height: 15)
)
bubbleLayer3.cornerRadius = 10
bubbleLayer3.backgroundColor = UIColor.init(red: 242.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1).cgColor
layer.addSublayer(bubbleLayer3)

let bubbleLayer4 = CALayer()
bubbleLayer4.frame = CGRect(
    origin: CGPoint(x: 250, y: 175),
    size: CGSize(width: 15, height: 15)
)
bubbleLayer4.cornerRadius = 10
bubbleLayer4.backgroundColor = UIColor.init(red: 242.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1).cgColor
layer.addSublayer(bubbleLayer4)

let bubbleLayer5 = CALayer()
bubbleLayer5.frame = CGRect(
    origin: CGPoint(x: 160, y: 200),
    size: CGSize(width: 15, height: 15)
)
bubbleLayer5.cornerRadius = 10
bubbleLayer5.backgroundColor = UIColor.init(red: 242.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1).cgColor
layer.addSublayer(bubbleLayer5)


let shapeLayer = CAShapeLayer()
