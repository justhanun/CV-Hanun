

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var portofolio1Button: UIButton!
    @IBOutlet weak var curriculumVitaeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        title = ""
    }
    
    func configureButton() {
        self.curriculumVitaeButton.addTarget(self, action: #selector(toCurriculumVitae), for: .touchUpInside)
        self.portofolio1Button.addTarget(self, action: #selector(toportofolio1Button), for: .touchUpInside)
    }
    
    @objc func toCurriculumVitae() {
        let curriculumVitaeViewController = CurriculumVitaeViewController(nibName: "CurriculumVitaeViewController", bundle: nil)
        self.navigationController?.pushViewController(curriculumVitaeViewController, animated: true)
    }
    
    @objc func toportofolio1Button() {
        let portofolio1ButtonViewController = CurriculumVitaeViewController(nibName: "CurriculumVitaeViewController", bundle: nil)
        self.navigationController?.pushViewController(portofolio1ButtonViewController, animated: true)
    }
}

