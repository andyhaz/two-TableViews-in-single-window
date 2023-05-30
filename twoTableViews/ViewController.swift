//
//  ViewController.swift
//  twoTableViews
//
//  Created by andyhaz on 5/23/23.
//

import Cocoa
import AppKit

class ViewController: NSViewController {

    let firstClassRef = FirstTableView()
    let secondClassRef = SecondTableView()
    
    @IBOutlet var tableViewOne: NSTableView!
    @IBOutlet var tableViewTwo: NSTableView!
    
  //  var tableOneData = ["1","2"]
  //  var tableTwoData = ["one","two"]
  //  var tableData = [""]
  //  var tableSwitch = 0
 //   var tableIdName = "cellViewID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableViewOne.tableView?.delegate = self
      //  tableViewOne.tableView?.dataSource = self
        // Do any additional setup after loading the view.
        firstClassRef.tableData = ["1","2","3"]
        secondClassRef.tableData = ["1","2","3","1","2","3"]
        
        
        self.tableViewOne.dataSource = firstClassRef
        self.tableViewTwo.dataSource = secondClassRef
        
        self.tableViewOne.delegate = firstClassRef
        self.tableViewTwo.delegate = secondClassRef
        
        self.tableViewOne.reloadData()
        self.tableViewTwo.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
class FirstTableView: NSObject, NSTableViewDataSource,NSTableViewDelegate {

    var tableData = Array<Any>()
    var tableIdName = "cellViewID2"

    func numberOfRows(in tableViewOne: NSTableView) -> Int {
       return tableData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        //let cellData = tableData[row]
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:tableIdName
), owner: self) as? tableCellViewOne else { return nil }
        cell.configurd(string: tableData[row] as! String)
        return cell
      }//end
}

class SecondTableView: NSObject,NSTableViewDataSource,NSTableViewDelegate {

    var tableData = Array<Any>()
    var tableIdName = "cellViewID2"

    func numberOfRows(in tableViewOne: NSTableView) -> Int {
       return tableData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        //let cellData = tableData[row]
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:tableIdName), owner: self) as? tableCellViewOne else { return nil }
        cell.configurd(string: tableData[row] as! String)
        return cell
      }//end
}
