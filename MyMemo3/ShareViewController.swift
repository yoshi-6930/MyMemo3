//
//  ShareViewController.swift
//  MyMemo3
//
//  Created by 岩元喜輝 on 2020/05/25.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit
import SwiftConfettiView

class ShareViewController: UIViewController {

    var flag = false
    var confettiView: SwiftConfettiView!
    var screenShotImage = UIImage()
    @IBOutlet weak var shareTextView: UITextView!
    var shareString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        confettiView = SwiftConfettiView(frame: self.view.bounds)
        
        // Set colors (default colors are red, green and blue)
        confettiView.colors = [UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
                               UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
                               UIColor(red:0.48, green:0.78, blue:0.64, alpha:1.0),
                               UIColor(red:0.30, green:0.76, blue:0.85, alpha:1.0),
                               UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
        
        // Set intensity (from 0 - 1, default intensity is 0.5)
        confettiView.intensity = 1
        
        // Set type
        confettiView.type = .diamond
        
        // For custom image
        // confettiView.type = .Image(UIImage(named: "diamond")!)
        
        // Add subview
        view.addSubview(confettiView)
        confettiView.startConfetti()
        
        
        if let shareString = self.shareString{
            self.shareTextView.text = shareString
            self.shareTextView.font =  UIFont.boldSystemFont(ofSize: 20)
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func shareTap(_ sender: Any) {
        takeScreenShot()
        
        let items = [screenShotImage] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        //iPadでUIActivityViewControllerを使う時に必要
        activityVC.popoverPresentationController?.sourceView = self.shareTextView
        activityVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 2.0, width: 1.0, height: 1.0)
        present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func animationButton(_ sender: Any) {
        if flag == false{
            confettiView.stopConfetti()
            flag = true
        }else{
            confettiView.startConfetti()
            flag = false
        }
    }
    func takeScreenShot(){
        
        //width,heightは任意で調節
        let width = CGFloat(UIScreen.main .bounds.size.width)
        
        
        let height = CGFloat(UIScreen.main.bounds.size.height / 1.3)
        
        let size = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        //Viewに書き出す
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
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
