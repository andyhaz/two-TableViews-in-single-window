//
//  ViewController.swift
//  twoTableViews
//
//  Created by andyhaz on 5/23/23.
//

import Cocoa
import AppKit

protocol tableEventDelegate:AnyObject{
    func tableEvent(tableId:Int, cellId: Int)
    func rowEvent(massage:String)
}

class ViewController: NSViewController,tableEventDelegate {
    func tableEvent(tableId:Int, cellId: Int) {
        print("table\(tableId) row:\(cellId)")
    }
    func rowEvent(massage:String){
        print("massage\(massage)")
    }

    let firstClassRef = FirstTableView()
    let secondClassRef = SecondTableView()
    
    @IBOutlet var tableViewOne: NSTableView!
    @IBOutlet var tableViewTwo: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableViewOne.tableView?.delegate = self
      //  tableViewOne.tableView?.dataSource = self
        // Do any additional setup after loading the view.
        firstClassRef.tableData = ["1","2","3"]
        firstClassRef.delegate = self
        
        secondClassRef.tableData = ["01","02","03","01","02","03"]
        secondClassRef.delegate = self
        
        
        self.tableViewOne.dataSource = firstClassRef
        self.tableViewTwo.dataSource = secondClassRef
        
        self.tableViewOne?.delegate = firstClassRef
        self.tableViewTwo?.delegate = secondClassRef
        
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

    weak var delegate: tableEventDelegate?
    
    var tableData = Array<Any>()
    var tableIdName = "cellViewID1"

    func numberOfRows(in tableViewOne: NSTableView) -> Int {
       return tableData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        //let cellData = tableData[row]
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:tableIdName
), owner: self) as? tableCellViewOne else { return nil }
        cell.configurd(string: tableData[row] as! String)
        cell.delegate = delegate
        
        return cell
      }//end

    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        self.delegate?.tableEvent(tableId: 0, cellId:row)
     //   print("row:\(row)")
        return true
    }
}

class SecondTableView: NSObject,NSTableViewDataSource,NSTableViewDelegate {
    weak var delegate: tableEventDelegate?

    var tableData = Array<Any>()
    var tableIdName = "cellViewID2"

    func numberOfRows(in tableViewOne: NSTableView) -> Int {
       return tableData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        //let cellData = tableData[row]
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:tableIdName), owner: self) as? tableCellViewOne else { return nil }
        cell.configurd(string: tableData[row] as! String)
        cell.delegate = delegate
        return cell
      }//end
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        self.delegate?.tableEvent(tableId: 1, cellId:row)
     //   print("row:\(row)")
        return true
    }
}
