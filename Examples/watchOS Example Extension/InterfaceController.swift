import Foundation
import SwiftVer
import WatchKit

class InterfaceController: WKInterfaceController {
  public let values = Version.example.values
  @IBOutlet var table: WKInterfaceTable!

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    // Configure interface objects here.
    table.setNumberOfRows(values.count, withRowType: "row")

    for (index, pair) in values.enumerated() {
      // swiftlint:disable:next force_cast
      let row = table.rowController(at: index) as! RowController
      row.titleLabel.setText(pair.label)
      row.valueLabel.setText(pair.value ?? "Not Set")
      row.valueLabel.setAlpha(pair.value == nil ? 0.5 : 1.0)
    }
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
}
