package
{
	import flash.events.*;
	import flash.display.*;
	
	public class M3BaddieSpawner extends MovieClip 
	{
		//private var z:int;
		private var badGuy:aBadGuy = new aBadGuy();
		
		
		
		public function M3BaddieSpawner()
		{
			
			badGuy.x=820;
			badGuy.y= Math.random()*60 +30;
			badGuy.addEventListener(MouseEvent.CLICK, clicked);
			badGuy.addEventListener(Event.ENTER_FRAME, update);
			
			addChild(badGuy);

		}
		public function update(e:Event)
		{
			badGuy.x-=4;
			
			if(badGuy.x <40)
			{
				M3Scanner.cashMeterValue -= 1;
				lifeWithoutTaxes.bGuyCount ++;
				removeBadGuy();
			}
		}
		public function clicked(e:Event)
		{
			removeBadGuy();
			lifeWithoutTaxes.bGuyCount =0;
			
		}
		public function removeBadGuy()
		{
				badGuy.removeEventListener(Event.ENTER_FRAME, update);
				lifeWithoutTaxes.badGuyArray.splice(lifeWithoutTaxes.badGuyArray.indexOf(this),1);
				parent.removeChild(this);
				this.removeChild(badGuy);
			
		}
		
	}
}