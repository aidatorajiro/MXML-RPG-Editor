package data {
    import flash.utils.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import flash.net.*;
    import mx.core.*;
    import mx.controls.Alert;
    import data.Functions;
    
    public class GameFunctions {
        public static var canvas:UIComponent = new UIComponent();
        public static var mapdata:Array = [];
        public static var tilesize:int = 32;
        public static var tilesetsrc:String = '';
        
        //load map function
        public static function loadmap(mapid:int):void {
            Functions.loadText('data/gamedata/Map' + mapid + '.txt', parser);
            function parser(event:Event):void{
                var maptext:String = (event.currentTarget as URLLoader).data;
                
                var array1:Array = maptext.split(',,,,')[1].split(',,,');
                var array2:Array = [];
                for (var i:int=0; i!=array1.length; i++){
                    array2 = array1[i].split(',,');
                    mapdata[i] = [];
                    
                    for (var j:int=0; j!=array2.length; j++){
                        mapdata[i][j] = array2[j].split(',');
                    }
                }
                tilesetsrc = maptext.split(',,,,')[0];
                
                Functions.loadImage(tilesetsrc, showMap);
                function showMap(event:Event):void {
                    var tilesetbmp:BitmapData = event.currentTarget.content.bitmapData;
                    var tilebmp:Bitmap = new Bitmap();
                    for (var i:int = 0; i < mapdata.length; i++) {
                        for (var j:int = 0; j < mapdata[i].length; j++) {
                            tilebmp = new Bitmap(Functions.cropImage(tilesetbmp, mapdata[i][j][0] * tilesize, mapdata[i][j][1] * tilesize, tilesize, tilesize));
                            tilebmp.x = i * tilesize;
                            tilebmp.y = j * tilesize;
                            canvas.addChild(tilebmp);
                        }
                    }
                }
            }
        }
    }
}