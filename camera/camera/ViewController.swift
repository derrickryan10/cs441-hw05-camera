//
//  ViewController.swift
//  camera
//
//  Created by Derrick Ryan on 3/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var button: UIButton!
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //button tap
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}

//add
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:       [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        
        //set images
        if(counter % 3 == 0){
            imageView.image = image
        }
        else if(counter % 3 == 1){
            imageView2.image = image
        }
        else{
            imageView3.image = image
        }
        counter += 1
    }
}
