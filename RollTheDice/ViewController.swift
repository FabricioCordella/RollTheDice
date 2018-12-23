//
//  ViewController.swift
//  RollTheDice
//
//  Created by Fabricio Cordella on 20/12/18.
//  Copyright © 2018 Fabricio Cordella. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var diceVM = DiceViewModel()
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        diceVM.selectedDice?.roll()
        resultLabel.text = String(format: "%d", arguments: [diceVM.selectedDice?.value ?? "..."])

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.visibleCells.forEach { cell in
            cell.contentView.backgroundColor =  #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        }
        
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? CustomCell {
            diceVM.selectedDice = selectedCell.dice
            selectedCell.contentView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diceVM.dices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CustomCell
        
        cell?.diceLabel.textColor = UIColor.white
        cell?.contentView.backgroundColor =  #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        cell?.diceLabel.text = diceVM.dices[indexPath.row].name
        cell?.dice = diceVM.dices[indexPath.row]
        
        return cell!
    }
    
}
