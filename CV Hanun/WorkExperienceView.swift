import UIKit

class WorkExperienceView: UIView {
    
    
    
    @IBOutlet weak var containerView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        self.containerView.layer.cornerRadius = 15
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func customInit() {
        let nib = UINib(nibName: "WorkExperienceView", bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            view.backgroundColor = UIColor.white
            addSubview(view)
            view.frame = self.bounds
            self.backgroundColor = UIColor.white
        }
    }
    
}

