//
//  ViewController.swift
//  LotteryApp
//
//  Created by Max Mendes on 28/08/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Gametype: String {
        case megasena = "Mega-Sena"
        case quina = "Quina"
    }
    
    @IBOutlet weak var lblGame: UILabel!
    @IBOutlet weak var gameType: UISegmentedControl!
    @IBOutlet var game: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showNumbers(for: .megasena)
        
    }
    
    
    func showNumbers(for type: Gametype){
        
        lblGame.text = type.rawValue
        
        var randomNumbers:[Int] = []
    
        switch type {
        case .megasena:
            randomNumbers = generateRandomNumbers(total: 6, range: 60)
            game.last?.isHidden = false
        case .quina:
           randomNumbers = generateRandomNumbers(total: 5, range: 80)
            game.last?.isHidden = true
        }
        
        for (index, randomNumbers) in randomNumbers.enumerated(){
            game[index].setTitle("\(randomNumbers)", for: .normal)
        }
        
    }
    
    
    func generateRandomNumbers(total: Int, range: Int) -> [Int]{
        
        var arrayRandomGame: [Int] = []
        
        while arrayRandomGame.count < total {
            let number = Int(arc4random_uniform(UInt32(range))+1)
            if !arrayRandomGame.contains(number){
                arrayRandomGame.append(number)
            }
            
        }
    
        return arrayRandomGame.sorted()
    }


    @IBAction func generateGame() {
      
        switch gameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
        
    }

}

