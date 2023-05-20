//
//  ViewController.swift
//  WarGameApp
//
//  Created by Linas Nutautas on 19/05/2023.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var leftCardImageView: UIImageView!
  @IBOutlet weak var rightCardImageView: UIImageView!

  var playerScore = 0
  var cpuScore = 0


  override func viewDidLoad() {
    super.viewDidLoad()
    leftCardImageView.image = UIImage(named: "FirstBackCard")
    rightCardImageView.image = UIImage(named: "SecondBackCard")
  }

  @IBAction func playButtonTapped(_ sender: UIButton) {

    guard let card1 = DeckManager.cards.randomElement(),
          let card2 = DeckManager.cards.randomElement() else {return}

    leftCardImageView.image = UIImage(named: card1)
    rightCardImageView.image = UIImage(named: card2)

    let rank1 = DeckManager.rankOfCard(named: card1)
    let rank2 = DeckManager.rankOfCard(named: card2)

    if rank1 > rank2 {
      playerScore += 1
      print("Player Win round! and have \(playerScore)")
    } else if rank2 > rank1 {
      cpuScore += 1
      print("Cpu Win round! and have \(cpuScore)")
    } else {
      print("Draw")
    }
  }

}

