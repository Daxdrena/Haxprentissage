package;

import js.Browser.document;

class Display {
    public var width:Int;
    public var height:Int;
    public var pixels:Array<Int>;
    public var warrior:Warrior;
    public var name:String;

    public function new(width, height) {
        this.width = width;
        this.height = height;
        clear();
    }

    public function clear() {
        var total = width * height;
        pixels = [];

        for(i in 0...total) {
            pixels.push(0);
        }
    }

    public function draw() {
        var string = "";
        var letter = name.charAt(0);

        for(y in 0...height) {
            for(x in 0...width) {
                var v = pixels[y * width + x];
                switch(v) {
                    case 0:
                        string += ".";
                    case 1:
                        string += letter;
                }
            }
            string += "\n";
        }

        document.getElementById("display").innerText = string;
    }
    public function setPixel(point, value) {
        var x = Std.int(point.x);
        var y = Std.int(point.y);
        if(x>0 && x<width && y>0 && y<height) {
            pixels[y * width + x] = value;
        }
    }
}