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
  @IBOutlet weak var playerScore: UILabel!
  @IBOutlet weak var cpuScore: UILabel!
  @IBOutlet weak var playButton: UIButton!

  var playerScores = 0
  var cpuScores = 0
  var roundNumber = 0


  override func viewDidLoad() {
    super.viewDidLoad()
    leftCardImageView.image = UIImage(named: "FirstBackCard")
    rightCardImageView.image = UIImage(named: "SecondBackCard")

  }

  @IBAction func playButtonTapped(_ sender: UIButton) {
    roundNumber += 1
    
    if roundNumber >= 5 {
      playButton.isEnabled = false
      determineWiner()
    }

    guard let card1 = DeckManager.cards.randomElement(),
          let card2 = DeckManager.cards.randomElement() else {return}

    leftCardImageView.image = UIImage(named: card1)
    rightCardImageView.image = UIImage(named: card2)

    let rank1 = DeckManager.rankOfCard(named: card1)
    let rank2 = DeckManager.rankOfCard(named: card2)

    if rank1 > rank2 {
      playerScores += 1
      updateScore()
    } else if rank2 > rank1 {
      cpuScores += 1
      updateScore()
    } else if rank1 == rank2 {
      updateScore()
    } else {
      print("Round Finish!")
    }
  }

  func updateScore() {
    playerScore.text = "\(playerScores)"
    cpuScore.text = "\(cpuScores)"
  }

  func determineWiner() {

    if playerScores > cpuScores {
      showAlert(title: "Player Win!", message: "")
    } else if cpuScores > playerScores {
      showAlert(title: "CPU Win!", message: "")
    } else {
      showAlert(title: "Game is draw", message: "")
    }
  }

}

extension UIViewController {
  func showAlert(title: String, message: String, actionTitle: String = "Ok") {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: actionTitle, style: .default , handler: nil)
    alert.addAction(action)
    present(alert, animated: true)
  }
}

