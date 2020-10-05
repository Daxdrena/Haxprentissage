package;

class Shield {
    public var name:String;
    public var defense:Int;
    public var block:Int;

    public function new(name, defense, block){
        this.name = name;
        this.defense = defense;
        this.block = block;
    }

    static public function createShields(){
        var pavois = new Shield("pavois", 16, 20);
        var targe = new Shield("targe", 1, 70);
        var rondache = new Shield("rondache", 8, 50);
        var egide = new Shield("egide", 12, 35);
        var rampart = new Shield("rampart", 20, 10);
        return [pavois, targe, rondache, egide, rampart];
    }
}