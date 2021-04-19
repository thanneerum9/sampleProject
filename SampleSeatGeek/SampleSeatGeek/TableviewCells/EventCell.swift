//
//  EventCell.swift
//  SampleSeatGeek
//
//  Created by Mallesh Thanneeru on 16/04/21.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventPlaceName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func loadCellWith(event: Events) {
        eventTitle.text = event.title ?? ""
        eventPlaceName.text = event.venue?.display_location ?? ""
        eventDate.text = event.createdat?.convertToDate() ?? ""
        eventImage.kf.indicatorType = .activity
        eventImage.kf.setImage(with: URL(string: "\(event.performers?.first?.image ?? "")"))
        backView.layer.cornerRadius = 3
        eventImage.layer.cornerRadius = 3
    }
    
}
