//
//  ViewController.swift
//  HeroisMarvel
//
//  Created by Max Mendes on 10/09/2019.
//  Copyright © 2017 Max Mendes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroesTableViewController
        vc.name = tfName.text
    }

}

