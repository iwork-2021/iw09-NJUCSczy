//
//  ViewController.swift
//  MyTank
//
//  Created by nju on 2022/1/6.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet weak var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        // 3
        tankAnchor!.turret?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        arView.scene.anchors.append(tankAnchor!)
    }
    @IBAction func fire(_ sender: Any) {
        tankAnchor!.notifications.cannonFire.post()
    }
    @IBAction func forward(_ sender: Any) {
        tankAnchor!.notifications.tankForward.post()
    }
    @IBAction func tank_left(_ sender: Any) {
        tankAnchor!.notifications.tankLeft.post()
    }
    @IBAction func tank_right(_ sender: Any) {
        tankAnchor!.notifications.tankRight.post()
    }
    @IBAction func cannon_right(_ sender: Any) {
        tankAnchor!.notifications.turretRight.post()
    }
    @IBAction func cannon_left(_ sender: Any) {
        tankAnchor!.notifications.turretLeft.post()
    }
    
}
