import Type;
var improvisedPoco:Character;
var gadget:Character;

function postCreate(){
	defaultCamZoom = 0.67;
	FlxG.camera.zoom = 0.67;
	
	midle();
	iconP1.visible = false;
	iconP2.visible = false;
	strumLines.members[0].characters[1].debugMode = true;
	improvisedPoco = new Character(100,100, "bite/poco", false,false, false);
	improvisedPoco.setPosition(1000, -800);
	improvisedPoco.scale.set(1,1);
	improvisedPoco.debugMode = true;
	improvisedPoco.danceOnBeat = false;
	improvisedPoco.animation.stop();
	improvisedPoco.playAnim("intro");
	insert(members.indexOf(codetrebor) -1, improvisedPoco);

	gadget = new Character(100,1000, "bite/primo", false,false,false);
	gadget.debugMode = true;
	gadget.danceOnBeat = false;
	gadget.animation.stop();
	gadget.playAnim("intro");
	gadget.screenCenter();
	gadget.scale.set(0.5,0.5);
	gadget.scrollFactor.set(0,0);
	improvisedPoco.scrollFactor.set(0,0);

	insert(members.indexOf(codetrebor) - 1, gadget);
	gadget.setPosition(-1500,-1200);
	gadget.visible = false;

}
var trebor;
var edgar1;
var edgar2;
var poco;
var mortis;
var fang;
var primo;
var strl = strumLines.members;
var chars = [];
var scales = [1,1.5,1.2,1.2,1.5,0.6,1.4];
function midle()
{
	trebor = strl[1].characters[0];
	edgar1 = strl[0].characters[0];
	poco = strl[0].characters[1];
	fang = strl[0].characters[2];
	mortis = strl[0].characters[3];
	primo = strl[0].characters[4];
	edgar2 = strl[0].characters[5];
	
	for(e in members){
		if(e.name != null || (Std.isOfType(e, FunkinSprite) && !(Std.isOfType(e, Character)))){
		e.scrollFactor.set(0,0);
		e.screenCenter();
			// trace(Type.getClassName(Type.getClass(e)) + " ==== " + e.name); // Outputs: flixel.FlxSprite
		}
		if(Std.isOfType(e, Character)){
			e.scrollFactor.set(0,0);
		}
	}
	for(i in [trebor, edgar1,poco,fang,mortis,primo,edgar2]){
		chars.push(i);
		i.holdTime = 6;
	}
	
	for(i in 1...chars.length){
		chars[i].screenCenter();
		chars[i].x -= 100;
		chars[i].scale.set(scales[i],scales[i]);
		chars[i].visible = false;
	}

	treborCam.x = 775;
	treborCam.y -= 270;
	trebor.scale.set(0.22,0.22);
	trebor.setPosition(-84,-997);

	win.x -= 180;
	win.scale.set(1.02,1.02);
	win.visible = false;

	poco.y -= 100;
	fang.y -= 200;
	mortis.y -= 360;
	edgar2.y -= 200;
	remove(mortis);
	insert(members.indexOf(fang) - 1, mortis);

	
	
}
function postUpdate(){
	camFollow.setPosition(lobby.x + 1150,lobby.y + 200);
	if(FlxG.keys.justPressed.T){
		lobby.visible = false;
		edgar1.visible = true;
	}
}

function stepHit(){
	if(curStep >= 224){
				lobby.visible = false;
				poco.debugMode = false;
				poco.danceOnBeat = true;

	}
	if(curStep >= 224 && curStep <= 768){
		edgar1.visible = true;
	} else if(curStep >= 768 && curStep <= 1152){
		edgar1.visible = false;
		poco.visible = true;
	} else if(curStep >= 1264 && curStep <= 1536){
		poco.visible = false;
		fang.visible = true;
	} else if(curStep >= 1536 && curStep <= 2048){
		fang.visible = false;
		mortis.visible = true;
		mortis.debugMode = false;
		mortis.danceOnBeat = true;
	} else if(curStep >= 2072 && curStep <= 2585){
		primo.visible = true;
		mortis.visible = false;
	} else if(curStep >= 2616 && curStep <=3383){
		primo.visible = false;
		edgar2.visible = true;
	} else if(curStep >= 3392){
		showdown.visible = false;
		win.visible = true;
		edgar2.visible = false;
	}
	switch(curStep){
		case 202:
			camGame.fade(0xFF000000, 1 / vocals.pitch, false);
		case 224:
			lobby.visible = false;
			camGame.fade(0xFF000000, 0.5 / vocals.pitch, true);
			edgar1.visible = true;
		
		case 742:
			improvisedPoco.visible = true;
			FlxTween.tween(improvisedPoco, {x: 700}, 0.2 / vocals.pitch);
		case 752:
			camZooming = false;
					FlxTween.tween(FlxG.camera, {zoom: 0.1}, 1 / vocals.pitch);
		case 768:
			improvisedPoco.visible = false;
			camZooming = true;
			FlxG.camera.zoom = 0.67;
			camGame.fade(0xFFFFFFFF, 0.3, true);
			edgar1.visible = false;
			poco.visible = true;
			poco.debugMode = false;
		case 880, 884, 888, 892:
			camGame.angle += 15;		
		case 896:
			camGame.angle = 0;
			camGame.fade(0xFFFFFFFF, 0.2 / vocals.pitch, true);

		case 1144:
			camGame.fade(0xFFFFFFFF, 0.15 / vocals.pitch, true);
			camGame.angle += 70;
		case 1148:
		camGame.angle += 70;
		case 1152:
			camGame.angle = 0;
			poco.visible = false;
		case 1264:
			fang.visible = true;

		case 1504:
			// fang.danceOnBeat = false;
			fang.idleSuffix = "-alt";
			mortis.debugMode = true;
			mortis.danceOnBeat = false;
		case 1516:
			mortis.x = -1360;

			mortis.playAnim("intro", true);
			mortis.visible = true;
			trace(mortis.x);
			FlxTween.tween(mortis, {x:mortis.x + 1400}, 0.7, {ease: FlxEase.cubeOut});
		case 1536:
			fang.visible = false;
			mortis.danceOnBeat = true;
			mortis.debugMode = false;
		case 2016:
			FlxTween.tween(gadget, {x: 1900}, 2 / vocals.pitch);
			gadget.visible = true;
		case 2048:
			mortis.visible = false;
		case 2072:
			primo.visible = true;
			primo.danceOnBeat = false;
			primo.debugMode = true;
			primo.playAnim("idle-alt", true);

		case 2082:
			primo.danceOnBeat = true;
			primo.debugMode = false;
	
		case 2585:
			primo.visible = false;
		case 2616:
			edgar2.visible = true;
			edgar2.x -= 1000;
			edgar2.playAnim("intro", true);
			FlxTween.tween(edgar2, {x:edgar2.x + 1000}, 0.5 / vocals.pitch, {ease:FlxEase.cubeOut});
			edgar2.danceOnBeat = false;
			edgar2.debugMode = true;
		case 2624:
			edgar2.danceOnBeat = true;
			edgar2.debugMode = false;

		case 3128:
			FlxTween.tween(camGame, {angle:360}, 0.5 / vocals.pitch, {ease:FlxEase.cubeIn, onComplete:function(){
				camGame.angle = 0;
			}});
		case 3384:
			FlxTween.tween(edgar2, {alpha:0}, 0.5 * vocals.pitch);
		case 3392:
			camGame.fade(0xFFFFFFFF, 0.3, true);
			showdown.visible = false;
			win.visible = true;

		case 3670:
			camGame.fade(0xFF000000, 0.01, false);

	}
}

function onNoteHit(e){
	if(e.noteType == "Alt Animation"){
		e.cancelAnim();
		// strl[0].characters[0].playAnim("sad", true);
		edgar1.playAnim("sad", true);
		edgar2.playAnim("sad", true);

		fang.playAnim("laugh", true);
		switch(e.direction){
			case 0:
				poco.playAnim("singLEFT-alt");
				primo.playAnim("singLEFT-alt");
			case 1:
				poco.playAnim("singDOWN-alt");
				primo.playAnim("singDOWN-alt");
			case 2:
				poco.playAnim("singUP-alt");
				primo.playAnim("singUP-alt");
			case 3:
				poco.playAnim("singRIGHT-alt");
				primo.playAnim("singRIGHT-alt");
		}
		
	}
}

