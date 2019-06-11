/**
Francis Jemuel A. Bergonia
Xi Apps Inc. 2019
 
 Model: The objects that hold your application data and define how to manipulate it.
 For example, in your application the Model is the Album struct, which you can find in Album.swift.
 
 Most applications will have more than one type as part of their Model :]
 */

import Foundation

struct Album {
  let title : String
  let artist : String
  let genre : String
  let coverUrl : String
  let year : String
}

typealias AlbumData = (title: String, value: String)

extension Album: CustomStringConvertible {
  var description: String {
    return "title: \(title)" +
      " artist: \(artist)" +
      " genre: \(genre)" +
      " coverUrl: \(coverUrl)" +
    " year: \(year)"
  }
}

extension Album {
  var tableRepresentation: [AlbumData] {
    return [
      ("Artist", artist),
      ("Album", title),
      ("Genre", genre),
      ("Year", year)
    ]
  }
}

