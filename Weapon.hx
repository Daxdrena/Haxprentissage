package;

class Weapon {
    public var name:String;
    public var damage:Int;
    public var critique:Int;
    public var lifeSteal:Int;

    public function new(name, damage, critique, lifeSteal) {
        this.name = name;
        this.damage = damage;
        this.critique = critique;
        this.lifeSteal = lifeSteal;
    }  

    static public function createWeapons(){
        var axe = new Weapon("axe", 35, 10, 25);
        var hammer = new Weapon("hammer", 50, 5, 10);
        var masse = new Weapon("masse", 15, 40, 45);
        var dague = new Weapon("dague", 10, 95, 50);
        var sword = new Weapon("sword", 25, 15, 35);
        return [axe, hammer, sword, masse, dague];
    }
}