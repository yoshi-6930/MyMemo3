//
//  TodoViewController.swift
//  MyMemo3
//
//  Created by 岩元喜輝 on 2020/05/25.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    var alertController: UIAlertController!
    var todo:String?
    @IBOutlet weak var todoTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = self.todo{
            self.todoTextView.text = todo
            self.navigationItem.title = "Edit Todo"
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
        
        guard todoTextView.text != "" else {
            
            alert(title: "エラー", message: "入力して下さい")
            return false
        }
        return true
    }
    
    
    @IBAction func cancelTap(_ sender: Any) {
        if self.presentingViewController is UITabBarController{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem else { return }
        if button == saveButton{
            todo = todoTextView.text ?? ""
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
