import Darwin

let sleepTime = UInt32(2)
//var monsterNum = Int.random(in: 3...20)
var monsterNum = 2

class Player{
    let name: String
    var hp = 100
    var attackPower = 20
    var defencePower = 10
    var playerType: playerType
    
    init(name: String, type: Int){
        self.name = name
        switch type {
            case 1: playerType = .mirrorer
            case 2: playerType = .healer
            case 3: playerType = .kevin
            default:
                playerType = .kevin
        }
    }
    
    func attack(monster: Monster){
        if playerType == .kevin{
            var fatality = false
            let chance = Int.random(in: 1...10)
            switch chance{
                case 1, 2: fatality = true
                default: fatality = false
            }
            
            if fatality{
                monster.hp -= monster.hp
                print("ВЫ НАНЕСЛИ КРИТИЧЕСКИЙ УДАР!")
            }
            else{
                monster.hp -= self.attackPower
                print("Вы нанесли монстру \(self.attackPower) урона")
                print("")
            }
            
        }
        
        else {
            monster.hp -= self.attackPower
            print("Вы нанесли монстру \(self.attackPower) урона")
            print("")
        }
        
    }
    
    func toString(){
        print("""
        Имя: \(self.name)
        Здоровье: \(self.hp)
        Сила атаки: \(self.attackPower)
        Сила защиты: \(self.defencePower)
        Класс: \(self.playerType)
        """)
    }
}

enum playerType{
    case mirrorer
    case healer
    case kevin
}

enum monsterDifficulty{
    case easy
    case middle
    case hard
}

class Monster{
    var hp: Int
    var attackPower: Int
    var monsterDifficulty: monsterDifficulty
    
    init(type: monsterDifficulty){
        self.monsterDifficulty = type
        if (type == .easy){
            self.hp = 20
            self.attackPower = 5
        }
        else if (type == .middle){
            self.hp = 50
            self.attackPower = 15
        }
        else{
            self.hp = 100
            self.attackPower = 30
        }
    }
}

func printGeneralStatistics(){
    print("МОНСТРОВ ОСТАЛОСЬ: \(monsterNum)")
}

func printStatistics(player: Player, monster: Monster){
    print("Здоровье игрока: \(player.hp)")
    print("Здоровье монстра: \(monster.hp)")
    print("")
}


// Начало игры
    
let greeting1 = """
Приветствую тебя в игре gameName, выбери персонажа:
1. Отражатель (имеет 30% шанс полностью отразить атаку противника)
2. Лекарь (восполняет 30% здоровья после каждого боя)
3. Кевин (имеет 20% шанс убить противника с одного удара)

"""

print(greeting1)

sleep(sleepTime)

var menu = Int.random(in: 1...3)


    
var player = Player(name: "Player1", type: menu)


let greeting2 = """
Вы выбрали тип \(menu)
СЕГОДНЯ ВАМ ПРЕДСТОИТ ОДОЛЕТЬ \(monsterNum) МОНСТРОВ
Игра начинается...

"""

print(greeting2)
print("--------------------------------------------------------------------------------")

while (player.hp > 0 && monsterNum != 0){
    let chance = Int.random(in: 1...2)
    if (chance == 1){
        print("Вы идете в поисках монстра...")
        sleep(sleepTime)
    }
    else if (chance == 2){
        print("ВЫ ВСТРЕТИЛИ МОНСТРА, ВСТУПАЕМ В БОЙ!")
        var monster: Monster
        let monsterDifficulty = Int.random(in: 1...100)
        let type: String
        sleep(sleepTime)
        
        if (monsterDifficulty <= 50){
            monster = Monster(type: .easy)
            type = "Легкий"
        }
        else if (50 < monsterDifficulty && monsterDifficulty <= 80){
            monster = Monster(type: .middle)
            type = "Средний"
        }
        else{
            monster = Monster(type: .hard)
            type = "Сложный"
        }
        print("Перед вами \(type) монстр")
        printStatistics(player: player, monster: monster)
        sleep(sleepTime)
        
        // Атаки
        while (player.hp > 0 && monster.hp > 0){
            player.attack(monster: monster)
            sleep(sleepTime)
            if (monster.hp <= 0){
                monsterNum -= 1
                print("ВЫ УБИЛИ МОНСТРА")
                sleep(sleepTime)
                printGeneralStatistics()
                sleep(sleepTime)
                if (monsterNum != 0){
                    print("Продолжаем путь...")
                    print("")
                    sleep(sleepTime)
                    
                }
                break
            }
            printStatistics(player: player, monster: monster)
            sleep(sleepTime)
        }
        
    }
}
