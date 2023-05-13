

import UIKit
import AVKit
import AVFoundation

class LauchVideoViewController: UIViewController {
    
    private let lauchVideoViewController = AVPlayerViewController()
    var didFinishVideo: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playVideo()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "VideoLaunch", ofType:"mp4") else {
            debugPrint("VideoLaunch.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        lauchVideoViewController.showsPlaybackControls = false
        lauchVideoViewController.player = player
        lauchVideoViewController.videoGravity = .resizeAspectFill
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: lauchVideoViewController.player?.currentItem)
        present(lauchVideoViewController, animated: true) {
            player.play()
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.didFinishVideo?()
    }
}
