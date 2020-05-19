//
//  ViewController.swift
//  Local Notification
//
//  Created by Sajal Kaushik on 19/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var requestButton: UIButton!
    let notificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func requestButtonTapped(_ sender: UIButton) {
        
        notificationCenter.requestAuthorization(options: [.alert,.badge,.sound]) { (granted, err) in
            if granted {
                self.showNotification()
            } else {
                print("Noooooooo")
            }
        }
    }
    
    func showNotification() {
        setupContent()
        setupAction()
    }
    
    func setupContent() {
        let content = UNMutableNotificationContent()
        content.title = "Title of notification"
        content.subtitle = "Subtitle"
        content.body = "Some random text to set up body of notification"
        content.badge = NSNumber(integerLiteral: 4)
        let image = "profile"
        if let imageUrl = Bundle.main.url(forResource: image, withExtension: "jpg") {
            let notificationAttachment = try! UNNotificationAttachment(identifier: image, url: imageUrl, options: .none)
            content.attachments = [notificationAttachment]
        }
        content.categoryIdentifier = "actionCategoryID"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "uniqueNotificationID", content: content, trigger: trigger)
        notificationCenter.add(request, withCompletionHandler: nil)
    }
    
    func setupAction() {
        let dismiss = UNNotificationAction(identifier: "dismissID", title: "Dismiss", options: .destructive)
        let ok = UNNotificationAction(identifier: "okID", title: "OK", options: .foreground)
        let actionCategory = UNNotificationCategory(identifier: "actionCategoryID", actions: [dismiss, ok], intentIdentifiers: [], options: .allowAnnouncement)
        notificationCenter.setNotificationCategories([actionCategory])
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "dismissID" {
            print("Dismiss Action")
        } else if response.actionIdentifier == "okID" {
            print("OK Action")
        }
        completionHandler()
    }
}
