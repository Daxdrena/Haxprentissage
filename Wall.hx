package;

class Wall {
    public var position:Point;
    public var name:String;

    public function new(name, position){
        this.name = name;
        this.position = position;
    }

    static public function createWalls(display) {
        var count = 0;
        var wallStock = [];
        while (count < 10){
            var myWall = new Wall("#", new Point(Std.random(display.width), Std.random(display.height)));
            wallStock.push(myWall);
            count ++;
        }
        return wallStock;
    }
}