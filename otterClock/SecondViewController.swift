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
    
    
    var recivedString:Int = 0
    var timer:Timer?
    var breakTime = 5
    var timesToRepeat:Int = 1
    var reainderTime: Int = 0
    
    let gifWorkArray = ["https://64.media.tumblr.com/3ae5079b3e03cf9f1cbaedd8b98d347d/tumblr_metdt7jv7z1rhs8j5o1_500.gifv", "https://64.media.tumblr.com/f4f90a402e369e25e22a1cc38b51e960/tumblr_mh6lzfrWTE1rhs8j5o1_500.gifv", "https://64.media.tumblr.com/f5cfd0c87b3a63e18499396232bb9f53/tumblr_mjk3xcpRbM1rhs8j5o1_500.gifv", "https://64.media.tumblr.com/7ad64abb17867342d2b02a5722d71214/tumblr_mjbn9yKMgc1rhs8j5o1_500.gifv", "https://64.media.tumblr.com/96b71b23f8ffd4371c86b46fb18c30df/tumblr_mvvfrq7gxu1rhs8j5o1_500.gifv", "https://64.media.tumblr.com/d5a32f467ac9cc92f9ac557f62722a6c/tumblr_mtretyaChm1rhs8j5o1_500.gifv", ]
    
    let gifBreakArray = ["https://64.media.tumblr.com/4c37cf7628bd38637cd070a4ef91bae0/tumblr_nnlgh6dFAo1rhs8j5o1_500.gifv","https://64.media.tumblr.com/20affbc4eb7df2d7b651d89321673bbf/tumblr_n4ieu9Ry1v1rhs8j5o1_500.gifv","https://64.media.tumblr.com/b285826a8eee44c4b5567ae19028db36/tumblr_n2auvl08Jb1rhs8j5o1_500.gifv","https://64.media.tumblr.com/cdd487ecc4aed180baf063e6130df3e8/tumblr_n10myzDF921rhs8j5o1_500.gifv","https://64.media.tumblr.com/ddc5db08beb8e61b00d09c88a88a1efa/tumblr_mzrz3qtz441rhs8j5o1_500.gifv","https://64.media.tumblr.com/836d60d8188560c292d2c05e5f6a8aa6/tumblr_n9npm9ccvs1rhs8j5o1_500.gifv","https://64.media.tumblr.com/84770ecff3a88ecc59d3bf04c57cdd65/tumblr_mg44v5rLmo1rhs8j5o1_500.gifv"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let gifURL : String = gifWorkArray.randomElement()!
        let imageFromURL = UIImage.gifImageWithURL(gifURL)
        gifView.image = imageFromURL
        
        
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
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
        
    func setupBreakTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerBreakFires), userInfo: nil, repeats: true)
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
    }
    

    @objc func onTimerBreakFires() {
        let gifURL : String = gifBreakArray.randomElement()!
        let imageFromURL = UIImage.gifImageWithURL(gifURL)
        gifView.image = imageFromURL
        txtWorking.text = "Break Time"
        breakTime -= 1
        txtTimeLeft.text = "\(breakTime) Minutes left"

        if breakTime <= 0 {
            timer?.invalidate()
            timer = nil
            recivedString = 25
            setupTimer()
            let gifURL : String = gifWorkArray.randomElement()!
            let imageFromURL = UIImage.gifImageWithURL(gifURL)
            gifView.image = imageFromURL
        }
        if timesToRepeat == 0 {
            let alert = UIAlertController(title: "Congrats You Finished Your Timer!", message: "Congrats you finished your time! Swipe down to start a new timer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
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

