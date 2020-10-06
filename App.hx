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

    public function update() {
        display.clear();
        for (e in warriorStock){
            e.position.x += Math.random() - 0.5;
            e.position.y += Math.random() - 0.5;
            if (e.position.x > display.width){
                e.position.x = display.width;
            } else if (e.position.x < 0){
                e.position.x = 0;
            } else if (e.position.y > display.height){
                e.position.y = display.height;
            } else if (e.position.y < 0){
                e.position.y = 0;
            }
            for (e2 in warriorStock){
                if (e != e2){
                    if (e.position == e2.position){
                        e.attack(e2);
                        trace(e.health);
                    } else if (e.health <= 0){
                        warriorStock.remove(e);
                    }
                }
            }
            drawWarrior(e);
        }
        display.draw();
    }
}
