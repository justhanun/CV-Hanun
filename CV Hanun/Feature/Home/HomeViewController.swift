

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var linkedInButton: UIButton!
    @IBOutlet weak var curriculumVitaeButton: UIButton!
    @IBOutlet weak var gitHubButton: UIButton!
    
    
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
        self.linkedInButton.addTarget(self, action: #selector(toLinkedInButton), for: .touchUpInside)
        self.gitHubButton.addTarget(self, action: #selector(toGitHub), for: .touchUpInside)
    }
    
    @objc func toCurriculumVitae() {
        let curriculumVitaeViewController = CurriculumVitaeViewController(nibName: "CurriculumVitaeViewController", bundle: nil)
        self.navigationController?.pushViewController(curriculumVitaeViewController, animated: true)
    }
    
    @objc func toLinkedInButton() {
        guard let url = URL(string: "https://www.linkedin.com/in/justhanun") else { return }
        UIApplication.shared.open(url)
    }
    
    @objc func toGitHub() {
        guard let url = URL(string: "https://github.com/justhanun?tab=repositories") else { return }
        UIApplication.shared.open(url)
    }
}

