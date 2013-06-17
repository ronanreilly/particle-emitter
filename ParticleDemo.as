// Ronan Reilly 2012
package {

	import com.bit101.components.*;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ParticleDemo extends Sprite {

		public var emitterX:int;
		public var emitterY:int = 0;
 
		public var _IncSlider:HUISlider;
		// slider for gravity
		public var _gravSlider:HUISlider;
		// slider for scale of particles
		public var _scaleSlider:HUISlider;
		// sliders for velocity of particles
		public var _velXSlider:HUISlider;
		public var _velYSlider:HUISlider;
		
		// variables for panel
		public var _panel:Panel;
		public var _label:Label;
		
		public var _container:Sprite;
		
		public var increment:int = 5;
		// number for scale to be incremented by
		public var scale:Number = 1;
		// number for velocities to be incremented by
		public var velX:Number = 5;
		public var velY:Number = 5;
		// Number for gravity to be incremented by
		public var gravity:Number = .3;
		
		
		// constructor for this class
		public function ParticleDemo() {
			trace("constructor");
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Event.ENTER_FRAME,onLoop, false, 0, true);
			_container = new Sprite();
			addChild(_container);
			swapChildren(_panel, _container);
		}
		
		private function onLoop(evt:Event):void {
			
			
			for (var i:int=0; i< increment; i++) {
				//emitterX = Math.ceil(Math.random()* stage.stageWidth);
				var p:Particle = new Particle(emitterX,
											  emitterY,
											  velX,
											  velY,
											  gravity,
											  Math.random()*0xFFFFFF,
											  scale);
				_container.addChild(p);
			}
			_label.text = "Particles: " + _container.numChildren;
		}
		
		
		//displays the Control Panel using MinimalComponents by Keith Peters
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
 			trace("EL");
			
			trace( "Control Panel" );
            _panel = new Panel(this, 215, 180);
			_panel.setSize(369, 180);
			_label = new  Label(_panel, 60, 0, "Particles: ");
            
			_FPSMeter = new FPSMeter(_panel, 5,0); 
			
			_IncSlider = new HUISlider (_panel, 5, 25, 'Inc. particles', onUpdateValue);
			_IncSlider.minimum = 1;
			_IncSlider.maximum = 10;
			_IncSlider.value = 5;
			_IncSlider.tick = 1;
			
			_scaleSlider = new HUISlider (_panel, 195, 25, 'Scale', onUpdateValue);
			_scaleSlider.minimum = 1;
			_scaleSlider.maximum = 10;
			_scaleSlider.value = scale;
			_scaleSlider.tick = 1;
			
			_velXSlider = new HUISlider (_panel, 5, 45, 'velocity X', onUpdateValue);
			_velXSlider.minimum = 1;
			_velXSlider.maximum = 10;
			_velXSlider.value = 5;
			_velXSlider.tick = 1;
			
			_velYSlider = new HUISlider (_panel, 195, 45, 'velocity Y', onUpdateValue);
			_velYSlider.minimum = 1;
			_velYSlider.maximum = 10;
			_velYSlider.value = 5;
			_velYSlider.tick = 1;
			
			_gravSlider = new HUISlider (_panel, 95, 65, 'gravity', onUpdateValue);
			_gravSlider.minimum = .1;
			_gravSlider.maximum = 1;
			_gravSlider.value = .5;
			_gravSlider.tick = .1;
			
			_emitterYKnob = new Knob(_panel, 193, 90, 'emmiterY', onUpdateValue);
			_emitterYKnob.minimum = 0;
			_emitterYKnob.maximum = stage.stageHeight;
			_emitterYKnob.value = 5;
			
			_emitterXKnob = new Knob(_panel, 143, 90, 'emmiterX', onUpdateValue);
			_emitterXKnob.minimum = 0;
			_emitterXKnob.maximum = stage.stageWidth;
			_emitterXKnob.value = 5;
			
		}
		
		private function onUpdateValue(e:Event):void
		{
			increment = _IncSlider.value;
			scale = _scaleSlider.value;
			velX = _velXSlider.value;
			velY = _velYSlider.value;
			gravity = _gravSlider.value;
			emitterX = _emitterXKnob.value;
			trace (emitterX);
			emitterY = _emitterYKnob.value;
			trace (emitterY);
		}
		
	}
}