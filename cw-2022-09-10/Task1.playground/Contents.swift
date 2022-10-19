import Darwin
protocol Shape{
    func countSquare() -> Double
}

struct Circle: Shape{
    var radius: Double
    
    init(radius: Double){
        self.radius = radius
    }
    
    func countSquare() -> Double {
        return 3.14 * (radius * radius)
    }
}

struct Square: Shape{
    var a: Double
    var b: Double
    
    init(a: Double, b: Double){
        self.a = a
        self.b = b
    }
    
    func countSquare() -> Double {
        return a * b
    }
}

struct Triangle: Shape{
    var a: Double
    var b: Double
    var c: Double
    var p: Double
    
    init(a: Double, b: Double, c: Double){
        self.a = a
        self.b = b
        self.c = c
        self.p = (a + b + c) / 2
    }
    
    func countSquare() -> Double {
        return sqrt(p*(p-a)*(p-b)*(p-c))
    }
}

var circle = Circle(radius: 12)
circle.countSquare()

var triangle = Triangle(a: 5, b: 4, c: 2)
print(triangle.countSquare())
