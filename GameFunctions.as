package {
    import flash.utils.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import flash.net.*;
    import mx.core.*;
    import Functions;
    
    public class GameFunctions {
        public static var canvas:UIComponent = new UIComponent();
        public static var tilesize:int = 32;
        
        //load map function
        public static function loadmap(mapid:int):void {
            include 'data/gamedata/Map.as';
            var mapdata:Array = mapdatas[mapid][1];
            Functions.loadImage(mapdatas[mapid][0], showMap);
            function showMap(event:Event):void {
                var chipset:BitmapData = event.currentTarget.content.bitmapData;
                var chip:Bitmap = new Bitmap();
                for (var i:int = 0; i < mapdata.length; i++) {
                    for (var j:int = 0; j < mapdata[i].length; j++) {
                        chip = new Bitmap(Functions.cropImage(chipset, mapdata[i][j][0] * tilesize, mapdata[i][j][1] * tilesize, tilesize, tilesize));
                        chip.x = i * tilesize;
                        chip.y = j * tilesize;
                        canvas.addChild(chip);
                    }
                }
            }
        }
    }
}