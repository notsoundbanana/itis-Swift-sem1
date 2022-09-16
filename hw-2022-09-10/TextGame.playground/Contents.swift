import Darwin

let sleepTime = UInt32(1)
//var monsterNum = Int.random(in: 3...10)
var monsterNum = 4

class Player{
    let name: String
    var hp = 100
    var attackPower = 20
    var defencePower = 0
    var playerType: playerType
    var haveSword = false
    var haveShield = false
    
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
        if (playerType == .kevin){  // Способность Кевина
            var fatality = false
            let chance = Int.random(in: 1...10)
            switch chance{
                case 1: fatality = true
                default: fatality = false
            }
            
            if fatality{
                monster.hp -= monster.hp
                print("*ВЫ НАНЕСЛИ КРИТИЧЕСКИЙ УДАР!*")
                
            }
            else{
                monster.hp -= self.attackPower
                print("*Вы нанесли монстру \(self.attackPower) урона*")
                print("")
            }
        }
        
        else {
            monster.hp -= self.attackPower
            print("*Вы нанесли монстру \(self.attackPower) урона*")
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
            self.hp = 30
            self.attackPower = 20
        }
        else if (type == .middle){
            self.hp = 50
            self.attackPower = 30
        }
        else{
            self.hp = 100
            self.attackPower = 50
        }
    }
    
    func attack(player: Player){
        var mirrored = false;
        if (player.playerType == .mirrorer){  // Способность отражателя
            let chance = Int.random(in: 1...10)
        
            if (chance <= 3){
                print("ВЫ СМОГЛИ ОТРАЗИТЬ АТАКУ МОНСТРА")
                print("")
                mirrored = true
            }
        }
        if (!mirrored){
            if (monsterDifficulty == .hard){
                let chance = Int.random(in: 1...10)
                if (chance <= 3){  // Способность сложного монстра нанести сильный удар
                    player.hp -= self.attackPower + 15 - player.defencePower
                    print("Монстр нанес вам сильный удар")
                    print("*Монстр нанес \(self.attackPower + 15) урона*")
                    print("")
                }
                else{
                    player.hp -= self.attackPower - player.defencePower
                    print("*Монстр нанес \(self.attackPower) урона*")
                    print("")
                }
            }
            else{
                player.hp -= self.attackPower - player.defencePower
                print("*Монстр нанес \(self.attackPower) урона*")
                print("")
            }
        }
    }
}

func printGeneralStatistics(){
    print("МОНСТРОВ ОСТАЛОСЬ: \(monsterNum)")
    print("")
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
2. Лекарь (восполняет 20 единиц здоровья после того, как у вас осталось <=30 единиц здоровья)
3. Кевин (имеет 10% шанс убить противника с одного удара)

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
sleep(sleepTime)


while (player.hp > 0 && monsterNum != 0){
    let chance = Int.random(in: 1...20)
    if (chance <= 10){
        print("Вы идете в поисках монстра...")
        sleep(sleepTime)
    }
    
    if (chance == 1 && player.haveSword == false){
        print("Вы нашли мечь, сила удара увеличилась")
        player.haveSword = true
        player.attackPower += 20
        sleep(sleepTime)
    }
    
    if (chance == 2 && player.haveShield == false){
        print("Вы нашли щит, количество получаемого урона уменьшится")
        player.haveShield = true
        player.defencePower += 20
        sleep(sleepTime)
    }
    
    
    else if (chance > 10){
        print("ВЫ ВСТРЕТИЛИ МОНСТРА, ВСТУПАЕМ В БОЙ!")
        print("")
        var monster: Monster
        let monsterDifficulty = Int.random(in: 1...100)
        let type: String
        sleep(sleepTime)
        
        if (monsterDifficulty <= 20){
            monster = Monster(type: .easy)
            type = "Легкий"
        }
        else if (20 < monsterDifficulty && monsterDifficulty <= 70){
            monster = Monster(type: .middle)
            type = "Средний"
        }
        else{
            monster = Monster(type: .hard)
            type = "Сложный"
        }
        print("Перед вами \(type) монстр")
        print("")
        sleep(sleepTime)
        printStatistics(player: player, monster: monster)
        sleep(sleepTime)
        
        // Атаки
        while (player.hp > 0 && monster.hp > 0){
            player.attack(monster: monster)
            sleep(sleepTime)
            if (monster.hp <= 0){
                monsterNum -= 1
                print("ВЫ УБИЛИ МОНСТРА")
                print("")
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
            
            monster.attack(player: player)
            
            if (player.hp <= 0){
                print("ВАС УБИЛИ")
                sleep(sleepTime)
                break
            }

            if (player.playerType == .healer && player.hp <= 30){  // Способность лекаря
                player.hp += 20
                print("*Вы восстановили 20 единиц здоровья*")
                print("")
                sleep(sleepTime)
            }
            
            printStatistics(player: player, monster: monster)
            sleep(sleepTime)
        }
    }
}


print("--------------------------------------------------------------------------------")
print("ИГРА ОКОНЧЕНА")


if (player.hp <= 0){
    print("ВЫ ПРОИГРАЛИ!")
}
else if (monsterNum == 0){
    print("ВЫ ВЫИГРАЛИ!")
}
