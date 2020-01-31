import Cocoa
import SwiftVer

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  @IBOutlet var tableView: NSTableView!
  public let values = Version.example.values

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    tableView.tableColumns[0].headerCell.title = "Label"
    tableView.tableColumns[1].headerCell.title = "Value"
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }

  func numberOfRows(in _: NSTableView) -> Int {
    return values.count
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let text: String?
    let cellIdentifier: NSUserInterfaceItemIdentifier

    let pair = values[row]

    // 2
    if tableColumn == tableView.tableColumns[0] {
      cellIdentifier = NSUserInterfaceItemIdentifier("LabelCellID")
      text = pair.label
    } else {
      text = pair.value
      cellIdentifier = NSUserInterfaceItemIdentifier("ValueCellID")
    }
    // 3

    if let cell = tableView.makeView(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
      cell.textField?.stringValue = (text ?? "Not Set")
      // cell.imageView?.image = image ?? nil
      return cell
    }
    return nil
  }
}
