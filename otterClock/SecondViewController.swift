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
    
    var recivedString:Int = 0 
    var timer:Timer?

override func viewDidLoad() {
    super.viewDidLoad()
    txtWorking.text = "Work Time"
    txtTimeLeft.text = "25 Minutes left"
    setupTimer()
}

func setupTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
}

@objc func onTimerFires() {
    recivedString -= 1
    txtTimeLeft.text = "\(recivedString) Minutes left"
    txtWorking.text = "Work Time"

    if recivedString <= 0 {
        txtWorking.text = "Break Time"
        timer?.invalidate()
        timer = nil
        
    }
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

