package
{
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;
	
	public class M3Scanner extends MovieClip 
	{
		public static var gBag:aGroceryBag = new aGroceryBag();
		public static var gCan:aGarbageCan = new aGarbageCan();
		public static var shelf:aShelf=new aShelf();
		public static var shelf2:aShelf=new aShelf();
		public static var shelf3:aShelf=new aShelf();
		public static var cashMeter:M3CashMeter;
		public static var cashMeterValue:int =6;
		private var remind:aReminder = new aReminder();
		private var remindTimer:Timer;
		
		public function M3Scanner()
		{
			cashMeterValue=6;
					//should be 6
			lifeWithoutTaxes.bGuyCount =0;
			cashMeter = new M3CashMeter();
			gBag.x = 260;
			gBag.y = 500;
			gCan.x = 630;
			gCan.y = 510;
			shelf.x=80;
			shelf.y=50;
			shelf2.x=335;
			shelf2.y=50;
			shelf3.x=590;
			shelf3.y=50;
			this.addChild(gCan);
			this.addChild(gBag);
			this.addChild(shelf);
			this.addChild(shelf2);
			this.addChild(shelf3);
			
			cashMeter.x = 55;
			cashMeter.y = 75;
			cashMeter.gotoAndStop(cashMeterValue);
			
			cashMeter.addEventListener(Event.ENTER_FRAME, update);
			
			this.addChild(cashMeter);	
		}
		public function update(e:Event)
		{
			
			cashMeter.gotoAndStop(cashMeterValue);
			checkWin();
			checkLose();
			if(lifeWithoutTaxes.bGuyCount >= 2)
			{
				remind.x = 325;
				remind.y = 325;
				addChild(remind);
				remindTimer = new Timer(1000/90,1);
				remindTimer.addEventListener(TimerEvent.TIMER, deleteIt);
				remindTimer.start();
				
			}
		}
		public function deleteIt(e:TimerEvent)
		{
			remind.parent.removeChild(remind);
			remindTimer.removeEventListener(TimerEvent.TIMER, deleteIt);
		}
		public function checkLose()
		{
			if (cashMeterValue==1 && lifeWithoutTaxes.gameEnd2 == false)
			{
				lifeWithoutTaxes.gameEnd2=true;
				for(var k:int=lifeWithoutTaxes.groceryArray.length-1;k>=0;k--)
				{
					lifeWithoutTaxes.groceryArray[k].removeGrocery();
				}
				lifeWithoutTaxes.groceryArray = new Array();
				for(var m:int=lifeWithoutTaxes.badGuyArray.length-1;m>=0;m--)
				{
					lifeWithoutTaxes.badGuyArray[m].removeBadGuy();
				}
				lifeWithoutTaxes.badGuyArray = new Array();
				MovieClip(root).gotoAndStop("MiniGame_3_Lose");
				MovieClip(root).frameCheck();
				this.removeCharacter();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				
			}
		}
		public function checkWin()
		{
			if (cashMeterValue==26 && lifeWithoutTaxes.gameEnd2 == false)
			{
				lifeWithoutTaxes.gameEnd2=true;
				for(var k:int=lifeWithoutTaxes.groceryArray.length-1;k>=0;k--)
				{
					lifeWithoutTaxes.groceryArray[k].removeGrocery();
				}
				lifeWithoutTaxes.groceryArray = new Array();
				for(var m:int=lifeWithoutTaxes.badGuyArray.length-1;m>=0;m--)
				{
					lifeWithoutTaxes.badGuyArray[m].removeBadGuy();
				}
				lifeWithoutTaxes.badGuyArray = new Array();
				MovieClip(root).gotoAndStop("MiniGame_3_Win");
				MovieClip(root).frameCheck();
				this.removeCharacter();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				(lifeWithoutTaxes.timerArray.pop() as Timer).stop();
				
			}
		}
		public function removeCharacter()
		{
			cashMeter.removeEventListener(Event.ENTER_FRAME, update);
			cashMeter.parent.removeChild(cashMeter);
			gCan.parent.removeChild(gCan);
			shelf.parent.removeChild(shelf);
			shelf2.parent.removeChild(shelf2);
			shelf3.parent.removeChild(shelf3);
			gBag.parent.removeChild(gBag);
			parent.removeChild(ObjectFactory.aWal);
			parent.removeChild(this);
			
		}
	}
	
}