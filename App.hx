package; 

class App {
    public var display:Display;
    private var point:Point;
    public var warriorStock = [];
    public var wallStock = [];

    public function new() {
        display = new Display(20, 10);
        warriorStock = Warrior.createWarriors(display);
        wallStock = Wall.createWalls(display);
        //Fight.fight(warriorStock);
    }

    public function drawWarrior(w:Warrior){
        display.setPixel(w.position, w.name.charAt(0));
        return w;
    }

    public function drawWall(w:Wall){
        display.setPixel(w.position, w.name);
        return w;
    }

    public function isEqual(w1, w2){
        if (Std.int(w1.position.x) == Std.int(w2.position.x) && Std.int(w1.position.y) == Std.int(w2.position.y)){
            return true;
        } else {
            return false;
        }
    }

    public function update() {
        display.clear();
        for (e in warriorStock){
            if (e.health > 0) {
                var random1 = Math.random() - 0.5;
                var random2 = Math.random() - 0.5;
                e.position.x += random1;
                e.position.y += random2;
                    for (v in wallStock){
                        if (isEqual(e, v) == true){
                            e.position.x -= random1;
                            e.position.y -= random2;
                        }
                        drawWall(v);
                    }
                if (e.position.x > (display.width - 1)){
                    e.position.x = display.width - 1;
                } else if (e.position.x < 0){
                    e.position.x = 0;
                } else if (e.position.y > (display.height - 1)){
                    e.position.y = display.height - 1;
                } else if (e.position.y < 0){
                    e.position.y = 0;
                }
            }
            for (e2 in warriorStock){
                if (e != e2){
                    if (isEqual(e, e2) == true){
                        if (e.health > 0){
                            e.attack(e2);
                            if (e2.health <= 0) {
                                warriorStock.remove(e2);
                                trace(e2.name + " is gone");
                            }
                        }
                    }
                }
            }
            drawWarrior(e);
        }
        display.draw();
    }
}
