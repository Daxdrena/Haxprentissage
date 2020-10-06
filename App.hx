package; 

class App {
    public var display:Display;
    private var point:Point;
    public var warriorStock = [];

    public function new() {
        display = new Display(20, 10);
        warriorStock = Warrior.createWarriors(display);
        //Fight.fight(warriorStock);
    }

    public function drawWarrior(w:Warrior){
        display.setPixel(w.position, w.name.charAt(0));
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
            e.position.x += Math.random() - 0.5;
            e.position.y += Math.random() - 0.5;
            if (e.position.x > (display.width - 1)){
                e.position.x = display.width - 1;
            } else if (e.position.x < 0){
                e.position.x = 0;
            } else if (e.position.y > (display.height - 1)){
                e.position.y = display.height - 1;
            } else if (e.position.y < 0){
                e.position.y = 0;
            }
            for (e2 in warriorStock){
                if (e != e2){
                    if (isEqual(e, e2) == true){
                        if (e.health >= 1){
                            e.attack(e2);
                            trace(e.health);
                        }
                    } else if (e.health <= 0){
                        warriorStock.remove(e);
                        trace(e.name + " is gone");
                    }
                }
            }
            drawWarrior(e);
        }
        display.draw();
    }
}
