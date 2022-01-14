//
//  WelcomeController.swift
//  Cards
//
//  Created by Margarita Novokhatskaia on 14/01/2022.
//

import UIKit

class WelcomeController: UIViewController {
    
    lazy var startButtonView = getStartButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1, alpha: 1)
        view.addSubview(startButtonView)
        navigationItem.rightBarButtonItem = .init(image: UIImage.init(systemName: "gearshape"), style: .plain, target: self, action: #selector(openSettings(_:)))
    }
    
    private func getStartButtonView() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center.x = view.center.x
        button.center.y = view.center.y
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.65
        button.addAction(UIAction(title: "",
                                  handler: { _ in
            self.navigationController?.pushViewController(BoardGameController(), animated: true) }),
                         for: .touchUpInside)
        return button
    }

    @objc private func openSettings(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(SettingsController(), animated: true)
    }
}
