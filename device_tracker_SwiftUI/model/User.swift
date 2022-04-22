//
// Created by agmcoder on 22/4/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User:Identifiable, Decodable{
    @DocumentID var id:String
    let email:String
    let profileImageURL:String


}