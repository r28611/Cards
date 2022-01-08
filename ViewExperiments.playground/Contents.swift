//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        setupViews()
    }
    private func setupViews() {
        self.view = getRootView()
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        redView.transform = CGAffineTransform(rotationAngle: .pi/3)
        set(view: greenView, toCenterOfView: redView)

        whiteView.center = greenView.center
        self.view.addSubview( redView )
        redView.addSubview( greenView )
        redView.addSubview( whiteView )
        
        let pinkView = getPinkView()
        self.view.addSubview(pinkView)
    }
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 200, height: 200)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    private func getGreenView() -> UIView {
        let viewFrame = CGRect(x: 100, y: 100, width: 180, height: 180)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    /*
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        let moveViewWidth = moveView.frame.width
        let moveViewHeight = moveView.frame.height
        
        let baseViewWidth = baseView.bounds.width
        let baseViewHeight = baseView.bounds.height

        let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
        let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
//        moveView.frame = CGRect(x: newXCoordinate, y: newYCoordinate, width: moveViewWidth, height: moveViewHeight)
    }
     */
    private func set(view moveView: UIView, toCenterOfView baseView: UIView){
        moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
    }
    private func getWhiteView() -> UIView {
        let viewFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 300, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 10, height: 20)
        view.layer.shadowColor = UIColor.white.cgColor
//        view.layer.opacity = 0.7
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.black.cgColor
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        layer.cornerRadius = 10
        view.layer.addSublayer(layer)
        
        print(view.frame)
//        view.transform = CGAffineTransform(rotationAngle: .pi/4)
//        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
//        view.transform = CGAffineTransform(translationX: 100, y: 5)
        view.transform = CGAffineTransform(rotationAngle: .pi/3).scaledBy(x: 2, y: 0.8).translatedBy(x: 50, y: 50)
        print(view.frame)
        return view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
