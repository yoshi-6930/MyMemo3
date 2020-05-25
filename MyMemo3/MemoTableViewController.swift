//
//  MemoTableViewController.swift
//  MyMemo3
//
//  Created by 岩元喜輝 on 2020/05/20.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import UIKit

class MemoTableViewController: UITableViewController{

    
    let userDefaults = UserDefaults.standard
    var memos = [String]()
    @IBAction func appendToMemoList(sender: UIStoryboardSegue){
        guard let sourceVC = sender.source as? MemoViewController,let memo = sourceVC.memo else { return }
        //編集の場合はセルが選択されている->セルが選択されているかどうかはindexPathForSelectedRowに値が入っているかどうかで判断する
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow{
            memos[selectedIndexPath.row] = memo
        }else{
            self.memos.append(memo)
        }
        userDefaults.set(self.memos, forKey: "memos")
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.object(forKey: "memos") != nil{
            self.memos = userDefaults.stringArray(forKey: "memos")!
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableViewCell", for: indexPath)
        cell.textLabel!.text = self.memos[indexPath.row]
        cell.detailTextLabel!.text = "created at"

        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.memos.remove(at: indexPath.row)
            userDefaults.set(self.memos, forKey: "memos")
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifire = segue.identifier else {
            return
        }
        if identifire == "editMemo"{
            let memoVC = segue.destination as? MemoViewController
            memoVC!.memo = self.memos[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }
}


