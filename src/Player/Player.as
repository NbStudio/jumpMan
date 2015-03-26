package Player
{
	import Commons.EventStore;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author @NbStudio
	 */
	public class Player extends MovieClip
	{
		private var _gravidade:Number
		
		private var _velocidadeY:Number
		private var _velocidadeX:Number
		
		private var espaco:Boolean;
		private var esps:Boolean;
		
		private var _podePular:Boolean
		private var alturaPulo:Number;
		private var _view:MovieClip

		public function Player()
		{
			super();
			_view = new PlayerAsset();
			this.addChild(_view);
			
			_gravidade = 0.5
			
			esps = true;
			
			velocidadeY = 0
			
			alturaPulo = 13;
			
			_podePular = false
			
			EventStore.instance.addEvent(this, Event.ADDED_TO_STAGE, addStage);
			EventStore.instance.addEvent(this, Event.ENTER_FRAME, atualizar);
		}
		
		public function get view():MovieClip
		{
			return _view;
		}
		
		
		public function addStage(e:Event):void
		{
			EventStore.instance.addEvent(stage, KeyboardEvent.KEY_DOWN, pressionar);
			EventStore.instance.addEvent(stage, KeyboardEvent.KEY_UP, soltar);
		}
		
		public function atualizar(e:Event):void
		{
			velocidadeY += _gravidade
			this.y += velocidadeY
			
			if (espaco && esps)
			{
				//trace(podePular)
				if (_podePular)
				{
					//trace("s")
					this.y -= 2
					_gravidade = 0.5;
					_podePular = false;
					velocidadeY -= alturaPulo;
					//_view.gotoAndStop(2)
					esps = false;
				}
			}else if(!espaco){
				esps = true;
				
			}
			
		}
		public function pressionar(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				espaco = true;
			}
	
		}
		
		public function soltar(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				espaco = false;
			}
		}
		
		public function get podePular():Boolean 
		{
			return _podePular;
		}
		
		public function set podePular(value:Boolean):void 
		{
			_podePular = value;
		}
		
		public function get gravidade():Number 
		{
			return _gravidade;
		}
		
		public function set gravidade(value:Number):void 
		{
			_gravidade = value;
		}
		
		public function get velocidadeX():Number 
		{
			return _velocidadeX;
		}
		
		public function set velocidadeX(value:Number):void 
		{
			_velocidadeX = value;
		}
		
		public function get velocidadeY():Number 
		{
			return _velocidadeY;
		}
		
		public function set velocidadeY(value:Number):void 
		{
			_velocidadeY = value;
		}
		
	
	}

}