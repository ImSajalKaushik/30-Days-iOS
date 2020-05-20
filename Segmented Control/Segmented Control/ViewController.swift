//
//  ViewController.swift
//  Segmented Control
//
//  Created by Sajal Kaushik on 20/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemon: UIImageView!
    @IBOutlet weak var selectPokemon: UIButton!
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        selectPokemon.layer.cornerRadius = selectPokemon.frame.height/2
        selectPokemon.setTitle("Select Pokemon", for: .normal)
        selectPokemon.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }

    @IBAction func pokemonSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            pokemon.image = #imageLiteral(resourceName: "charmender")
        case 1 :
            pokemon.image = #imageLiteral(resourceName: "squartle")
        case 2 :
            pokemon.image = #imageLiteral(resourceName: "pikachu")
        default:
            pokemon.image = UIImage()
        }
    }
    
    @IBAction func pokemonSelected(_ sender: UIButton) {
        segmentController.removeAllSegments()
    }
}

