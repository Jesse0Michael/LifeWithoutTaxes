package
{
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;
	
	public class M5Hose extends MovieClip 
	{
		private var pump:aPump = new aPump();
		private var damageMeter:M5DamageMeter=new M5DamageMeter();
		private var waterMeter:M5WaterMeter=new M5WaterMeter();
		public static var hose:aHose = new aHose();
		private var house:aBurningHouse = new aBurningHouse();
		public static var houseDamage:int = 1;
		public static var pumpPressure:int = 1;
		private var clock:aClock=new aClock();
		private var timeLeft:int;
		
		
		public function M5Hose()
		{
			//should be 55000, to be a minute. 6875 for 7.5secs left
			timeLeft=55000;
			pumpPressure=1;
			houseDamage=1;
			pump.x = 700;
			pump.y = 500;
			clock.x=700;
			clock.y=20;
			damageMeter.x=20;
			damageMeter.y=550;
			
			waterMeter.x=660;
			waterMeter.y=450;
			
			hose.x = 430;
			hose.y = 510;
			
			house.x = 50;
			house.y = 5;
			house.gotoAndStop(houseDamage);
			damageMeter.gotoAndStop(houseDamage);
			waterMeter.gotoAndStop(pumpPressure);
			
			pump.addEventListener(MouseEvent.MOUSE_DOWN, pumpClick);
			
			addChildAt(house,0);
			addChild(pump);
			addChild(hose);
			addChild(waterMeter);
			addChild(damageMeter);
			addChild(clock);

			
			addEventListener(Event.ENTER_FRAME, update);
			
		}
		public function update(e:Event)
		{
			
			if(mouseX > 150 && mouseX < 650){
				hose.x = mouseX;
			}
			
			house.gotoAndStop(houseDamage);
			damageMeter.gotoAndStop(houseDamage);
			waterMeter.gotoAndStop(pumpPressure);
			
			if(timeLeft==27490)
			{
				clock.gotoAndStop(5);
			}
			else if(timeLeft==20620)
			{
				clock.gotoAndStop(6);
			}
			else if(timeLeft==6850)
			{
				clock.gotoAndStop(8);
			}
			else if(timeLeft<=0)
			{
				clock.gotoAndStop(9);
			}
			else if(timeLeft==48100)
			{
				clock.gotoAndStop(2);
			}
			else if(timeLeft==13750)
			{
				clock.gotoAndStop(7);
			}
			else if(timeLeft==41260)
			{
				clock.gotoAndStop(3);
			}
			else if(timeLeft==34360)
			{
				clock.gotoAndStop(4);
			}
			
			timeLeft-=30;
			checkWin();
			checkLose();
		}
		public function pumpClick(e:MouseEvent):void
		{
			
			pumpPressure ++;
			if(pump.currentFrame==2)
			pump.gotoAndStop(1);
			else if(pump.currentFrame==1)
			pump.gotoAndStop(2);
		}
		public function checkLose()
		{
			if (houseDamage>=7 && lifeWithoutTaxes.gameEnd4 == false)
			{
				lifeWithoutTaxes.gameEnd4=true;
				if(lifeWithoutTaxes.fireNum>=1)
				{
				for(var k:int=lifeWithoutTaxes.fireArray.length-1;k>=0;k--)
				{
					lifeWithoutTaxes.fireArray[k].removeFire();
				}
				}
				lifeWithoutTaxes.fireArray = new Array();
				MovieClip(root).gotoAndStop("MiniGame_5_Lose");
				MovieClip(root).frameCheck();
				this.removeCharacter();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				
				
			}
		}
		public function checkWin()
		{
			if (timeLeft<=0 && lifeWithoutTaxes.gameEnd4 == false)
			{
				lifeWithoutTaxes.gameEnd4=true;
				if(lifeWithoutTaxes.fireNum>=1)
				{
				for(var k:int=lifeWithoutTaxes.fireArray.length-1;k>=0;k--)
				{
					//trace(lifeWithoutTaxes.fireArray.length);
					//trace(lifeWithoutTaxes.fireNum);
					lifeWithoutTaxes.fireArray[k].removeFire();
				}
				}
				lifeWithoutTaxes.fireArray = new Array();
				MovieClip(root).gotoAndStop("MiniGame_5_Win");
				MovieClip(root).frameCheck();
				this.removeCharacter();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				
				
			}
		}
		public function removeCharacter()
		{
			pump.removeEventListener(MouseEvent.MOUSE_DOWN, pumpClick);
			pump.parent.removeChild(pump);
			hose.parent.removeChild(hose);
			house.parent.removeChild(house);
			waterMeter.parent.removeChild(waterMeter);
			damageMeter.parent.removeChild(damageMeter);
			clock.parent.removeChild(clock);
			removeEventListener(Event.ENTER_FRAME, update);
			parent.removeChild(this);
		}
	}
	
}