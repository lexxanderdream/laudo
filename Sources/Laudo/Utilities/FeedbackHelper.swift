//
//  File.swift
//  
//
//  Created by Alexander Zhuchkov on 14.06.2020.
//

import UIKit
import MessageUI

open class FeedbackHelper: NSObject {
    
    public func sendMail(to email: String, in viewController: UIViewController) {
        if !MFMailComposeViewController.canSendMail() {
            AlertPresenter.makeAndPresent(in: viewController, title: "Email not set up", acceptTitle: "OK", message: "You did not set up any email accounts on this device", handler: nil)
            return
        }
        
        let mailViewController = MFMailComposeViewController()
        mailViewController.mailComposeDelegate = self
        mailViewController.setToRecipients([email])
        viewController.present(mailViewController, animated: true, completion: nil)
    }
}

extension FeedbackHelper: MFMailComposeViewControllerDelegate {
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
         controller.dismiss(animated: true)
    }
}

