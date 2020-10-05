package; 

class App {
    public var display:Display;
    private var point:Point;
    public var warriorStock = [];

    public function new() {
        display = new Display(100, 40);
        warriorStock = Warrior.createWarriors(display);
        //Fight.fight(warriorStock);
    }

    public function drawWarrior(w:Warrior){
        display.setPixel(w.position, 1);
        return w;
    }

    public function update() {
        display.clear();
        for (e in warriorStock){
            drawWarrior(e);
        }
        display.draw();
    }
}
