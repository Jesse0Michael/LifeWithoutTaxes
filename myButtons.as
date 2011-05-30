package{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.net.*;
	import flash.system.*;
	import flash.media.Sound;
	import flash.utils.*;
	
	public class myButtons extends MovieClip {
	
		private var Identity:String;
		var btn:aButton = new aButton();
		var txtFormat:TextFormat = new TextFormat();
		
		private var sCredit:aSoundCredits = new aSoundCredits();
		private var soundTimer:Timer;
		
		public function myButtons(btnName:String, xLoc:int, yLoc:int, identityInput:String){
			Identity = identityInput;
			
			txtFormat.align = "center";
			
			btn.x = xLoc;
			btn.y = yLoc;
			btn.label.text = btnName;
			btn.label.selectable = false;
			btn.label.setTextFormat(txtFormat);
			btn.addEventListener(MouseEvent.MOUSE_OVER, onEnter);
			btn.addEventListener(MouseEvent.MOUSE_OUT, onExit);
			btn.addEventListener(MouseEvent.CLICK, onClick);
			//lifeWithoutTaxes.buttonArray.push(btn);
			addChild(btn);
		
		}
		public function onEnter(evt:MouseEvent):void {
			//trace("mouse over");
		}
		public function onExit(evt:MouseEvent):void {
			//trace("mouse exit");
		}
		public function onClick(evt:MouseEvent):void {
			//trace("mouse clicked");
			var objFactory:ObjectFactory = new ObjectFactory();
			switch(Identity){
				case "New Game" :
					MovieClip(root).gotoAndStop("Intro");
					MovieClip(root).frameCheck();
					removeALLButtons();
					break;
					
				case "MainMenu" :
					MovieClip(root).gotoAndStop("Main Menu");
					MovieClip(root).frameCheck();
					removeALLButtons2();
					
					break;
					
				case "ContinueIntro" :
					MovieClip(root).gotoAndStop("MiniGame_2_Intro");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "StartMG2" :
					lifeWithoutTaxes.gameEnd=false;
					MovieClip(root).gotoAndStop("MiniGame_2");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "ContinueMG2" :
					MovieClip(root).gotoAndStop("MiniGame_3_Intro");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "StartMG3" :
					lifeWithoutTaxes.gameEnd2=false;
					MovieClip(root).gotoAndStop("MiniGame_3");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "ContinueMG3" :
					MovieClip(root).gotoAndStop("MiniGame_4");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "StartMG4" :
					lifeWithoutTaxes.gameEnd3=false;
					MovieClip(root).gotoAndStop("MiniGame_4");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "ContinueMG4" :
					MovieClip(root).gotoAndStop("MiniGame_5_Intro");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "StartMG5" :
					lifeWithoutTaxes.gameEnd4=false;
					MovieClip(root).gotoAndStop("MiniGame_5");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				case "ContinueMG5" :
					MovieClip(root).gotoAndStop("MiniGame_5_Intro");
					MovieClip(root).frameCheck();
					removeButton();
					break;
					
				/*case "High Score" :
					MovieClip(root).gotoAndStop("High Score");
					MovieClip(root).frameCheck();
					removeALLButtons();
					break;
					*/
				case "Credits" :
					MovieClip(root).gotoAndStop("Credits");
					MovieClip(root).frameCheck();
					removeALLButtons();
					break;
					
				case "Sounds" :
					sCredit.x = 150;
					sCredit.y = 200;
					addChild(sCredit);
					soundTimer = new Timer(5000,1);
					soundTimer.addEventListener(TimerEvent.TIMER, deleteSC);
					soundTimer.start();
					break;
					
				case "Exit":
				fscommand("quit");
				break;
			
			}
		}
		public function deleteSC(e:TimerEvent)
		{
			removeChild(sCredit);
			soundTimer.removeEventListener(TimerEvent.TIMER, deleteSC);
		}
		public function removeALLButtons()
		{
			for(var i:int = lifeWithoutTaxes.buttonArray.length -1; i>=0; --i)
			{
				lifeWithoutTaxes.buttonArray[i].removeButton();
			}
			lifeWithoutTaxes.buttonArray = new Array();
		}
		public function removeALLButtons2()
		{
			for(var i:int = lifeWithoutTaxes.buttonArray2.length -1; i>=0; --i)
			{
				lifeWithoutTaxes.buttonArray2[i].removeButton();
			}
			lifeWithoutTaxes.buttonArray2 = new Array();
		}
		public function removeButton()
		{
			
				this.removeEventListener(MouseEvent.MOUSE_OVER, onEnter);
				this.removeEventListener(MouseEvent.MOUSE_OUT, onExit);
				this.removeEventListener(MouseEvent.CLICK, onClick);
				parent.removeChild(this);
				this.removeChild(btn);
		}
		
	}
}