// Студент, Профессор, Оценка, Класс, Университет. Опишите по 3 функции или параметра в каждой сущности.

class Student{
    var avScore: Double
    
    init(avScore: Double){
        self.avScore = avScore
    }
    
    func run(){
        print("БЕГУ В СТОЛОВУЮ")
    }
    
    func sleep(){
        print("Это действие пока недоступно")
    }
    
}

class Professor{
    var numberOfGroups: Int
    
    init(numberOfGroups: Int){
        self.numberOfGroups = numberOfGroups
    }
    
    func startLection(){
        print("Давайте потихоньку начинать лекцию")
    }
    
    func checkHometasks(){
        print("Думаю не сегодня...")
    }
}

struct Group{
    var groupNumber: Int
    var students = [Student]()
    
    init(groupNumber: Int){
        self.groupNumber = groupNumber
    }
    
    mutating func addStudent(student: Student){
        students.append(student)
    }
    
}

struct University{
    var name: String
    var groups = [Group]()
    var professors = [Professor]()
    
    init(name: String){
        self.name = name
        
    }
}

enum Score{
    case perfect
    case good
    case bad
    case awful
}

var group = Group(groupNumber: 1)
var student = Student(avScore: 3.4)
group.addStudent(student: student)
print(group.students)
