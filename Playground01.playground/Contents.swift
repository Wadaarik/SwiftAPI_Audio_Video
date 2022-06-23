import UIKit

//variable
var toto = "toto"

//constante
let tata = "tata"

//int
let integer = 3


//double
let double = 3.0


//bool
let bool = false

/*
 COMMENTAIRE
PLUSIEURS
LIGNES
 */


if integer > 4 {
    print("superieur")
}else if integer == 10{
    
}else{
    
}


//var students: [String] = ["Alice", "Bob", "Charly"]
//var multiType: [Any] = [1, "Alice", 3.0]
//
////AJOUTE UN ELEMENT A LA FIN
//students.append("Delta")
////AJOUTE UN ELEMENT A LA POSITION DONNEE
//students.insert("AAA", at: 2)

//RECUPERE CHAQUE ELEMENT DU TABLEAU
//for student in students{
//    print(student)
//}


//RECUPERE CHAQUE ELEMENT DU TABLEAU AVEC ENUMERATION
//for (key, value) in students.enumerated(){
//    print(key, value)
//}

////RECUPERE LES VALUES DU TABLEAU AVEC ENUMERATION
//for (_, value) in students.enumerated(){
//    print(value)
//}
//
////RECUPERE LES Key DU TABLEAU AVEC ENUMERATION
//for (key, _) in students.enumerated(){
//    print(key)
//}

//DICTIONNAIRE QUI PREND EN CLE UN STRING ET EN VALEUR UN INT
var collects: [String : Int] = [:]
collects["String1"] = 20
collects["String2"] = 40

//REMOVE LA COLLECTION QUI A LA KEY DONNEE
collects.removeValue(forKey: "String1")

//REMOVE TOUTES LA COLLECTION
//collects.removeAll()

//for collect in collects{
//    print(collect.value)
//}

//COUPLE DE VARIABLE
let tuple = ("String1", "String2")
//print(tuple.0)

//FONCTION
//func multiple (value1: Int, value2: Int) -> Int{
//    return value1 * value2
//}
//let resultat = multiple(value1: 10, value2: 5)

// _ PERMET DE NE PAS NOMMER LES VALUES D'UNE FONCTION
//func multiple (_ value1: Int, _ value2: Int) -> Int{
//let resultat = multiple(10, 5)

//PERMET DE RENOMMER LA VARIALE
//func multiple (RENOME1 value1: Int, RENOM2 value2: Int) -> Int{
//let resultat = multiple(RENOME1: 10, RENOM2: 5)

class ClassStudent{
    private var level: Int
    
    init(_ level: Int){
        self.level = level
    }
    
    func getLevel() -> Int{
        level
    }
}

let classStudent = ClassStudent(5)

//STRUCT = CLASS CHANGE EN MEMOIRE PRISE
//class StructStudent{
//    private var level: Int
//
//    init(_ level: Int){
//        self.level = level
//    }
//
//    func getLevel() -> Int{
//        level
//    }
//}
//let structStudent = StructStudent(5)
//print(structStudent.getLevel())

//ENUMERATION (POUR UN NOMBRE LIMITE DE CAS)
enum Status{
    case student
    case teacher
    case admin
}

class Person{
    //level DEVIENT OBTIONNEL (INT?)
    private var level: Int?
    private var status: Status
    
    init(_ level: Int?, status: Status){
        //level N'A PLUS BESOIN D'ETRE APPELE
        self.status = status
    }
    
    func getLevel() -> Int? {
        level
    }
    func getStatus() -> Status{
        status
    }
}

//let student = Person(5, .student)
//let teacher = Person(10, .teacher)

//var nullableString: String?
//
//if let nullableString = nullableString {
//    print(nullableString)
//}else{
//    print("La variable n'existe pas")
//}

// """ = String SUR PLUSIEURS LIGNES

let json = """
    [
        {
            "id": 1,
            "name": "Niska",
            "city": "Paris",
        },
        {
            "id": 2,
            "name": "Shay",
        },
        {
            "id": 3,
            "name": "SCH",
            "city": "Marseille",
        },
    ]
"""

struct JSONApi: Decodable {
    var id: Int
    var name: String
    var city: String?
}

//CONVERTIT LE JSON EN UTF8
//JSONDecode DECODE DES OBJETS DE TYPE DECODABLE
//do{
//    guard let data = json.data(using: .utf8) else{fatalError()}
//    let parsed = try JSONDecoder().decode([JSONApi].self, from: data)
//    parsed.forEach{print($0)}
//
//} catch {
//
//    print(error)
//
//}


//TRANSFORME UN OPTIONNEL EN NON OPTIONNEL
//var optionnel : String? = ""
//if let option = optionnel{
//    print(option)
//}
//guard let option = optionnel else{fatalError()}

//GENERIQUE
class Parser<T: Decodable>{
    func parser(json: String) -> T?{
        do{
            guard let data = json.data(using: .utf8) else{fatalError()}
            let parsed = try JSONDecoder().decode(T.self, from: data)
            return parsed

        } catch {

            print(error)
            return nil

        }
    }
}

let parsedJson = Parser<[JSONApi]>().parser(json: json)

print(parsedJson)
