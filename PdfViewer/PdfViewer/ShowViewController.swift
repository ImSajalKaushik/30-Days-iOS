//
//  ShowViewController.swift
//  PdfViewer
//
//  Created by Sajal Kaushik on 11/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit
import PDFKit

class ShowViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPDF()
    }
    
    func showPDF() {
        guard let path = Bundle.main.url(forResource: "Setting Up Code Snippets", withExtension: "pdf") else { return }
        if let document = PDFDocument(url: path) {
            pdfView.document = document
            pdfView.autoScales = true
            pdfView.backgroundColor = .black
            pdfView.displayDirection = .vertical
        }
    }
}
