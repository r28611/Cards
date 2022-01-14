//
//  SettingsController.swift
//  Cards
//
//  Created by Margarita Novokhatskaia on 14/01/2022.
//

import UIKit

class SettingsController: UITableViewController {
    
    var pairCounter: Int = 1 {
        willSet {
            pairCountLabel.text = "Количество пар карт: " + "\(newValue)" }
    }
    
    private lazy var pairCountLabel = getPairCountLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Initialization
    
    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(nibName: nil, bundle: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell.selectionStyle = .none
            
            pairCountLabel.frame = cell.bounds.insetBy(dx: 16, dy: 0)
            cell.contentView.addSubview(pairCountLabel)
            
            let counter = UIStepper()
            counter.frame.origin.x = cell.frame.width - counter.frame.width
            counter.center.y = cell.center.y
            counter.minimumValue = 1
            counter.maximumValue = 9
            counter.stepValue = 1
            counter.isUserInteractionEnabled = true
            counter.addTarget(self, action: #selector(updatePairCount(_:)), for: .valueChanged)
            cell.contentView.addSubview(counter)
            
        case 1:
            let label = UILabel(frame: cell.bounds.insetBy(dx: 16, dy: 0))
            cell.addSubview(label)
            cell.accessoryType = .disclosureIndicator
            
            switch indexPath.row {
            case 0:
                label.text = "Выбранные фигуры"
            case 1:
                label.text = "Выбранные цвета"
            case 2:
                label.text = "Рубашки карт"
            default:
                return cell
            }
        default:
            return cell
        }
        
        return cell
    }
    
    private func getPairCountLabel() -> UILabel {
        let label = UILabel()
        label.text = "Количество пар карт: " + "\(pairCounter)"
        return label
    }
    
    @objc private func updatePairCount(_ sender: UIStepper) {
        pairCounter = Int(sender.value)
    }
}
