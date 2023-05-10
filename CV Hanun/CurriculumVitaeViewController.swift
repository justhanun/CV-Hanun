//
//  CurriculumVitaeViewController.swift
//  TokopediaDetailProduct
//
//  Created by TeravinMac on 09/05/23.
//

import UIKit

class CurriculumVitaeViewController: UIViewController {

    @IBOutlet weak var containerContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Curriculum Vitae"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#24314E")
        ]
        self.navigationController?.navigationBar.tintColor = hexStringToUIColor(hex: "#24314E")
        subViews()
    }
    
    private lazy var contacInformationView: ContacInformationView = {
        var view = ContacInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func subViews() {
        containerContent.addSubview(contacInformationView)
        NSLayoutConstraint.activate([
            contacInformationView.topAnchor.constraint(equalTo: containerContent.topAnchor),
            contacInformationView.leadingAnchor.constraint(equalTo: containerContent.leadingAnchor, constant: 16),
            contacInformationView.trailingAnchor.constraint(equalTo: containerContent.trailingAnchor, constant: -16),
            contacInformationView.bottomAnchor.constraint(equalTo: containerContent.bottomAnchor, constant: 0),
        ])
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}



//https://drive.google.com/uc?id=1eWDlFWu5M1MTUKLzvyyvwf1tJ0EKNkPk&export=download

