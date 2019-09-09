//
//  ViewController.swift
//  LocationNotify
//
//  Created by mak on 2019/09/08.
//  Copyright © 2019 example.dev. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var currentTime: Date?
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateTime()
    }

    func updateTime() {
        currentTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        if let currentTime = currentTime {
            timeLabel.text = formatter.string(from: currentTime)
        }
    }
    
    @IBAction func setNotification() {
        
//        let seconds = Int(segment.titleForSegment(at: segment.selectedSegmentIndex)!)!
        
        // ------------------------------------
        // 通知の発行: タイマーを指定して発行
        // ------------------------------------
        
        // content
        let content = UNMutableNotificationContent()
        content.title = "It's time."
        content.subtitle = "xxx seconds elapsed!"
        content.body = "I told you now because you had set xxxx seconds before."
        content.sound = UNNotificationSound.default
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(10), repeats: false)
        
        // request includes content & trigger
        let request = UNNotificationRequest(identifier: "TIMER10",
            content: content,
            trigger: trigger)
        
        // schedule notification by adding request to notification center
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

