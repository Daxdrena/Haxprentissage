package; 

class Name {

    static public function createNames() {
        var count = 0;
        var consonne = ["z", "r", "t", "p", "q", "s", "d", "f", "g", "h", "j", "k", "l", "m", "w", "x", "c", "v", "b", "n"];
        var voyelle = ["a", "e", "y", "u", "i", "o"];
        var nameStock = [];
        while (count < 3000) {
            var name = (consonne[Std.random(consonne.length)].toUpperCase()) + voyelle[Std.random(voyelle.length)] + consonne[Std.random(consonne.length)] + voyelle[Std.random(voyelle.length)];
            nameStock.push(name);
            count ++;
        }
        return nameStock;
    }
}