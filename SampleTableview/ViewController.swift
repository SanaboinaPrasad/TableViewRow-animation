//
//  ViewController.swift
//  SampleTableview
//
//  Created by Sriram Prasad on 15/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
// row animation

import UIKit

class ViewController: UITableViewController {
    var friends = ["Munivar","Arji","Zaheer","karthik"]
    var munivar = ["Flipkart","KPGM","Wipro","Cognizent"]
    var arju = ["Lenovo","FlipKart","PKGM","Mphasisis"]
    var zaheer = ["Mphasis","xerox","COgnizant","IBM","Wipro"]
    var karthik = ["IBM","Hyderabad"]
    var totallist = [Array<String>]()
    var showAnimationButton = UIBarButtonItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        totallist = [munivar,arju,zaheer,karthik]
        showAnimationButton  = UIBarButtonItem(title: "ShowAnimation", style:.plain , target: self, action: #selector(handleShowAnimation))
        navigationItem.rightBarButtonItem = showAnimationButton
        tableView.register(SimpleCell.self, forCellReuseIdentifier: "cell")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Animation", style: .plain, target: self, action: #selector(handleLeftAnimation))
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friends.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totallist[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SimpleCell
        cell.textLabel?.text = totallist[indexPath.section][indexPath.row] as? String
        return cell
        
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = friends[section]
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .red
        label.textColor = .white
        label.textAlignment = .center
        
        
        return label
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            totallist[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    @objc func handleShowAnimation(){
        var indexpathReloadaata = [IndexPath]()
        for sections in totallist.indices {
            for row in totallist[sections].indices{
                let indexpath = IndexPath(row: row, section: sections)
                indexpathReloadaata.append(indexpath)
            }
        }
        tableView.reloadRows(at: indexpathReloadaata, with: .right)

    }
    
    @objc func handleLeftAnimation(){
        var leftIndepath = [IndexPath]()
        for section in totallist.indices {
            for row in totallist[section].indices{
                print(section,row)
                let indexpaths = IndexPath(row: row, section: section)
                leftIndepath.append(indexpaths)
            }
        }
        tableView.reloadRows(at: leftIndepath, with: .top)
        
    }
}

