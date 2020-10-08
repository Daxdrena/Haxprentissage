package;

class Warrior{
    public var name:String;
    public var health:Int;
    public var strength:Int;
    public var initiative:Int;
    public var weapon:Weapon;
    public var shield:Shield;
    public var maxHealth:Int;
    public var victory:Int;
    public var position:Point;
    public var display:Display;

    public function new(name, health, strength, initiative, weapon, shield, victory, position) {
        this.name = name;
        this.health = health;
        this.strength = strength;
        this.initiative = initiative;
        this.weapon = weapon;
        this.shield = shield;
        this.maxHealth = health;
        this.victory = victory;
        this.position = position;
    }

    public function attack(opponent) {
        var damage = Std.random(strength);
        if (weapon != null) {
            var crit = Std.random(100);
            if (crit < weapon.critique) {
                damage += weapon.damage * 2;
            } else {
                damage += weapon.damage;
            }
        }
        if (opponent.shield != null) {
            var blockage = Std.random(100);
            damage -= opponent.shield.defense;
            if (blockage < opponent.shield.block) {
                damage = 0;
            }
        }
        damage = Std.int(Math.max(0, damage));
        opponent.health -= damage;
        var vampirisme = Std.int((damage/100) * weapon.lifeSteal);
        if (health < maxHealth){
            health += vampirisme;
            if (health > maxHealth) {
                health = maxHealth;
            }
        }
    }

    static public function createWarriors(display){
        var count = 0;
        var weaponStock = Weapon.createWeapons();
        var shieldStock = Shield.createShields();
        var nameStock = Name.createNames();
        var warriorStock = [];
        while (count < 15) {
            var myWarrior = new Warrior(nameStock[Std.random(3001)], 100, 10, Std.random(3000), weaponStock[1], shieldStock[1], 0, new Point(Std.random(display.width), Std.random(display.height)));
            warriorStock.push(myWarrior);
            count ++;
        } 
        return warriorStock;
    }
}