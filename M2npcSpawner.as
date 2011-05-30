package
{
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;
	
	public class M2npcSpawner extends MovieClip 
	{
		var oCar:M2npcCar = new M2npcCar();
		private var carDirection:int;
		private var carSpeed:int;
		private var chance:int;
		private var o:int;
		private var u:int;
		private var g:int;
		private var turnTimer:Timer;
		
		public function M2npcSpawner()
		{
			g=Math.random()*2+5;
			u=3;
			oCar.y = -60;
			o = Math.random()*3 ;
		    chance=Math.random()*100;
			var q:int = Math.random()*3 + 1;
			oCar.gotoAndStop(q);
			
			if(o == 0)
			{
				oCar.x = 230
				oCar.rotation = 180;
				carSpeed = 7;
			}else if(o == 1)
			{
				oCar.x = 330
				oCar.rotation = 180;
				carSpeed = 7;
			}else if(o == 2)
			{
				oCar.x = 450
				carSpeed = -5;
			}else if(o == 3)
			{
				oCar.x = 580
				carSpeed = -5;
			}
			
			
		
			turnTimer = new Timer(500);
			turnTimer.addEventListener(TimerEvent.TIMER, swerve);
			turnTimer.start();
		
			lifeWithoutTaxes.swerveArray.push(turnTimer);
			
			oCar.addEventListener(Event.ENTER_FRAME, update);
			
			addChild(oCar);
			
		}
		public function update(e:Event)
		{
			if(u==0&&oCar.x>=200&&oCar.x<=600&&((o==0)||(o==1)))
			{
				oCar.x+=g;
			}
			else if(u==1&&oCar.x<=600&&oCar.x>=200&&((o==0)||(o==1)))
			{
				oCar.x-=g;
			}
			else if(u==0&&oCar.x<=590&&((o==2)||(o==3)))
			{
				oCar.x+=g;
			}
			else if(u==1&&oCar.x>=180&&((o==2)||(o==3)))
			{
				oCar.x-=g;
			}
			
			oCar.y += 10 + carSpeed;
			
			for(var i:int = lifeWithoutTaxes.carArray.length - 1; i>=0 ; --i)
			{
				if(lifeWithoutTaxes.carArray[i].y > 610)
				{
					lifeWithoutTaxes.carArray[i].removeCar();
				}
			}
			
		}
		public function removeCar()
		{
			oCar.removeEventListener(Event.ENTER_FRAME, update);
			lifeWithoutTaxes.carArray.splice(lifeWithoutTaxes.carArray.indexOf(this),1);
			
			parent.removeChild(this);
			this.removeChild(oCar);
			
		}
		public function swerve(e:TimerEvent)
		{
			g=Math.random()*2+5;
			if(chance>=60)
			u=0;
			else if(chance>=30&&chance<60)
			u=1;
			else if(chance<30)
			u=3;
			chance=Math.random()*100;
		}
	}
}