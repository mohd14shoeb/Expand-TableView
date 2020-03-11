//
//  ViewController.swift
//  ExpandTableView
//
//  Created by Sunil Kumar on 11/03/20.
//  Copyright © 2020 Wiantech. All rights reserved.
//
import Foundation
struct ExpandableNames {
    
    var isExpanded: Bool
    let names: [String]
    
}

import UIKit

 class ViewController: UITableViewController {

       
            let cellId = "cellId123123"
            
            var twoDimensionalArray = [
                ExpandableNames(isExpanded: true, names: ["$1,000.00 - $1,999.99", "$1,000.00 - $1,999.99", "$1,000.00 - $1,999.99", "$1,000.00 - $1,999.99", "$1,000.00 - $1,999.99", "$1,000.00 - $1,999.99", "$1,000.00 - $1,999.99"]),
                ExpandableNames(isExpanded: true, names: ["TWT 0.00 CT. - 0.49 CT.", "TWT 0.00 CT. - 0.49 CT.", "TWT 0.00 CT. - 0.49 CT.", "TWT 0.00 CT. - 0.49 CT."]),
                ExpandableNames(isExpanded: true, names: ["TWT 0.00 CT. - 0.49 CT", "TWT 0.00 CT. - 0.49 CT"]),
                ExpandableNames(isExpanded: true, names: ["TWT 0.00 CT. - 0.49 CT", "TWT 0.00 CT. - 0.49 CT"]),
            ]
            
            var showIndexPaths = false
            var sectionArr = ["Price","Weight","New","Others"]
        //    @objc func handleShowIndexPath() {
        //
        //        print("Attemping reload animation of indexPaths...")
        //
        //        // build all the indexPaths we want to reload
        //        var indexPathsToReload = [IndexPath]()
        //
        //        for section in twoDimensionalArray.indices {
        //            for row in twoDimensionalArray[section].names.indices {
        //                print(section, row)
        //                let indexPath = IndexPath(row: row, section: section)
        //                indexPathsToReload.append(indexPath)
        //            }
        //        }
                
        //        for index in twoDimensionalArray[0].indices {
        //            let indexPath = IndexPath(row: index, section: 0)
        //            indexPathsToReload.append(indexPath)
        //        }
                
        //        showIndexPaths = !showIndexPaths
        //
        //        let animationStyle = showIndexPaths ? UITableViewRowAnimation.right : .left
        //
        //        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
        //    }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
              //  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
                navigationItem.title = "Shoping Options"
              //  navigationController?.navigationBar.prefersLargeTitles = true
                tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
                tableView.tableFooterView = UIView()
            }
            
            override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
                
                let frame = view.frame
                let buttonleft = UIButton(frame: CGRect(x: 10, y: 0, width:frame.size.width/2, height: 40))  // create button
                buttonleft.tag = section
                // the button is image - set image
                buttonleft.setTitle(sectionArr[section], for: .normal)
                // assumes there is an image named "remove_button"
                 buttonleft.contentHorizontalAlignment = .left
                 let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height:50))
                // create custom view
                headerView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
                buttonleft.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                buttonleft.setTitleColor(.black, for: .normal)
                buttonleft.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
                headerView.addSubview(buttonleft)   // add the button to the view

                let buttonright =  UIButton(frame: CGRect(x: frame.size.width/2, y: 0, width: frame.size.width/2-10, height: 40))
               // buttonright.setTitle("Close", for: .normal)
                buttonright.contentHorizontalAlignment = .right
                buttonright.setTitleColor(.black, for: .normal)
                //buttonright.backgroundColor = .yellow
                buttonright.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                buttonright.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
                buttonright.tag = section
                headerView.addSubview(buttonright)
                return headerView
              
            }
            
            @objc func handleExpandClose(button: UIButton) {
                print("Trying to expand and close section...")
                
                let section = button.tag
                
                // we'll try to close the section first by deleting the rows
                var indexPaths = [IndexPath]()
                for row in twoDimensionalArray[section].names.indices {
                    print(0, row)
                    let indexPath = IndexPath(row: row, section: section)
                    indexPaths.append(indexPath)
                }
                
                let isExpanded = twoDimensionalArray[section].isExpanded
                twoDimensionalArray[section].isExpanded = !isExpanded
                if button.titleLabel?.text == "Open" ||  button.titleLabel?.text == "Close"{
                   //button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
                }
                if isExpanded {
                    tableView.deleteRows(at: indexPaths, with: .fade)
                } else {
                    tableView.insertRows(at: indexPaths, with: .fade)
                }
            }
            
           @objc  func btnLeft(button: UIButton) {
                        let section = button.tag
                        // we'll try to close the section first by deleting the rows
                       var indexPaths = [IndexPath]()
                       for row in twoDimensionalArray[section].names.indices {
                           print(0, row)
                           let indexPath = IndexPath(row: row, section: section)
                           indexPaths.append(indexPath)
                       }
                       let isExpanded = twoDimensionalArray[section].isExpanded
                       twoDimensionalArray[section].isExpanded = !isExpanded
                     //  button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
                       if isExpanded {
                           tableView.deleteRows(at: indexPaths, with: .fade)
                       } else {
                           tableView.insertRows(at: indexPaths, with: .fade)
                       }
         }
        
        @IBAction func btnCancel(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }
        
        
        @IBAction func btnDone(_ sender: Any) {
             self.navigationController?.popViewController(animated: true)
        }
        
        
            override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 36
            }
            
            override func numberOfSections(in tableView: UITableView) -> Int {
                return twoDimensionalArray.count
            }
            
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                if !twoDimensionalArray[section].isExpanded {
                    return 0
                }
                
                return twoDimensionalArray[section].names.count
            }
            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
                let name = twoDimensionalArray[indexPath.section].names[indexPath.row]
                cell.textLabel?.text = name
                cell.imageView?.image = UIImage(named: "checkbox")
                if showIndexPaths {
                cell.textLabel?.text = "\(name)   Section:\(indexPath.section) Row:\(indexPath.row)"
               
                }
                cell.selectionStyle = .none
                
                return cell
            }


       

    }
