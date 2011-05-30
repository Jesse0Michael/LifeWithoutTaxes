package
{
	import flash.events.*;
	import flash.display.*;
	
	public class M3GrocerySpawner extends MovieClip 
	{
		private var z:int;
		private var gGro:aGoodGrocery = new aGoodGrocery();
		private var bGro:aBadGrocery = new aBadGrocery();
		private var fly:aFlies = new aFlies();
		private var dragging:Boolean=false;
		
		public function M3GrocerySpawner()
		{
			//grocery y = 380;
			z=Math.floor(Math.random()*2.99) + 1;
			//trace(z);
			if(z==2||z==1)
			{
				
				var c:int=Math.random()*12+2;
				gGro.gotoAndStop(c);
				gGro.x=850;
				gGro.y=435;
				gGro.addEventListener(Event.ENTER_FRAME, update);
				gGro.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				gGro.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				this.addChild(gGro);
			}
			else if(z==3)
			{
				
				var v:int=Math.random()*10+1;
				bGro.gotoAndStop(v);
				bGro.x=850;
				bGro.y=435;
				fly.x = 840;
				fly.y = 425;
				bGro.addEventListener(Event.ENTER_FRAME, update);
				bGro.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
				bGro.addEventListener(MouseEvent.MOUSE_UP, dropIt);
				
				this.addChild(bGro);
				this.addChild(fly);
			}
		}
		public function update(e:Event)
		{
			if(z==3) {
				fly.x=bGro.x - 10;
				fly.y = bGro.y-10;
					}
			if(dragging==false)
			{
			if(z==2||z==1) gGro.x-=4;
			if(z==3) {
				bGro.x-=4;
					}
			
			if((z==2||z==1)&&(gGro.x<=125))gGro.y+=10;
			if(z==3&&bGro.x<=125)
			{
				bGro.y+=10;
			}
			}
				
			if((z==2||z==1)&&(gGro.y>610)){
				M3Scanner.cashMeterValue -= 1;
				removeGrocery();
				
			}
			if(z==3&&bGro.y>610)
			{
				M3Scanner.cashMeterValue -= 1;
				removeGrocery();
			}
		}
		public function removeGrocery()
		{
			if(z==2||z==1)
			{
				gGro.removeEventListener(Event.ENTER_FRAME, update);
				lifeWithoutTaxes.groceryArray.splice(lifeWithoutTaxes.groceryArray.indexOf(this),1);
				parent.removeChild(this);
				this.removeChild(gGro);
			}else if(z==3)
			{
				bGro.removeEventListener(Event.ENTER_FRAME, update);
				lifeWithoutTaxes.groceryArray.splice(lifeWithoutTaxes.groceryArray.indexOf(this),1);
				parent.removeChild(this);
				this.removeChild(bGro);
			}
		}
		public function pickUp(event:MouseEvent):void
		{
			dragging=true;
			event.target.startDrag(true);
		}
		public function dropIt(event:MouseEvent):void
		{
			event.target.stopDrag();
			
			
			if(event.target.hitTestObject(M3Scanner.gCan))
			{
				if(z==2||z==1)
				{
					M3Scanner.cashMeterValue -= 1;
				}else if(z==3)
				{
					
				}
					
			}else if(event.target.hitTestObject(M3Scanner.gBag))
			{
				if(z==2||z==1)
				{
					M3Scanner.cashMeterValue += 1;
				}else if(z==3)
				{
					M3Scanner.cashMeterValue -= 1;
				}
			}
			
			
			if( !(event.target.hitTestObject(M3Scanner.gBag))&&!(event.target.hitTestObject(M3Scanner.gCan)))
			{
				M3Scanner.cashMeterValue -= 1;
			}
			removeGrocery();
			
		}
	}
}