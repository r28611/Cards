//
//  BoardGameController.swift
//  Cards
//
//  Created by Margarita Novokhatskaia on 10/01/2022.
//

import UIKit

class BoardGameController: UIViewController {
    
    var cardsPairsCounts = 8
    lazy var game: Game = getNewGame()
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
    }
    lazy var startButtonView = getStartButtonView()
    lazy var boardGameView = getBoardGameView()
    
    // MARK: - View Controller Lifecycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view.addSubview(startButtonView)
        view.addSubview(boardGameView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func getStartButtonView() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center.x = view.center.x
        let window = UIApplication.shared.windows[0] //'windows' was deprecated in iOS 15.0: Use UIWindowScene.windows on a relevant window scene instead
        let topPadding = window.safeAreaInsets.top
        button.frame.origin.y = topPadding
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.65
        button.addAction(UIAction(title: "", handler: { action in
                            print("Button was pressed")}),
                         for: .touchUpInside)
        return button
    }
    
    private func getBoardGameView() -> UIView {
        let margin: CGFloat = 10
        let boardView = UIView()
        boardView.frame.origin.x = margin
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        boardView.frame.origin.y = topPadding + startButtonView.frame.height + margin
        boardView.frame.size.width = UIScreen.main.bounds.width - margin*2
        let bottomPadding = window.safeAreaInsets.bottom
        boardView.frame.size.height = UIScreen.main.bounds.height - boardView.frame.origin.y - margin - bottomPadding

        boardView.layer.cornerRadius = 5
        boardView.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1, alpha: 0.3)
        return boardView }
}
