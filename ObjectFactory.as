package
{
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;

public class ObjectFactory extends MovieClip 
{
	public static var aWal:aWall;
	public static var guy:aBagGuy;
	
	public function ObjectFactory()
	{
		
		
	}
	public function createStartScreen()
	{
		
	}
	public function createMainMenu()
	{
		//var highScoreButton:myButtons = new myButtons("High Score", 100, 470, "High Score");
		var newGameButton:myButtons = new myButtons("New Game", 30, 310, "New Game");
		var creditsButton:myButtons = new myButtons("Credits", 320, 520, "Credits");
		var exitButton:myButtons = new myButtons("Exit", 630, 310, "Exit");
		
		//lifeWithoutTaxes.buttonArray.push(highScoreButton);
		lifeWithoutTaxes.buttonArray.push(newGameButton);
		lifeWithoutTaxes.buttonArray.push(creditsButton);
		lifeWithoutTaxes.buttonArray.push(exitButton);
		
		//addChild(highScoreButton);
		addChild(newGameButton);
		addChild(creditsButton);
		addChild(exitButton);
	}
	public function createHighScoreTable()
	{
	}
	public function createChooseCharacter()
	{
		
	}
	public function createInfoScreen()
	{
		var intro:myButtons = new myButtons("Continue", 650, 520, "ContinueIntro");
		addChild(intro);
	}
  	public function createMG1()
	{
		
	}
	public function createMG2Intro(Input:String)
	{
		switch(Input){
				case "Intro" :
					var MG2begin:myButtons = new myButtons("Start", 330, 100, "StartMG2");
					addChild(MG2begin);
					break;
				case "Lose" :
					var MG2Retry:myButtons = new myButtons("Retry", 330, 100, "StartMG2");
					//need to set score to zero so they dont keep losing and racking up high schore.
					addChild(MG2Retry);
					break;
				case "Win" :
					var MG2Continue:myButtons = new myButtons("Continue", 330, 100, "ContinueMG2");
					addChild(MG2Continue);
					break;
		}
		
	}
	public function createMG2()
	{
		var Driving:M2Character = new M2Character();
		
		addChild(Driving);
		if(lifeWithoutTaxes.gameEnd==false)
		{
		createMG2ObstacleTimer();
		createMG2CarTimer();
		}
	}
	public function createMG2ObstacleTimer()
	{
		if(lifeWithoutTaxes.gameEnd==false)
		{
		var obstacleTimer:Timer;
		
		var r:int = Math.random()*2000 + 500;
		obstacleTimer = new Timer(r);
		obstacleTimer.addEventListener(TimerEvent.TIMER, createMG2Obstacle);
		obstacleTimer.start();
		
		lifeWithoutTaxes.timerArray.push(obstacleTimer);
		}
	}
	public function createMG2CarTimer()
	{	
		if(lifeWithoutTaxes.gameEnd==false)
		{
		var carTimer:Timer;
		
		var p:int = Math.random()*3000 + 1000;
		carTimer = new Timer(p);
		carTimer.addEventListener(TimerEvent.TIMER, createMG2CarObstacle);
		carTimer.start();
		
		lifeWithoutTaxes.timerArray.push(carTimer);
		
		}
	}
	public function createMG2Obstacle(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd==false)
		{
		var obSpawner:M2ObstacleSpawner = new M2ObstacleSpawner();
		lifeWithoutTaxes.obstacleArray.push(obSpawner);
		addChild(obSpawner);
		e.target.delay = Math.random()*2000 + 500;
		}
	}
	public function createMG2CarObstacle(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd==false)
		{
		var carSpawner:M2npcSpawner = new M2npcSpawner();
		lifeWithoutTaxes.carArray.push(carSpawner);
		addChild(carSpawner);
		e.target.delay = Math.random()*3000 + 1000;
		}
	}
	public function createMG3Intro(Input:String)
	{
		switch(Input){
				case "Intro" :
					var MG3begin:myButtons = new myButtons("Start", 315, 75, "StartMG3");
					addChild(MG3begin);
					break;
				case "Lose" :
					var MG3Retry:myButtons = new myButtons("Retry", 315, 75, "StartMG3");
					//need to set score to zero so they dont keep losing and racking up high schore.
					addChild(MG3Retry);
					break;
				case "Win" :
					var MG3Continue:myButtons = new myButtons("Continue", 315, 75, "ContinueMG3");
					addChild(MG3Continue);
					break;
		}
	}
	public function createMG3()
	{
		var scanner:M3Scanner = new M3Scanner();
		guy = new aBagGuy();
		aWal = new aWall();
		aWal.x = 0;
		aWal.y = 0;
		guy.x = 400;
		guy.y = 420;
			
		
		addChildAt(aWal,1);
		addChild(scanner);
		if(lifeWithoutTaxes.gameEnd2==false)
		{
		createMG3GroceryTimer();
		createMG3BaddieTimer();
		}
		//addChildAt(guy,1);
	}
	public function createMG3GroceryTimer()
	{
		if(lifeWithoutTaxes.gameEnd2==false)
		{
		var groceryTimer:Timer;
		
		groceryTimer = new Timer(1350);
		groceryTimer.addEventListener(TimerEvent.TIMER, createMG3Grocery);
		groceryTimer.start();
		
		lifeWithoutTaxes.timerArray.push(groceryTimer);
		}
	}
	public function createMG3Grocery(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd2==false)
		{
		var grocerySpawner:M3GrocerySpawner = new M3GrocerySpawner();
		lifeWithoutTaxes.groceryArray.push(grocerySpawner);
		addChild(grocerySpawner);
		}
	}
	public function createMG3BaddieTimer()
	{
		if(lifeWithoutTaxes.gameEnd2==false)
		{
		var badGuyTimer:Timer;
		var t:int=Math.random()*4000+5000;
		
		badGuyTimer = new Timer(t);
		badGuyTimer.addEventListener(TimerEvent.TIMER, createMG3BaddieSpawner);
		badGuyTimer.start();
		
		lifeWithoutTaxes.timerArray.push(badGuyTimer);
		}
	}
	public function createMG3BaddieSpawner(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd2==false)
		{
		var baddieSpawner:M3BaddieSpawner = new M3BaddieSpawner();
		lifeWithoutTaxes.badGuyArray.push(baddieSpawner);
		addChildAt(baddieSpawner, 0);
		e.target.delay = Math.random()*4000+5000;
		}
	}
	public function createMG4Intro(Input:String)
	{
		switch(Input){
				case "Intro" :
					var MG4begin:myButtons = new myButtons("Start", 330, 100, "StartMG4");
					addChild(MG4begin);
					break;
				case "Lose" :
					var MG4Retry:myButtons = new myButtons("Retry", 330, 100, "StartMG4");
					//need to set score to zero so they dont keep losing and racking up high schore.
					addChild(MG4Retry);
					break;
				case "Win" :
					var MG4Continue:myButtons = new myButtons("Continue", 330, 100, "ContinueMG4");
					addChild(MG4Continue);
					break;
		}
		
	}
	public function createMG4()
	{
		var Driving:M4Character = new M4Character();
		
		addChild(Driving);
		if(lifeWithoutTaxes.gameEnd3==false)
		{
		createMG4ObstacleTimer();
		createMG4CarTimer();
		}
	}
	public function createMG4ObstacleTimer()
	{
		if(lifeWithoutTaxes.gameEnd3==false)
		{
		var obstacleTimer:Timer;
		
		var r:int = Math.random()*1000 + 250;
		obstacleTimer = new Timer(r);
		obstacleTimer.addEventListener(TimerEvent.TIMER, createMG4Obstacle);
		obstacleTimer.start();
		
		lifeWithoutTaxes.timerArray.push(obstacleTimer);
		}
	}
	public function createMG4CarTimer()
	{	
		if(lifeWithoutTaxes.gameEnd3==false)
		{
		var carTimer:Timer;
		
		var p:int = Math.random()*1000 + 1000;
		carTimer = new Timer(p);
		carTimer.addEventListener(TimerEvent.TIMER, createMG4CarObstacle);
		carTimer.start();
		
		lifeWithoutTaxes.timerArray.push(carTimer);
		
		}
	}
	public function createMG4Obstacle(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd3==false)
		{
		var obSpawner:M4ObstacleSpawner = new M4ObstacleSpawner();
		lifeWithoutTaxes.obstacleArray.push(obSpawner);
		addChild(obSpawner);
		e.target.delay = Math.random()*1000 + 250;
		}
	}
	public function createMG4CarObstacle(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd3==false)
		{
		var carSpawner:M4npcSpawner = new M4npcSpawner();
		lifeWithoutTaxes.carArray.push(carSpawner);
		addChild(carSpawner);
		e.target.delay = Math.random()*1000 + 1000;
		}
	}
	public function createMG5Intro(Input:String)
	{
		switch(Input){
				case "Intro" :
					var MG5begin:myButtons = new myButtons("Start", 330, 60, "StartMG5");
					addChild(MG5begin);
					break;
				case "Lose" :
					var MG5Retry:myButtons = new myButtons("Retry", 330, 100, "StartMG5");
					addChild(MG5Retry);
					break;
				case "Win" :
					var MG5Continue:myButtons = new myButtons("Credits", 310, 60, "Credits");
					lifeWithoutTaxes.buttonArray.push(MG5Continue);
					addChild(MG5Continue);
					break;
		}
		
	}
	public function createMG5()
	{
		var gameHose:M5Hose = new M5Hose();
		
		if(lifeWithoutTaxes.gameEnd4==false)
		{
		addChild(gameHose);
		createFireTimer();
		}
	}
	public function createFireTimer()
	{
		if(lifeWithoutTaxes.gameEnd4==false)
		{
		var fireTimer:Timer;
		
		var r:int = Math.random()*1000 + 3000;
		fireTimer = new Timer(r);
		fireTimer.addEventListener(TimerEvent.TIMER, createMG5Fire);
		fireTimer.start();
		
		lifeWithoutTaxes.timerArray.push(fireTimer);
		}
	}
	public function createMG5Fire(e:TimerEvent)
	{
		if(lifeWithoutTaxes.gameEnd4==false)
		{
		var gameFire:M5FireSpawner = new M5FireSpawner();
		lifeWithoutTaxes.fireArray.push(gameFire);
		lifeWithoutTaxes.fireNum ++;
		addChild(gameFire);
		e.target.delay = Math.random()*1000 + 3000;
		}
		
	}
	public function createCredits()
	{
		var back:myButtons = new myButtons("Main Menu", 230, 300, "MainMenu");
		addChild(back);
		var sound:myButtons = new myButtons("Sound Credits", 425, 300, "Sounds");
		addChild(sound);
		lifeWithoutTaxes.buttonArray2.push(back);
		lifeWithoutTaxes.buttonArray2.push(sound);
	
	}
	public function createVictoryScreen()
	{
		
	}
}
}