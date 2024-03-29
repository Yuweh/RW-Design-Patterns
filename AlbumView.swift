/**
 Francis Jemuel A. Bergonia
 Xi Apps Inc. 2019
 
 View: The objects that are in charge of the visual representation of the Model and the controls the user can interact with; basically, all the UIView-derived objects.
 In your application the View is represented by AlbumView, which you can find in AlbumView.swift.
 */


import UIKit

class AlbumView: UIView {
  
  private var coverImageView: UIImageView!
  private var indicatorView: UIActivityIndicatorView!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  init(frame: CGRect, coverUrl: String) {
    super.init(frame: frame)
    commonInit()
  }
  
  private func commonInit() {
    // Setup the background
    backgroundColor = .black
    // Create the cover image view
    coverImageView = UIImageView()
    coverImageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(coverImageView)
    // Create the indicator view
    indicatorView = UIActivityIndicatorView()
    indicatorView.translatesAutoresizingMaskIntoConstraints = false
    indicatorView.activityIndicatorViewStyle = .whiteLarge
    indicatorView.startAnimating()
    addSubview(indicatorView)
    
    NSLayoutConstraint.activate([
      coverImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
      coverImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
      coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
      indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
      ])
  }
  
  func highlightAlbum(_ didHighlightView: Bool) {
    if didHighlightView == true {
      backgroundColor = .white
    } else {
      backgroundColor = .black
    }
  }
  
}
