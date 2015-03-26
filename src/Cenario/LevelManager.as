package Cenario 
{
	import Commons.EventStore;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author @NbStudio
	 */
	public class LevelManager extends MovieClip 
	{
		private var _block:MovieClip
		private var _levelArray:Array
		
		private var _velocidade:Number;
		
		public function LevelManager() 
		{
			super();
			_levelArray = new Array()
			
			createBlock()
			_velocidade = 15
			EventStore.instance.addEvent(this, Event.ENTER_FRAME, atualizar);
		}
		
		private function atualizar(e:Event):void 
		{
			this.x -= _velocidade
			var tempPoint:Point = levelArray[levelArray.length-1].localToGlobal(new Point(0,0));
			if (tempPoint.x < stage.stageWidth) 
			{
				createBlock()
			}
		}
		
		/**
		 * Cria um conjuto de blocos aleatórios - de 5 a 12 com espaçamento de 0 a 5 
		 */
		public function createBlock():void 
		{
			var numBlocks:int = 5 +  Math.round(Math.random() * 7);
			var blackSpace:int = Math.round(Math.random() * 5);
			
			var inicialPosition:Number = _levelArray[levelArray.length-1] ? _levelArray[levelArray.length-1].x +_levelArray[levelArray.length-1].width :0

			var posY:Number = Math.random() * -100;
			
			for (var i:int = 0; i < numBlocks; i++) 
			{
				_block = new Blocks();
				_block.x = inicialPosition + (blackSpace * _block.width) + (i * _block.width)
				_block.y = posY;
				this.addChild(_block)
				_levelArray.push(_block);
			}
		}
		
		public function get levelArray():Array 
		{
			return _levelArray;
		}
		
	}

}