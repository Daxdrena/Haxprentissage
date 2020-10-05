package;

import js.Browser.window;

class Main {
    static public function main():Void {
        var loop;
        var app = new App();

        loop = function(time) {
            app.update();
            window.requestAnimationFrame(loop);
        }

        window.requestAnimationFrame(loop);
    }
}

















// package;

// import js.Browser.window;
// import js.Browser.document;

// class Point {
//     public var x:Float;
//     public var y:Float;
//     public function new(x, y){
//         this.x = x;
//         this.y = y;
//     }
// }

// class Display {
//     public var width:Int;
//     public var height:Int;
//     public var pixels:Array<Int>;

//     public function new(width, height) {
//         this.width = width;
//         this.height = height;
//         clear();
//     }

//     public function clear() {
//         var total = width * height;
//         pixels = [];

//         for(i in 0...total) {
//             pixels.push(0);
//         }
//     }

//     public function draw() {
//         var string = "";

//         for(y in 0...height) {
//             for(x in 0...width) {
//                 var v = pixels[y * width + x];
//                 switch(v) {
//                     case 0:
//                         string += ".";
//                     case 1:
//                         string += "#";
//                 }
//             }

//             string += "\n";
//         }

//         document.getElementById("display").innerText = string;
//     }
//     public function setPixel(point, value) {
//         var x = Std.int(point.x);
//         var y = Std.int(point.y);
//         if(x>0 && x<width && y>0 && y<height) {
//             pixels[y * width + x] = value;
//         }
//     }
// }

// class Warrior{
//     public var name:String;
//     public var health:Int;
//     public var strength:Int;
//     public var initiative:Int;
//     public var weapon:Weapon;
//     public var shield:Shield;
//     public var maxHealth:Int;
//     public var victory:Int;

//     public function new(name, health, strength, initiative, weapon, shield, victory) {
//         this.name = name;
//         this.health = health;
//         this.strength = strength;
//         this.initiative = initiative;
//         this.weapon = weapon;
//         this.shield = shield;
//         this.maxHealth = health;
//         this.victory = victory;
//     }

//     public function attack(opponent) {
//         var damage = Std.random(strength);
//         if (weapon != null) {
//             var crit = Std.random(100);
//             if (crit < weapon.critique) {
//                 damage += weapon.damage * 2;
//             } else {
//                 damage += weapon.damage;
//             }
//         }
//         if (opponent.shield != null) {
//             var blockage = Std.random(100);
//             damage -= opponent.shield.defense;
//             if (blockage < opponent.shield.block) {
//                 damage = 0;
//             }
//         }
//         damage = Std.int(Math.max(0, damage));
//         opponent.health -= damage;
//         var vampirisme = Std.int((damage/100) * weapon.lifeSteal);
//         if (health < maxHealth){
//             health += vampirisme;
//             if (health > maxHealth) {
//                 health = maxHealth;
//             }
//         }
//     }
// }

// class Weapon {
//     public var name:String;
//     public var damage:Int;
//     public var critique:Int;
//     public var lifeSteal:Int;

//     public function new(name, damage, critique, lifeSteal) {
//         this.name = name;
//         this.damage = damage;
//         this.critique = critique;
//         this.lifeSteal = lifeSteal;
//     }
// }

// class Shield {
//     public var name:String;
//     public var defense:Int;
//     public var block:Int;

//     public function new(name, defense, block){
//         this.name = name;
//         this.defense = defense;
//         this.block = block;
//     }
// }

// class App {
//     public var display:Display;
//     private var point:Point;

//     public function new() {
//         display = new Display(100, 40);
//         point = new Point(0,15);
//     }

//     public function update() {
//         display.clear();

//         point.x += 0.1;
//         point.y += Math.random() - 0.5;

//         display.setPixel(point, 1);
//         display.draw();
//     }
// }

// class Main {
//     static public function main():Void {
//         var loop;
//         var app = new App();

//         loop = function(time) {
//             app.update();
//             window.requestAnimationFrame(loop);
//         }

//         window.requestAnimationFrame(loop);
//     }

// }

// class Main{
    
//     static function main() {
//         var weaponStock = createWeapons();
//         trace("weapon created");
//         var shieldStock = createShields();
//         trace("shield created");
//         var warriorStock = createWarriors();
//         trace("warriors created");
//         var warriorDefeated = [];
//         while (warriorStock.length > 1){
//             var warrior1 = warriorStock[Std.random(warriorStock.length)];
//             var warrior2 = warriorStock[Std.random(warriorStock.length)];
//             while (warrior1 == warrior2){
//                 warrior2 = warriorStock[Std.random(warriorStock.length)];
//                 //trace("changement");
//             }
//             warrior1.weapon = weaponStock[Std.random(5)];
//             warrior2.weapon = weaponStock[Std.random(5)];
//             warrior1.shield = shieldStock[Std.random(5)];
//             warrior2.shield = shieldStock[Std.random(5)];
//             warrior1.health = warrior1.maxHealth;
//             warrior2.health = warrior2.maxHealth;
//             while (warrior1.health > 0 && warrior2.health > 0) {
//                 if (warrior1.initiative > warrior2.initiative) {
//                     warrior1.attack(warrior2);
//                     warrior2.attack(warrior1);
//                 } else if (warrior2.initiative > warrior1.initiative) {
//                     warrior2.attack(warrior1);
//                     warrior1.attack(warrior2);
//                 } else {
//                     break;
//                 }
//             }
//             if (warrior1.health > warrior2.health) {
//                 //trace(warrior1.name + " win against " + warrior2.name);
//                 warriorDefeated.push(warrior2);
//                 warriorStock.remove(warrior2);
//                 warrior1.victory += 1;
//                 //trace(warrior1.name + " got " + warrior1.victory + " victory !");
//             } else if (warrior2.health > warrior1.health) {
//                 //trace(warrior2.name + " win against " + warrior1.name);
//                 warriorDefeated.push(warrior1);
//                 warriorStock.remove(warrior1);
//                 warrior2.victory += 1;
//                 //trace(warrior2.name + " got " + warrior2.victory + " victory !");
//             }
//         }

//         warriorDefeated.push(warriorStock[0]);
//         warriorDefeated.sort(victorySort);
//         warriorDefeated.reverse();
//         if (warriorDefeated[0] == warriorStock[0]){
//             trace("The top 3 of slayers of this tournament are " + warriorDefeated[2].name + " with " + warriorDefeated[2].victory + " kills, after this one, there is " + warriorDefeated[1].name + " with " + warriorDefeated[1].victory + " kills, and for the top of the top of slayer it's " + warriorDefeated[0].name + " with " + warriorDefeated[0].victory + " kills, plus of that the victory is for this player !");
//         } else {
//             trace("The top 3 of slayers of this tournament are " + warriorDefeated[2].name + " with " + warriorDefeated[2].victory + " kills, after this one, there is " + warriorDefeated[1].name + " with " + warriorDefeated[1].victory + " kills, and for the top of the top of slayer it's " + warriorDefeated[0].name + " with " + warriorDefeated[0].victory + " kills, unfortunately the final survivor is ... " + warriorStock[0].name + " with " + warriorStock[0].victory + " victory !");
//         }
//     }    

//     static function victorySort(a, b){
//             if (a.victory < b.victory) return -1;
//             else if (a.victory > b.victory) return 1;
//             return 0;
//     }

//     static function createNames() {
//         var count = 0;
//         var consonne = ["z", "r", "t", "p", "q", "s", "d", "f", "g", "h", "j", "k", "l", "m", "w", "x", "c", "v", "b", "n"];
//         var voyelle = ["a", "e", "y", "u", "i", "o"];
//         var nameStock = [];
//         while (count < 30000) {
//             var name = (consonne[Std.random(consonne.length)].toUpperCase()) + voyelle[Std.random(voyelle.length)] + consonne[Std.random(consonne.length)] + voyelle[Std.random(voyelle.length)] + voyelle[Std.random(voyelle.length)];
//             nameStock.push(name);
//             count ++;
//         }
//         return nameStock;
//     }
//     static function createWarriors(){
//         var count = 0;
//         var weaponStock = createWeapons();
//         var shieldStock = createShields();
//         var nameStock = createNames();
//         var warriorStock = [];
//         while (count < 1000) {
//             var myWarrior = new Warrior(nameStock[Std.random(3001)], 100, 10, Std.random(3000), weaponStock[1], shieldStock[1], 0);
//             warriorStock.push(myWarrior);
//             count ++;
//         } 
//         return warriorStock;
//     }

//     static function createWeapons(){
//         var axe = new Weapon("axe", 35, 10, 25);
//         var hammer = new Weapon("hammer", 50, 5, 10);
//         var masse = new Weapon("masse", 15, 40, 45);
//         var dague = new Weapon("dague", 10, 95, 50);
//         var sword = new Weapon("sword", 25, 15, 35);
//         return [axe, hammer, sword, masse, dague];
//     }

//     static function createShields(){
//         var pavois = new Shield("pavois", 16, 20);
//         var targe = new Shield("targe", 1, 70);
//         var rondache = new Shield("rondache", 8, 50);
//         var egide = new Shield("egide", 12, 35);
//         var rampart = new Shield("rampart", 20, 10);
//         return [pavois, targe, rondache, egide, rampart];
//     }
// }