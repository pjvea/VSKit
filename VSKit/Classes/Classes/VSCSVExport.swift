//
//  VSCSVExport.swift
//  VSKit
//
//  Created by PJ Vea on 7/1/18.
//

import QuickLook

open class VSCSVExport {
    
    fileprivate var csvFilePath: URL!
    
    /// exportCSV generates a CSV file, presents a documents previewer, and allows sharing.
    ///
    /// - Parameters:
    ///   - fileName: Name of CSV file.
    ///   - columnTitles: Array of titles for the columns.
    ///   - dataByRow: Array of array of data for each row.
    ///   - presentingVC: The presenting view controller to present the document previewer.
    public func exportCSV(fileName: String, columnTitles: [String], dataByRow: [[String]], presentingVC: UIViewController) {
        let csvString = self.buildCSVText(columnTitles: columnTitles, dataByRow: dataByRow)
        var csvFileName = fileName
        
        if let dotRange = csvFileName.range(of: ".") {
            csvFileName.removeSubrange(dotRange.lowerBound..<csvFileName.endIndex)
        }
        
        self.csvFilePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("\(csvFileName).csv")
        
        do {
            try csvString.write(to: self.csvFilePath, atomically: true, encoding: String.Encoding.utf8)
            
            let quickLookController = QLPreviewController()
            quickLookController.dataSource = self
            
            presentingVC.present(quickLookController, animated: true, completion: nil)
        } catch {
            print("Failed to create CSV file: " + error.localizedDescription)
        }
    }
    
    fileprivate func buildCSVText(columnTitles: [String], dataByRow: [[String]]) -> String {
        let columnString = columnTitles.joined(separator: ",")
        var rowString = ""
        
        for row in dataByRow {
            rowString += "\n"
            rowString += row.joined(separator: ",")
        }
        return columnString + "\n" + rowString
    }
}

// MARK: - QLPreviewControllerDataSource

extension VSCSVExport: QLPreviewControllerDataSource {
    public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.csvFilePath! as QLPreviewItem
    }
}
