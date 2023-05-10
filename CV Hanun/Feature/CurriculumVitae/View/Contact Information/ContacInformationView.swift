//
//  ContacInformationView.swift
//  TokopediaDetailProduct
//
//  Created by TeravinMac on 09/05/23.
//

import UIKit

class ContacInformationView: UIView {
    @IBOutlet weak var linkedInButton: UIButton!
    
    @IBOutlet weak var containerContac: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        self.containerContac.layer.cornerRadius = 15
        
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureButton() {
        self.linkedInButton.addTarget(self, action: #selector(toLinkedInButton), for: .touchUpInside)
    }
    
    @objc func toLinkedInButton() {
        guard let url = URL(string: "https://www.linkedin.com/in/hanun-%E3%85%A4-650492119") else { return }
        UIApplication.shared.open(url)
    }
    
    private func customInit() {
        let nib = UINib(nibName: "ContacInformationView", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.backgroundColor = UIColor.white
            addSubview(view)
            view.frame = self.bounds
            self.backgroundColor = UIColor.white
        }
    }
    
}

