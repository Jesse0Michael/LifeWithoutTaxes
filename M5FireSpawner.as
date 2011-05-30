package
{
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;
	
	public class M5FireSpawner extends MovieClip 
	{
		private var water:aWater = new aWater();
		private var outFire:aOutFire = new aOutFire();
		private var fire:aFire = new aFire();
		private var t:int;
		private var damageHouseTimer:Timer;
		private var deleteTimer:Timer;
		
		public function M5FireSpawner()
		{
			
			t=Math.floor(Math.random()*6.99);
			if(t>=4&&M5Hose.houseDamage>=3)
			t=t-3;
			switch(t){
			case 0:
			fire.x = 170;
			fire.y = 300;
			break;
			case 4:
			fire.x = 300;
			fire.y = 50;
			break;
			case 3:
			fire.x = 450;
			fire.y = 300;
			break;
			case 6:
			fire.x = 90;
			fire.y = 60;
			break;
			case 2:
			fire.x = 350;
			fire.y = 270;
			break;
			case 5:
			fire.x = 80;
			fire.y = 100;
			break;
			case 1:
			fire.x = 90;
			fire.y = 250;
			break;
			}
			
				damageHouseTimer = new Timer(2000);
				damageHouseTimer.addEventListener(TimerEvent.TIMER, damageHouse);
				damageHouseTimer.start();
			
			fire.addEventListener(MouseEvent.MOUSE_DOWN, fireClick);
			addChild(fire);
			
		}
		public function fireClick(event:MouseEvent):void
		{
			if(M5Hose.pumpPressure >=8){
				water.x = M5Hose.hose.x-35;
				water.y = M5Hose.hose.y -175;
				addChild(water);
				water.gotoAndPlay(1);
				M5Hose.pumpPressure = 1;
				outFire.x = fire.x+61;
				outFire.y = fire.y+150;
				addChild(outFire);
				outFire.gotoAndPlay(1);
				damageHouseTimer.removeEventListener(TimerEvent.TIMER, damageHouse);
				fire.removeEventListener(TimerEvent.TIMER, fireClick);
				lifeWithoutTaxes.fireNum --;
				lifeWithoutTaxes.fireArray.splice(lifeWithoutTaxes.fireArray.indexOf(this),1);
				removeChild(fire);
				
				
				deleteTimer = new Timer(667,1);
				deleteTimer.addEventListener(TimerEvent.TIMER, deleteThem);
				deleteTimer.start();
			}
		}
		public function deleteThem(e:TimerEvent)
		{
			removeChild(outFire);
			removeChild(water);
			deleteTimer.removeEventListener(TimerEvent.TIMER, deleteThem);
		}
		public function damageHouse(e:TimerEvent)
		{
			M5Hose.houseDamage++;
		}
		public function removeFire()
		{
			
			damageHouseTimer.removeEventListener(TimerEvent.TIMER, damageHouse);
			fire.removeEventListener(Event.ENTER_FRAME, fireClick);
			lifeWithoutTaxes.fireArray.splice(lifeWithoutTaxes.fireArray.indexOf(this),1);
			fire.parent.removeChild(fire);
			parent.removeChild(this);
		}
	}
	
}