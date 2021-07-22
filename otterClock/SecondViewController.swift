//
//  SecondViewController.swift
//  otterClock
//
//  Created by Bo Botts on 7/21/21.
//

import UIKit
import ImageIO

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtWorking: UILabel!
    @IBOutlet weak var txtTimeLeft: UILabel!
    @IBOutlet weak var gifView: UIImageView!
    gifView.loadGif(name: string)
    
    
    
    
    var recivedString:Int = 0
    var timer:Timer?
    var breakTime = 5
    var timesToRepeat:Int = 1
    var reainderTime: Int = 0
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if recivedString > 25 {
            if recivedString % 25 == 0{
                timesToRepeat = recivedString / 25
                recivedString = 25
            } else{
                
            }
        }
        
        txtWorking.text = "Work Time"
        if recivedString >= 25{
            txtTimeLeft.text = "25 Minutes left"
        }else{
            txtTimeLeft.text = "\(recivedString) Minutes left"
        }
        setupTimer()
    }


    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
        
    func setupBreakTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(onTimerBreakFires), userInfo: nil, repeats: true)
    }


    @objc func onTimerFires() {
        if timesToRepeat > 0 {
            if recivedString == 25{
                txtTimeLeft.text = "25 Minutes left"
            }else{
                txtTimeLeft.text = "\(recivedString) Minutes left"
            }
            txtWorking.text = "WorkTime"
            recivedString -= 1
            txtTimeLeft.text = "\(recivedString) Minutes left"

            if recivedString <= 0 {
                timer?.invalidate()
                timer = nil
                timesToRepeat -= 1
                breakTime = 5
                setupBreakTimer()
            }
        }
        let alert = UIAlertController(title: "All Done With Work", message: "Congrats you finished your work!! \n Slide down to start a new timer.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    @objc func onTimerBreakFires() {
        txtWorking.text = "Break Time"
        breakTime -= 1
        txtTimeLeft.text = "\(breakTime) Minutes left"

        if breakTime <= 0 {
            timer?.invalidate()
            timer = nil
            recivedString = 25
            setupTimer()
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

