import Darwin

let sleepTime = UInt32(1)
var monsterNum = 6

class Player{
    let name: String
    var hp = 100
    var attackPower = 20
    var defencePower = 0
    var playerType: playerType
    var type = "Кевин"
    var haveSword = false
    var haveShield = false
    var isAlive = true
    
    init(name: String, numType: Int){
        self.name = name
        self.playerType = .kevin
        if (numType == 1) {
            self.playerType = .mirrorer
            self.type = "Отражатель"
        }
        else if (numType == 2){
            self.playerType = .healer
            self.type = "Лекарь"
        }
        else if (numType == 3){
            self.playerType = .kevin
            self.type = "Кевин"
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
                print("*\(name) НАНЕС КРИТИЧЕСКИЙ УДАР!*")
                print("")
                
            }
            else{
                monster.hp -= self.attackPower
                print("*\(name) нанес \(monster.name) \(self.attackPower) урона*")
                print("")
            }
        }
        
        else {
            monster.hp -= self.attackPower
            print("*\(name) нанес \(monster.name) \(self.attackPower) урона*")
            print("")
        }
    }
    
    func toString(){
        print("""
        Имя: \(self.name)
        Здоровье: \(self.hp)
        Сила атаки: \(self.attackPower)
        Сила защиты: \(self.defencePower)
        Класс: \(self.type)
        
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
    var name: String
    var hp: Int
    var attackPower: Int
    var monsterDifficulty: monsterDifficulty
    var type: String
    
    init(name: String, type: Int){
        self.name = name
        if (type <= 20){
            self.hp = 30
            self.attackPower = 20
            self.monsterDifficulty = .easy
            self.type = "Легкий"
        }
        else if (20 < type && type <= 70){
            self.hp = 50
            self.attackPower = 30
            self.monsterDifficulty = .middle
            self.type = "Средний"
        }
        else{
            self.hp = 100
            self.attackPower = 50
            self.monsterDifficulty = .hard
            self.type = "Сложный"
        }
    }
    
    func attack(player: Player){
        var mirrored = false;
        if (player.playerType == .mirrorer){  // Способность отражателя
            let chance = Int.random(in: 1...10)
        
            if (chance <= 3){
                print("\(player.name) СМОГ ОТРАЗИТЬ АТАКУ \(self.name)")
                print("")
                mirrored = true
                sleep(sleepTime)
            }
        }
        if (!mirrored){
            if (monsterDifficulty == .hard){
                let chance = Int.random(in: 1...10)
                if (chance <= 3){  // Способность сложного монстра нанести сильный удар
                    player.hp -= self.attackPower + 15 - player.defencePower
                    print("\(name) нанес \(player.name) сильный удар")
                    print("*\(name) нанес \(player.name) \(self.attackPower + 15) урона*")
                    print("")
                    sleep(sleepTime)
                }
                else{
                    player.hp -= self.attackPower - player.defencePower
                    print("*\(name) нанес \(player.name) \(self.attackPower) урона*")
                    print("")
                    sleep(sleepTime)
                }
            }
            else{
                player.hp -= self.attackPower - player.defencePower
                print("*\(name) нанес \(player.name) \(self.attackPower) урона*")
                print("")
                sleep(sleepTime)
            }
        }
    }
}

func printGeneralStatistics(){
    print("МОНСТРОВ ОСТАЛОСЬ: \(monsterNum)")
    print("")
    sleep(sleepTime)
}

func printStatistics(player1: Player, player2: Player, player3: Player, monster1: Monster, monster2: Monster, monster3: Monster){
    print("Здоровье Игрока1: \(player1.hp)")
    print("Здоровье Игрока2: \(player2.hp)")
    print("Здоровье Игрока3: \(player3.hp)")
    print("Здоровье Монстра1: \(monster1.hp)")
    print("Здоровье Монстра2: \(monster2.hp)")
    print("Здоровье Монстра3: \(monster3.hp)")
    print("")
    sleep(sleepTime)
}

func printCurStatistics(player: Player, monster: Monster){
    print("Здоровье \(player.name): \(player.hp)")
    print("Здоровье \(monster.name): \(monster.hp)")
    print("")
    sleep(sleepTime)
}


// Начало игры
    
let greeting1 = """
Приветствую тебя в игре gameName, выбери персонажа:
1. Отражатель (имеет 30% шанс полностью отразить атаку противника)
2. Лекарь (восполняет 20 единиц здоровья после того, как у вас осталось <=50 единиц здоровья)
3. Кевин (имеет 10% шанс убить противника с одного удара)

"""

print(greeting1)
sleep(sleepTime)
var menu1 = Int.random(in: 1...3)
var menu2 = Int.random(in: 1...3)
var menu3 = Int.random(in: 1...3)

var player1 = Player(name: "Герой1", numType: menu1)
var player2 = Player(name: "Герой2", numType: menu2)
var player3 = Player(name: "Герой3", numType: menu3)

print("Ваши персонажи:")
sleep(sleepTime)
(player1.toString())
sleep(sleepTime)
(player2.toString())
sleep(sleepTime)
(player3.toString())
sleep(sleepTime)
print("СЕГОДНЯ ВАМ ПРЕДСТОИТ ОДОЛЕТЬ \(monsterNum) МОНСТРОВ")
sleep(sleepTime)
print("Игра начинается...")
sleep(sleepTime)
print("--------------------------------------------------------------------------------")
sleep(sleepTime)

var players = [player1, player2, player3]
var playersNum = 3

while (playersNum != 0 && monsterNum != 0){
    let chance = Int.random(in: 1...10)
    if (chance <= 5){
        print("Вы идете в поисках монстра...")
        sleep(sleepTime)
    }
    
    if (chance == 1){
        if (player1.isAlive && !player1.haveSword){
            print("\(player1.name) нашел мечь, его сила удара увеличилась")
            player1.haveSword = true
            player1.attackPower += 20
            sleep(sleepTime)
        }
        else if(player2.isAlive && !player2.haveSword){
            print("\(player2.name) нашел мечь, его сила удара увеличилась")
            player2.haveSword = true
            player2.attackPower += 20
            sleep(sleepTime)
        }
        
        else if(player3.isAlive && !player3.haveSword){
            print("\(player3.name) нашел мечь, его сила удара увеличилась")
            player3.haveSword = true
            player3.attackPower += 20
            sleep(sleepTime)
        }
    }
    
    if (chance == 2){
        if (player1.isAlive && !player1.haveShield){
            print("\(player1.name) нашел щит, количество получаемого урона уменьшится")
            player1.haveShield = true
            player1.defencePower += 20
            sleep(sleepTime)
        }
        else if(player2.isAlive && !player2.haveShield){
            print("\(player2.name) нашел щит, количество получаемого урона уменьшится")
            player2.haveShield = true
            player2.defencePower += 20
            sleep(sleepTime)
        }
        
        else if(player3.isAlive && !player3.haveShield){
            print("\(player3.name) нашел щит, количество получаемого урона уменьшится")
            player3.haveShield = true
            player3.defencePower += 20
            sleep(sleepTime)
        }
    }
    
    else if (chance > 5){
        print("ВЫ ВСТРЕТИЛИ МОНСТРОВ, ВСТУПАЕМ В БОЙ!")
        print("")
        
        var curMonstersNum = 3

        let monsterDifficulty1 = Int.random(in: 1...100)
        let monsterDifficulty2 = Int.random(in: 1...100)
        let monsterDifficulty3 = Int.random(in: 1...100)
        
        let monster1 = Monster(name: "Монстр1", type: monsterDifficulty1)
        let monster2 = Monster(name: "Монстр2", type: monsterDifficulty2)
        let monster3 = Monster(name: "Монстр3", type: monsterDifficulty3)

        sleep(sleepTime)
        
        let monsters = """
                    Перед вами 3 монстра:
                    \(monster1.type)
                    \(monster2.type)
                    \(monster3.type)
                    """
        print(monsters)
        print("")
        sleep(sleepTime)
        printStatistics(player1: player1, player2: player2, player3: player3, monster1: monster1, monster2: monster2, monster3: monster3)
        sleep(sleepTime)
        
        // Атаки
        var curPlayer = player1
        
        if player1.isAlive{
            curPlayer = player1
        }
        else if player2.isAlive{
            curPlayer = player2
        }
        else if player3.isAlive{
            curPlayer = player3
        }
        
        var curMonster = monster1
        
        while (curMonstersNum != 0 && playersNum != 0){
            let curFight = fight(player: curPlayer, monster: curMonster)
            if (curFight){
                curMonstersNum -= 1
                if (curMonstersNum != 0){
                        print("Переходим к следующему монстру")
                        print("")
                        sleep(sleepTime)
                    if (curMonster === monster1){
                        curMonster = monster2
                    }
                    else if (curMonster === monster2){
                            curMonster = monster3
                    }
                }
            }
            else{
                playersNum -= 1
                if (playersNum != 0){
                    print("\(curPlayer.name) проиграл, в бой вступает следующий герой")
                    print("")
                    sleep(sleepTime)
                    
                    if (curPlayer === player1){
                        curPlayer = player2
                    }
                    else if (curPlayer === player2){
                            curPlayer = player3
                    }
                }
            }
        }
    }
                
    func fight(player: Player, monster: Monster) -> Bool{  // true - Монстр умер; false - Герой погиб
        var res = true
        while (player.hp > 0  && monster.hp > 0){
            player.attack(monster: monster)
            sleep(sleepTime)
            if (monster.hp <= 0){
                monsterNum -= 1
                print("\(player.name) УБИЛ \(monster.name)")
                print("")
                sleep(sleepTime)
                res = true
                printGeneralStatistics()
                break
            }
            
            printCurStatistics(player: player, monster: monster)
            
            monster.attack(player: player)
            
            if (player.hp <= 0){
                print("\(player.name) МЕРТВ")
                player.hp = 0
                player.isAlive = false
                sleep(sleepTime)
                res = false
            }

            if (player.playerType == .healer && player.hp <= 50 && player.isAlive){  // Способность лекаря
                player.hp += 20
                print("*\(player.name) восстановил 20 единиц здоровья*")
                print("")
                sleep(sleepTime)
            }
            
            printCurStatistics(player: player, monster: monster)

        }
        return res
    }
}


print("--------------------------------------------------------------------------------")
print("ИГРА ОКОНЧЕНА")


if (playersNum == 0){
    print("ВЫ ПРОИГРАЛИ!")
}
else if (monsterNum == 0){
    print("ВЫ ВЫИГРАЛИ!")
}
