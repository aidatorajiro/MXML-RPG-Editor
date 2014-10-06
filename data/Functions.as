package data {
    import flash.utils.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import flash.net.*;
    
    public class Functions {
        //text loading
        public static function loadText(filepath:String, onComplete:Function):void {
            var urlloader:URLLoader = new URLLoader();
            urlloader.addEventListener(Event.COMPLETE, onComplete);
            urlloader.load(new URLRequest(filepath + '?' + Math.random()));
        }
        
        //image loading
        public static function loadImage(filepath:String, onComplete:Function):void {
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
            loader.load(new URLRequest(filepath + '?' + Math.random()));
        }
        
        //image cropping
        public static function cropImage(sourceBD:BitmapData, startx:int, starty:int, sizex:int, sizey:int):BitmapData {
            var cropBD:BitmapData = new BitmapData(sizex, sizey, true, 0x00000000);
            cropBD.copyPixels(sourceBD, new Rectangle(startx, starty, sizex, sizey), new Point(0, 0)); 
            return cropBD;
        }
        
        //automatic music generator
        public static function automusic(timing:Array, keyName:String):String {
            var score:String;
            
            var key:Array = ['c', 'd', 'e', 'f', 'g', 'a', 'b'];
            var current:Number;
            for (var i:int = 0; i < timing.length; i++) {
                current = Math.floor(Math.random() * key.length);
                
                if (typeof(timing[i]) == 'string') {
                    score += timing[i];
                    continue;
                }
                for (var j:int = 0; j < timing[i]; j++) {
                    var rand:Number = Math.random();
                    if (rand > 0.5) {
                        current = current + 1;
                    } else {
                        current = current - 1;
                    }
                    if (current < 0) {
                        current = key.length + current;
                        score += '>';
                    } else if (current >= key.length) {
                        current = Math.abs(key.length - current);
                        score += '<';
                    }
                    score += key[current];
                }
                
            }
            
            return score;
        }
    }
}