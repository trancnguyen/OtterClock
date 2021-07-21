//
//  SecondViewController.swift
//  otterClock
//
//  Created by Bo Botts on 7/21/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtWorking: UILabel!
    @IBOutlet weak var txtTimeLeft: UILabel!
    
    var recivedString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTimeLeft.text = recivedString

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
