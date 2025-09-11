///// chart taken from https://filecache38.gamebanana.com/mods/suffering_sibling_v3_3450d.rar


var _jungkook:Float = 0;
function update(elapsed){
    _jungkook += elapsed * 3;
    
    sprite_5.angle = (0 + 50 * Math.cos(_jungkook
    //  - (0 + 2 * Math.sin(_jungkook / 4))
    )) / 10;

    // camHUD.angle = (0 + 10 * Math.cos(_jungkook / 1.8)) / 10;
    camGame.angle = (0 + 20 * Math.sin(_jungkook * 1.3)) / 10;
}
var pibby;
var bf;
var finn;
var jake;

var vignette:FunkinSprite;
function postCreate(){
    pibby = strumLines.members[1].characters[1];
    bf = strumLines.members[1].characters[0];
    finn = strumLines.members[0].characters[0];
    jake = strumLines.members[0].characters[1];
    remove(sprite_5);
    add(sprite_5);
    remove(strumLines.members[0].characters[0]);
    insert(members.indexOf(strumLines.members[0].characters[1]) + 2, strumLines.members[0].characters[0]);
    remove(strumLines.members[1].characters[1]);
    insert(members.indexOf(strumLines.members[1].characters[0]) - 1, strumLines.members[1].characters[1]);
    pibby.scale.set(2,2);
    pibby.y += 450;
    bf.y += 300;

    finn.y += 200;
    finn.scale.set(1.5,1.5);
    bf.scale.set(1.2,1.2);

    pibby.x += 200;
    bf.x += 200;
    jake.y += 200;
    jake.scale.set(1.1,1.1);
    finn.x -= 200;


    vignette = new FunkinSprite().loadGraphic(Paths.image("stages/SS/vignette"));
    add(vignette);
    vignette.setGraphicSize(FlxG.width + 0, FlxG.height + 0);
    vignette.cameras = [camHUD];
    vignette.scrollFactor.set(0,0);
    vignette.updateHitbox();
    vignette.screenCenter();
}
var offfffffffff = 1000;
function onNoteHit(e){
    switch(curCameraTarget){
        case 0:
        
            var offsetX = (e.direction == 0) ? -offfffffffff : (e.direction == 3 ? offfffffffff : 0);
            var offsetY = (e.direction == 1) ? -offfffffffff : (e.direction == 2 ? offfffffffff : 0);
            camFollow.setPosition(finn.x + offsetX, finn.y - offsetY);


    }
}

function onDadHit(e){
    e.preventAnim();
    switch(e.noteType){
        default:
            switch(e.direction){
                case 0: finn.playAnim("singLEFT",  true);
                case 1: finn.playAnim("singDOWN",  true);
                case 2: finn.playAnim("singUP",  true);
                case 3: finn.playAnim("singRIGHT",  true);
            }
        case "Second Char Sing", "Second Char Glitch":
            switch(e.direction){
                case 0: jake.playAnim("singLEFT",  true);
                case 1: jake.playAnim("singDOWN",  true);
                case 2: jake.playAnim("singUP",  true);
                case 3: jake.playAnim("singRIGHT",  true);
            }    
    }
}

function onPlayerHit(e){
    e.preventAnim();
    switch(e.noteType){
        default:
            switch(e.direction){
                case 0: bf.playAnim("singLEFT",  true);
                case 1: bf.playAnim("singDOWN",  true);
                case 2: bf.playAnim("singUP",  true);
                case 3: bf.playAnim("singRIGHT",  true);
            }
        case "Second Char Sing", "GF Sing":
            switch(e.direction){
                case 0: pibby.playAnim("singLEFT",  true);
                case 1: pibby.playAnim("singDOWN",  true);
                case 2: pibby.playAnim("singUP",  true);
                case 3: pibby.playAnim("singRIGHT",  true);
            }

    }
}


function onNoteCreation(e){
    if(e.noteType == "Glitch Note"){
        e.noteSprite = "game/notes/glitch";
    }
}