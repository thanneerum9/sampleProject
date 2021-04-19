//
//  EventSearchViewController.swift
//  SampleSeatGeek
//
//  Created by Mallesh Thanneeru on 16/04/21.
//

import UIKit
import Kingfisher
import SKActivityIndicatorView


class EventSearchViewController: UIViewController {
    
    @IBOutlet weak var eventsListView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
   
    var events: [Events] = []
    private var apiService = APIService()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // get defaults events
        getEventsListWith(searchStr: "")
    }
    
    func setupUI() {
        eventsListView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "EventCell")
        eventsListView.estimatedRowHeight = 120
        eventsListView.rowHeight = UITableView.automaticDimension
        eventsListView.estimatedRowHeight = 120
        eventsListView.keyboardDismissMode = .onDrag
        eventsListView.delegate = self
        eventsListView.dataSource = self
        eventsListView.reloadData()
        
        searchBar.delegate = self
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
    }
    
    func getEventsListWith(searchStr: String) {
        SKActivityIndicator.show()
        self.apiService.apiToGetEventsDataWith(queryStr: searchStr) { (eventModel) in
            // Add search results to events array
            self.events = []
            self.events = eventModel.events ?? []
            DispatchQueue.main.async {
                SKActivityIndicator.dismiss()
                self.eventsListView.reloadData()
            }
        }
    }
}

// MARK:- TABLEVIEW DELEGATES
extension EventSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventCell
        if self.events.count != 0 {
        eventCell?.loadCellWith(event: self.events[indexPath.row])
        }
        return eventCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailView = storyboard.instantiateViewController(identifier: "EventDetailsViewController") as? EventDetailsViewController
        detailView?.selectedEvent = self.events[indexPath.row]
        self.navigationController?.pushViewController(detailView!, animated: true)
    }

}

// MARK:- SEARCHBAR DELEGATES

extension EventSearchViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getEventsListWith(searchStr: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
