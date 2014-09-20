import GameFunctions;
import mx.controls.Alert;

//creationComplete
public function main():void {
    addChild(GameFunctions.canvas);
    GameFunctions.loadmap(0);
}