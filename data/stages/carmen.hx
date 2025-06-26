import openfl.display.BlendMode;
function setvis(obj, arg){
	obj.visible = arg;
	obj.active = arg;
}
var vig:FunkinSprite;
var statics:FunkinSprite;
function postCreate(){
	setvis(strumLines.members[0].characters[1], false);
	setvis(strumLines.members[1].characters[0], false);
	vig = new FunkinSprite().loadGraphic(Paths.image("stages/carmen/vignette"));
	// vig.cameras = [camHUD];
	// add(vig);
	vig.screenCenter();

	statics = new FunkinSprite();
	statics.frames = Paths.getSparrowAtlas("stages/carmen/static");
	statics.animation.addByPrefix("static", "static", 24);
	statics.playAnim("static");
	// statics.cameras = [camHUD];
	statics.alpha = 1;
	// add(statics);
	statics.screenCenter();

	statics.blend = BlendMode.SUBTRACT;
	for(i in [vig, statics]){
		// insert(members.indexOf(strumLines.members[0].members[0]) + 2, i);
		// insert(members.indexOf(strumLines.members[0].members[0]) + 1, i);
		add(i);
		i.scrollFactor.set(0,0);
	}
	vig.cameras = [camHUD];
	vig.alpha = 0.6;
	strumLines.members[0].characters[1].setPosition(strumLines.members[0].characters[0].x - 50, strumLines.members[0].characters[0].y);

	gameOverSong = "carmen/gameOver";
}	

function onNoteCreation(e){
	if(e.noteType == "Carmen Note"){
		e.noteSprite = "stages/carmen/note";
	}
}
var startedthing = false;
function update(){

	if(startingSong == false && startedthing == false){
		if(curStep >= 320){
				statics.blend = BlendMode.MULTIPLY;
				statics.alpha = 0.1;

		}
		if(curStep >= 992 && curStep <= 1335){
			bg_carmen.alpha = 0;
		} 
	
		if(curStep >= 1334){
			
			setvis(strumLines.members[0].characters[0], false);
			setvis(strumLines.members[0].characters[1], true);
			// bg_carmen.color = 0xFF9999FF;
		}
		if(curStep >= 1344){
			bg_carmen.color = 0xFF9999FF;
			setvis(strumLines.members[0].characters[0], false);
			setvis(strumLines.members[0].characters[1], true);
			
			iconP2.setIcon("carmen/carmen2", true);
		}
		startedthing = true;
		
		
	}
}
function stepHit(){
	switch(curStep){
		case 320:
			// statics.alpha = 0.1;
			statics.blend = BlendMode.MULTIPLY;
				statics.alpha = 0.1;
			camGame.fade(0xFF000000, 0.4, true);
		case 960:
			FlxTween.tween(bg_carmen, {alpha:0}, 10 / inst.pitch);
		case 1336:
			FlxTween.tween(bg_carmen, {alpha:1}, 2 / inst.pitch);
		case 1344:
			iconP2.setIcon("carmen/carmen2", true);
			bg_carmen.color = 0xFF9999FF;
			camGame.fade(0xFF000000, 0.7, true);
			setvis(strumLines.members[0].characters[0], false);
			setvis(strumLines.members[0].characters[1], true);
	}
}



function onDadHit(){
	switch(PlayState.instance.opponentMode){
		case false:
			if(health >= 0.2){
				health -= 0.03;
			}
		case true:
			if(health <= 1.9){
				health += 0.03;
			}
	}
}
var notShared = 0;

function onPlayerMiss(e){
	if(e.noteType == "Carmen Note"){
		// reset();
		notShared += 1;
		if(notShared == 15){
			health = 0;
		}
	}

}