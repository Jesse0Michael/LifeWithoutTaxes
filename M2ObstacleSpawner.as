package
{
	import flash.events.*;
	import flash.display.*;
	
	public class M2ObstacleSpawner extends MovieClip 
	{
		
		var obs:aObstacle = new aObstacle();
		
		public function M2ObstacleSpawner()
		{
			obs.y = -40;
			var o:int = Math.random()*5 + 1;
			
			obs.gotoAndStop(o);
			
			var p:int = Math.random()*410 + 170;
			obs.x = p;
			
			obs.addEventListener(Event.ENTER_FRAME, update);
			
			this.addChild(obs);
		}
		public function update(e:Event)
		{
			obs.y += 10;
			
			for(var i:int = lifeWithoutTaxes.obstacleArray.length - 1; i>=0 ; --i)
			{
				if(lifeWithoutTaxes.obstacleArray[i].y > 610)
				{
					lifeWithoutTaxes.obstacleArray[i].obstacleTooFar();
				}
			}
			
		}
		public function removeObstacle()
		{
			obs.removeEventListener(Event.ENTER_FRAME, update);
			lifeWithoutTaxes.obstacleArray.splice(lifeWithoutTaxes.obstacleArray.indexOf(this),1);
			
			parent.removeChild(this);
			this.removeChild(obs);
		}
		public function obstacleTooFar()
		{
			//for(var i:int = lifeWithoutTaxes.obstacleArray.length - 1; i>=0 ; --i)
			//{
				
			obs.removeEventListener(Event.ENTER_FRAME, update);
			lifeWithoutTaxes.obstacleArray.splice(lifeWithoutTaxes.obstacleArray.indexOf(this),1);
			parent.removeChild(this);
			this.removeChild(obs);
			
			//}
		}
	}
}