//
//  MemoViewController.swift
//  MyMemo3
//
//  Created by 岩元喜輝 on 2020/05/20.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    //アラート表示　宣言
    var alertController: UIAlertController!
    var memo:String?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memo = self.memo{
            memoTextView.text = memo
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    //メソッド
    func alert(title:String, message:String) {
        alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
        present(alertController, animated: true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard memoTextView.text != "" else{
            //呼び出し
            alert(title: "エラー", message: "入力して下さい")
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem else{
            return
        }
        if button == saveButton{
            self.memo = memoTextView.text ?? ""
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        if presentingViewController is UITabBarController{
             self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
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
