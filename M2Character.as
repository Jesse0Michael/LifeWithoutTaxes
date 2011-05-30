package
{
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;
	
	public class M2Character extends MovieClip 
	{
		private const HORIZONTAL_SPEED:int=7;
		private const VERTICAL_SPEED:int=7;
		private var distanceTraveled:int = 1;
		private var damageDone:int = 1;
		private var charMoveX:int;
		private var charMoveY:int;
		private var rightArrow:Boolean = false;
		private var leftArrow:Boolean = false;
		private var upArrow:Boolean = false;
		private var downArrow:Boolean = false;
		private var exploTimer:Timer;
		private var explo:aExplosion = new aExplosion();
		public var char:M2CharacterCar;
		private var bkg1:M2_Bkg;
		private var bkg2:M2_Bkg;
		private var damMeter:M2DamageMeter = new M2DamageMeter();
		private var distanceMeter:M2DistanceMeter = new M2DistanceMeter();
		private var distanceTimer:Timer = new Timer(5000, 1);
		// should be 5000 = 1.05min gameplay time, 7000=1.51mins of gameplaytime. pick 1.
		
		public function M2Character()
		{
			damageDone=1;
			damMeter.x = 710;
			damMeter.y = 75;
			distanceMeter.x = 55;
			distanceMeter.y = 75;
			distanceMeter.gotoAndStop(1);
			
			char=new M2CharacterCar;
			bkg1= new M2_Bkg;
			bkg2= new M2_Bkg;
			bkg2.y=-600;
			char.x=380;
			char.y=450;
			char.addEventListener(KeyboardEvent.KEY_UP, keyUpFunction);
			char.addEventListener(KeyboardEvent.KEY_DOWN, keyDownFunction);
			char.addEventListener(Event.ENTER_FRAME, update);
			addChildAt(bkg1,0);
			addChildAt(bkg2,0);
			addChild(char);
			addChild(damMeter);
			
			distanceTimer.addEventListener(TimerEvent.TIMER_COMPLETE, dTimer);
			addChild(distanceMeter);
			
			
			distanceTimer.start();
			
			
		}
		public function update(e:Event)
		{
			
			damMeter.gotoAndStop(damageDone);
			stage.stageFocusRect=false;
			stage.focus=char;
			
			bkg2.y+=10;
			bkg1.y+=10;
			if(bkg1.y>600){
			bkg1.y=-600;
			}
			if(bkg2.y>600){
			bkg2.y=-600;
			}
			handleInput();
			checkCollisions();
			checkWin();
			checkLose();
			
			
			if(leftArrow){
				char.gotoAndStop(2);
			}
			if(rightArrow){
				char.gotoAndStop(3);
			}
			if(leftArrow == false && rightArrow == false){
				char.gotoAndStop(1);
			}
			
			
			
		}
		public function checkLose()
		{
			if (damageDone>=13)
			{
				lifeWithoutTaxes.gameEnd=true;
				if(lifeWithoutTaxes.obstacleArray.length>=1)
				for(var k:int=lifeWithoutTaxes.obstacleArray.length-1;k>=0;k--)
				{
					lifeWithoutTaxes.obstacleArray[k].removeObstacle();
				}
				lifeWithoutTaxes.obstacleArray = new Array();
				if(lifeWithoutTaxes.carArray.length>=1)
				for(var l:int=lifeWithoutTaxes.carArray.length-1;l>=0;l--)
				{
					lifeWithoutTaxes.carArray[l].removeCar();
				}
				lifeWithoutTaxes.carArray = new Array();
				lifeWithoutTaxes.swerveArray = new Array();
				lifeWithoutTaxes.obstacleArray = new Array();
				MovieClip(root).gotoAndStop("MiniGame_2_Lose");
				MovieClip(root).frameCheck();
				removeCharacter();
				
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
			}
		}
		public function checkWin()
		{
			if (distanceTraveled==13)
			{
				lifeWithoutTaxes.gameEnd=true;
				if(lifeWithoutTaxes.obstacleArray.length>=1)
				for(var k:int=lifeWithoutTaxes.obstacleArray.length-1;k>=0;k--)
				{
					lifeWithoutTaxes.obstacleArray[k].removeObstacle();
				}
				if(lifeWithoutTaxes.carArray.length>=1)
				for(var l:int=lifeWithoutTaxes.carArray.length-1;l>=0;l--)
				{
					//trace(lifeWithoutTaxes.carArray.length);
					lifeWithoutTaxes.carArray[l].removeCar();
					
				}
				lifeWithoutTaxes.carArray = new Array();
				lifeWithoutTaxes.obstacleArray = new Array();
				lifeWithoutTaxes.swerveArray = new Array();
				MovieClip(root).gotoAndStop("MiniGame_2_Win");
				MovieClip(root).frameCheck();
				removeCharacter();
				
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
			}
		}
		public function removeCharacter()
		{
			char.removeEventListener(Event.ENTER_FRAME, update);
			char.removeEventListener(KeyboardEvent.KEY_UP, keyUpFunction);
			char.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownFunction);
			bkg1.parent.removeChild(bkg1);
			bkg2.parent.removeChild(bkg2);
			parent.removeChild(this);
			//this.removeChild(oCar);
			
		}
		public function handleInput()
		{
			//trace(rightArrow);
			charMoveX=0;
			charMoveY=0;
			
				if(leftArrow&&char.x>170)
				{
					charMoveX -= HORIZONTAL_SPEED;
				}			
				if(rightArrow&&char.x<580)
				{
					charMoveX += HORIZONTAL_SPEED;
				}
				if(upArrow&&char.y>140)
				{
					charMoveY -= VERTICAL_SPEED;
				}			
				if(downArrow&&char.y<520)
				{
					charMoveY += VERTICAL_SPEED;
				}
			
			//movement
			char.x+=charMoveX;
			char.y+=charMoveY;
		}
		public function dTimer(e:TimerEvent)
		{
			distanceTraveled += 1;
			distanceMeter.gotoAndStop(distanceTraveled);
			distanceTimer.start();
		}
		// register key presses
		public function keyDownFunction(event:KeyboardEvent)
		{
			//trace("keydown called");
			if (event.keyCode == 37) {
					leftArrow = true;
					//trace("leftarrow down");
			} else if (event.keyCode == 39) {
					rightArrow = true;
			} else if (event.keyCode == 38) {
					upArrow = true;
	
			} else if (event.keyCode == 40) { 
					downArrow=true;
			} 
		}
			
		// register key ups
		public function keyUpFunction(event:KeyboardEvent) 
		{
			if (event.keyCode == 37) {
				leftArrow = false;
				//trace("leftarrow up");
			} else if (event.keyCode == 39) {
				rightArrow = false;
			} else if (event.keyCode == 38) {
				upArrow = false;
			} else if (event.keyCode == 40) {
				downArrow = false;
			}
		}
		public function deleteExplo(e:TimerEvent)
		{
			removeChild(explo);
			exploTimer.removeEventListener(TimerEvent.TIMER, deleteExplo);
		}
		public function checkCollisions()
		{
			for(var i:int=lifeWithoutTaxes.obstacleArray.length-1;i>=0;i--)
			{
				if(char.hitTestObject(lifeWithoutTaxes.obstacleArray[i]))
				{
					lifeWithoutTaxes.obstacleArray[i].removeObstacle();
					//ObjectFactory.removeObs();
					damageDone += 1;
					break;
					
				}else if(lifeWithoutTaxes.obstacleArray[i].y > 610)
				{
					lifeWithoutTaxes.obstacleArray[i].obstacleTooFar();
					break;
				}
			}
			
			for(var j:int=lifeWithoutTaxes.carArray.length-1;j>=0;j--)
			{
				if(char.hitTestObject(lifeWithoutTaxes.carArray[j]))
				{
					lifeWithoutTaxes.carArray[j].removeCar();
					//lifeWithoutTaxes.carArray[j].x+=50;
					//ObjectFactory.removeObs();
					
					explo.x = char.x+30;
					explo.y = char.y+20;
					addChild(explo);
					explo.gotoAndPlay(1);
					
					exploTimer = new Timer(200,1);
					exploTimer.addEventListener(TimerEvent.TIMER, deleteExplo);
					exploTimer.start();
					
					damageDone += 2;
					
					break;
					
				}
				else if(lifeWithoutTaxes.carArray[j].y > 610)
				{
					lifeWithoutTaxes.carArray[j].removeCar();
					break;
				}
			}
			
		}
	}
}