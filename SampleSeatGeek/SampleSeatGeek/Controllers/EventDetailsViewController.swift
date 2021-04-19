//
//  EventDetailsViewController.swift
//  SampleSeatGeek
//
//  Created by Mallesh Thanneeru on 16/04/21.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventPlace: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
    var selectedEvent: Events?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        if let event = selectedEvent {
            eventTitle.text = event.title ?? ""
            eventPlace.text = event.venue?.display_location ?? ""
            eventDate.text = event.createdat?.convertToDate() ?? ""
            eventImage.kf.indicatorType = .activity
            eventImage.kf.setImage(with: URL(string: "\(event.performers?.first?.image ?? "")"))
            eventImage.layer.cornerRadius = 3
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Details"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
