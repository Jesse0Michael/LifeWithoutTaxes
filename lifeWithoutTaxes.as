package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.system.*;
	import flash.media.*;
	import flash.utils.*;
	
	public class lifeWithoutTaxes extends MovieClip
	{
		public static var objFactory:ObjectFactory = new ObjectFactory();
		public static var buttonArray:Array = new Array();
		public static var buttonArray2:Array = new Array();
		public static var obstacleArray:Array = new Array();
		public static var groceryArray:Array = new Array();
		public static var timerArray:Array = new Array();
		public static var swerveArray:Array = new Array();
		public static var carArray:Array = new Array();
		public static var badGuyArray:Array = new Array();
		public static var fireArray:Array = new Array();
		public static var gameEnd:Boolean= false;
		public static var gameEnd2:Boolean= false;
		public static var gameEnd3:Boolean= false;
		public static var gameEnd4:Boolean= false;
		public static var fireNum:int = 0;
		public static var bGuyCount:int = 0;
		public var sound1:Sound = new Sound(new URLRequest("Sound Assets/Exciting Trailer.mp3"));
		public var sound2:Sound = new Sound(new URLRequest("Sound Assets/Frost Waltz.mp3"));
		public var sound3:Sound = new Sound(new URLRequest("Sound Assets/Kick Shock.mp3"));
		public var sound4:Sound = new Sound(new URLRequest("Sound Assets/Militaire Electronic.mp3"));
		public var sound5:Sound = new Sound(new URLRequest("Sound Assets/Sock Hop.mp3"));
		public var sound6:Sound = new Sound(new URLRequest("Sound Assets/Scheming Weasel faster.mp3"));
		private var channel:SoundChannel = new SoundChannel();


		
		public function lifeWithoutTaxes()
		{
			stop();
			frameCheck();
		}
		public function frameCheck():void 
		{
			switch(currentLabel)
			{
				case "Main Menu" :
					objFactory.createMainMenu();
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "Intro" :
					objFactory.createInfoScreen();
					addChild(objFactory);
					break;
					
				case "Credits" :
					objFactory.createCredits();
					addChild(objFactory);
					channel.stop();
					channel = sound6.play();
					break;
				
				case "MiniGame_2_Intro" :
					objFactory.createMG2Intro("Intro");
					addChild(objFactory);
					break;
					
				case "MiniGame_2" :
					objFactory.createMG2();
					addChild(objFactory);
					channel.stop();
					channel = sound4.play();
					break;
					
				case "MiniGame_2_Lose" :
					objFactory.createMG2Intro("Lose");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_2_Win" :
					objFactory.createMG2Intro("Win");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_3_Intro" :
					objFactory.createMG3Intro("Intro");
					addChild(objFactory);
					
					break;
					
				case "MiniGame_3" :
					objFactory.createMG3();
					addChild(objFactory);
					channel.stop();
					channel = sound5.play();
					break;
					
				case "MiniGame_3_Lose" :
					objFactory.createMG3Intro("Lose");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_3_Win" :
					objFactory.createMG3Intro("Win");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_4_Intro" :
					objFactory.createMG4Intro("Intro");
					addChild(objFactory);
					break;
					
				case "MiniGame_4" :
					objFactory.createMG4();
					addChild(objFactory);
					channel.stop();
					channel = sound3.play();
					break;
					
				case "MiniGame_4_Lose" :
					objFactory.createMG4Intro("Lose");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_4_Win" :
					objFactory.createMG4Intro("Win");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_5_Intro" :
					objFactory.createMG5Intro("Intro");
					addChild(objFactory);
					break;
					
				case "MiniGame_5" :
					objFactory.createMG5();
					addChild(objFactory);
					channel.stop();
					channel = sound1.play();
					break;
					
				case "MiniGame_5_Lose" :
					objFactory.createMG5Intro("Lose");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
					
				case "MiniGame_5_Win" :
					objFactory.createMG5Intro("Win");
					addChild(objFactory);
					channel.stop();
					channel = sound2.play();
					break;
			}
		}
	}
}