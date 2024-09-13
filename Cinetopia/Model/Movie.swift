//
//  Movie.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 16/08/2024.
//

import Foundation

struct Movie: Decodable {
    let id: String
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    
}

let movies: [Movie] = [
    Movie(id: "1", title: "The Parent Trap", image: "https://github.com/alura-cursos/movie-api/blob/main/images/avatar.jpg?raw=true", synopsis: "In this update of a 1961 film, twins Annie and Hallie (Lindsay Lohan) are strangers until happenstance unites them. The preteen girls' divorced parents, Nick (Dennis Quaid) and Elizabeth (Natasha Richardson), are living on opposite sides of the Atlantic, each with one child. After meeting at camp, American Hallie and British-raised Annie engineer an identity swap, giving both the chance to spend time with the parent they've missed. If the scheme works, it might just make the family whole again.", rate: 9.8, releaseDate: "03/08/2000"),
    
    Movie(id: "2", title: "Home Alone 2 - Lost in NYC", image: "https://github.com/alura-cursos/movie-api/blob/main/images/vingadores-ultimato.jpg?raw=true", synopsis: "After snarky youth Kevin McCallister (Macaulay Culkin) loses track of his father at the airport, he mistakenly gets on a plane headed for New York City -- while the rest of the McCallisters fly to Florida. Now alone in the Big Apple, Kevin cons his way into a room at the Plaza Hotel and begins his usual antics. But when Kevin discovers that the Sticky Bandits (Joe Pesci, Daniel Stern) are on the loose, he struggles to stop them from robbing an elderly man's toy store just before Christmas.", rate: 9.6, releaseDate: "09/12/1991"),
    
    Movie(id: "3", title: "Notting Hill", image: "https://github.com/alura-cursos/movie-api/blob/main/images/avatar-2.jpg?raw=true", synopsis: "William Thacker (Hugh Grant) is a London bookstore owner whose humdrum existence is thrown into romantic turmoil when famous American actress Anna Scott (Julia Roberts) appears in his shop. A chance encounter over spilled orange juice leads to a kiss that blossoms into a full-blown affair. As the average bloke and glamorous movie star draw closer and closer together, they struggle to reconcile their radically different lifestyles in the name of love.", rate: 9.8, releaseDate: "30/07/1999"),
    
    Movie(id: "4", title: "The Talented Mr Ripley", image: "https://github.com/alura-cursos/movie-api/blob/main/images/titanic.jpg?raw=true", synopsis: "To be young and carefree amid the blue waters and idyllic landscape of sun-drenched Italy in the late 1950s; that's la dolce vita Tom Ripley (Matt Damon) craves- and Dickie Greenleaf (Jude Law) leads. When Dickie's father asks Tom to bring his errant playboy son back home to America, Dickie and his beautiful expatriate girlfriend, Marge Sherwood (Gwyneth Paltrow), never suspect the dangerous extremes to which Ripley will go to make their lifestyle his own.", rate: 9.6, releaseDate: "12/12/1999")
]
