package;

class Fight {

    static public function fight(warriorStock:Array<Warrior>) {

        var warriorDefeated = [];
        while (warriorStock.length > 1){
            var warrior1 = warriorStock[Std.random(warriorStock.length)];
            var warrior2 = warriorStock[Std.random(warriorStock.length)];
            while (warrior1 == warrior2){
                warrior2 = warriorStock[Std.random(warriorStock.length)];
                //trace("changement");
            }
            warrior1.health = warrior1.maxHealth;
            warrior2.health = warrior2.maxHealth;
            while (warrior1.health > 0 && warrior2.health > 0) {
                if (warrior1.initiative > warrior2.initiative) {
                    warrior1.attack(warrior2);
                    warrior2.attack(warrior1);
                } else if (warrior2.initiative > warrior1.initiative) {
                    warrior2.attack(warrior1);
                    warrior1.attack(warrior2);
                } else {
                    break;
                }
            }
            if (warrior1.health > warrior2.health) {
                //trace(warrior1.name + " win against " + warrior2.name);
                warriorDefeated.push(warrior2);
                warriorStock.remove(warrior2);
                warrior1.victory += 1;
                //trace(warrior1.name + " got " + warrior1.victory + " victory !");
            } else if (warrior2.health > warrior1.health) {
                //trace(warrior2.name + " win against " + warrior1.name);
                warriorDefeated.push(warrior1);
                warriorStock.remove(warrior1);
                warrior2.victory += 1;
                //trace(warrior2.name + " got " + warrior2.victory + " victory !");
            }
        }

        warriorDefeated.push(warriorStock[0]);
        warriorDefeated.sort(victorySort);
        warriorDefeated.reverse();
        if (warriorDefeated[0] == warriorStock[0]){
            trace("The top 3 of slayers of this tournament are " + warriorDefeated[2].name + " with " + warriorDefeated[2].victory + " kills, after this one, there is " + warriorDefeated[1].name + " with " + warriorDefeated[1].victory + " kills, and for the top of the top of slayer it's " + warriorDefeated[0].name + " with " + warriorDefeated[0].victory + " kills, plus of that the victory is for this player !");
        } else {
            trace("The top 3 of slayers of this tournament are " + warriorDefeated[2].name + " with " + warriorDefeated[2].victory + " kills, after this one, there is " + warriorDefeated[1].name + " with " + warriorDefeated[1].victory + " kills, and for the top of the top of slayer it's " + warriorDefeated[0].name + " with " + warriorDefeated[0].victory + " kills, unfortunately the final survivor is ... " + warriorStock[0].name + " with " + warriorStock[0].victory + " victory !");
        }
    }    

    static public function victorySort(a, b){
        if (a.victory < b.victory) return -1;
        else if (a.victory > b.victory) return 1;
        return 0;
    }
}