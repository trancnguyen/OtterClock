//
//  ViewController.swift
//  otterClock
//
//  Created by Bo Botts on 7/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWorkTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchedSubmit(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondVC: SecondViewController = segue.destination as! SecondViewController
    
        secondVC.recivedString = txtWorkTime.text!
    }
    
}

