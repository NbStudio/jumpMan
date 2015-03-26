package Commons
{
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author @NbStudio
	 */
	public class EventStore 
	{
		private static var _instance:EventStore
		
		public function EventStore()
		{
		
		}
		
		/**
		 * Adiciona um evento ao objeto, e altera o tipo de evento dependendo do dispositivo.
		 * @param	object
		 * @param	$event
		 * @param	$callback
		 */
		public function addEvent(object:Object, $event:String, $callback:Function):void
		{
			if (isMobile())
			{
				throw new Error("Mobile events não Implementado");
				return
			}
			
			object.addEventListener($event, $callback);
			
		}

		private function isMobile():Boolean
		{
			return (Capabilities.version.substr(0, 3) != "WIN");
		}
		
		public static function get instance():EventStore
		{
			if (!_instance)
			{
				_instance = new EventStore();
			}
			
			return _instance;
		}
	
	}

}