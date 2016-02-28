//
//  addPostVC.swift
//  MyWood
//
//  Created by SEBASTIEN MONTIBELLER on 27/02/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class addPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

 
    @IBAction func makePostBtnPressed(sender: UIButton!) {
        if let title = titleField.text, let desc = descField.text, let image = postImg.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(image)
            
            let post = Post(imagePath: imgPath, title: title, postDesc: desc)
            DataService.instance.addedPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    

    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addPicBtn(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    
}
