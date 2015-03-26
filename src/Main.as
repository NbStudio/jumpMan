package
{
	import Cenario.LevelManager;
	import Commons.EventStore;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.system.Capabilities;
	import Player.Player;
	
	/**
	 * ...
	 * @author @NbStudio
	 */
	public class Main extends Sprite
	{
		private var _player:Player;
		private var _levelManager:LevelManager
		
		public function Main()
		{
			if (stage)
				init();
			else
				EventStore.instance.addEvent(this, Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			startGame();
		}
		
		private function startGame():void
		{
			drawGame()
			
			EventStore.instance.addEvent(this, Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			colision();
		}

		private function colision():void
		{
			for (var i:int = 0; i < _levelManager.levelArray.length; i++)
			{
				var tempPoint:Point = _levelManager.levelArray[i].localToGlobal(new Point(0, 0));
				var _debug:Number = (_player.y - _player.height/2)
				if (_player.hitTestObject(_levelManager.levelArray[i]) && (_player.y + _player.height/2) > tempPoint.y)
				{					
					_player.y = tempPoint.y - _player.height / 2 ;
					_player.gravidade = 0
					_player.velocidadeY = 0
					_player.podePular = true;
					break;
					
				}				
				else 
				{
					_player.gravidade = 0.5;
					_player.podePular = false;
					
				}
				
			}
		}
		
		private function drawGame():void
		{
			_player = new Player();
			_player.x = 100;
			_player.y = 100;
			this.addChild(_player);
			
			_levelManager = new LevelManager()
			_levelManager.y = 500
			addChild(_levelManager);
		}
	}

}

