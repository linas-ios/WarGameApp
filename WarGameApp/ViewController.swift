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

  


  override func viewDidLoad() {
    super.viewDidLoad()
    leftCardImageView.image = UIImage(named: "FirstBackCard")
    rightCardImageView.image = UIImage(named: "SecondBackCard")
  }

  @IBAction func playButtonTapped(_ sender: UIButton) {

  }

}

