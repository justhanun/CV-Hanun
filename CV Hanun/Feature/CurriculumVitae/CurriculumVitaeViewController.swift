
import UIKit

class CurriculumVitaeViewController: UIViewController {
    @IBOutlet weak var containerContent: UIView!
    @IBOutlet weak var contacInformationStackView: UIStackView!
    @IBOutlet weak var workExperienceStackView: UIStackView!
    @IBOutlet weak var educationSertificationStackView: UIStackView!
    
    private lazy var contacInformationView: ContacInformationView = {
        var view = ContacInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var workExperienceView: WorkExperienceView = {
        var view = WorkExperienceView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   private lazy var educationSertificationView: EducationSertificationView = {
        var view = EducationSertificationView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Curriculum Vitae"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#24314E")
        ]
        self.navigationController?.navigationBar.tintColor = hexStringToUIColor(hex: "#24314E")
        subViews()
        configureButton()
    }

    
    private func configureButton() {
        contacInformationStackView.isUserInteractionEnabled = true
        let contacInformationStacGesture = UITapGestureRecognizer(target: self, action: #selector(openContacInformation))
        contacInformationStackView.addGestureRecognizer(contacInformationStacGesture)
        
        workExperienceStackView.isUserInteractionEnabled = true
        let workExperienceStackGesture = UITapGestureRecognizer(target: self, action: #selector(openWorkExperience))
        workExperienceStackView.addGestureRecognizer(workExperienceStackGesture)
        
        educationSertificationStackView.isUserInteractionEnabled = true
        let educationSertificationStackGesture = UITapGestureRecognizer(target: self, action: #selector(openEducationSertification))
        educationSertificationStackView.addGestureRecognizer(educationSertificationStackGesture)
    }
    
    private func subViews() {
        containerContent.addSubview(contacInformationView)
        NSLayoutConstraint.activate([
            contacInformationView.topAnchor.constraint(equalTo: containerContent.topAnchor),
            contacInformationView.leadingAnchor.constraint(equalTo: containerContent.leadingAnchor, constant: 16),
            contacInformationView.trailingAnchor.constraint(equalTo: containerContent.trailingAnchor, constant: -16),
            contacInformationView.bottomAnchor.constraint(equalTo: containerContent.bottomAnchor, constant: 0),
        ])
        
        containerContent.addSubview(workExperienceView)
        NSLayoutConstraint.activate([
            workExperienceView.topAnchor.constraint(equalTo: containerContent.topAnchor),
            workExperienceView.leadingAnchor.constraint(equalTo: containerContent.leadingAnchor, constant: 16),
            workExperienceView.trailingAnchor.constraint(equalTo: containerContent.trailingAnchor, constant: -16),
            workExperienceView.bottomAnchor.constraint(lessThanOrEqualTo: containerContent.bottomAnchor, constant: 0),
        ])
        
        containerContent.addSubview(educationSertificationView)
        NSLayoutConstraint.activate([
            educationSertificationView.topAnchor.constraint(equalTo: containerContent.topAnchor),
            educationSertificationView.leadingAnchor.constraint(equalTo: containerContent.leadingAnchor, constant: 16),
            educationSertificationView.trailingAnchor.constraint(equalTo: containerContent.trailingAnchor, constant: -16),
            educationSertificationView.bottomAnchor.constraint(lessThanOrEqualTo: containerContent.bottomAnchor, constant: 0),
        ])
    }
    
    @objc private func openWorkExperience() {
        contacInformationView.isHidden = true
        workExperienceView.isHidden = false
        educationSertificationView.isHidden = true
    }
    
    @objc private func openContacInformation() {
        contacInformationView.isHidden = false
        workExperienceView.isHidden = true
        educationSertificationView.isHidden = true
    }
    
    @objc private func openEducationSertification() {
        educationSertificationView.isHidden = false
        contacInformationView.isHidden = true
        workExperienceView.isHidden = true
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

