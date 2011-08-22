package com.saumya.view
{
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import mx.core.UIComponent;

	public class ColorPickerComponent extends UIComponent
	{
		private var color1:UIComponent;
		private var color2:UIComponent;
		private var color3:UIComponent;
		private var color4:UIComponent;
		private var color5:UIComponent;
		private var color6:UIComponent;
		private var color7:UIComponent;
		
		public static const COLOR_PICK_EVENT:String='colorPickedEvent';
		public var activeColor:uint=0;
		
		public function ColorPickerComponent()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			this.color1=this.getColorComponent(0xFF0000);
			this.color2=this.getColorComponent(0x00FF00);
			this.color3=this.getColorComponent(0x0000FF);
			this.color4=this.getColorComponent(0xFFFF00);
			this.color5=this.getColorComponent(0x00FFFF);
			this.color6=this.getColorComponent(0xFF00FF);
			this.color7=this.getColorComponent(0xFFFFFF);
			//
			this.color1.x=0;
			this.color2.x=40;
			this.color3.x=80;
			this.color4.x=120;
			this.color5.x=160;
			this.color6.x=200;
			this.color7.x=240;
			//
			this.addChild(this.color1);
			this.addChild(this.color2);
			this.addChild(this.color3);
			this.addChild(this.color4);
			this.addChild(this.color5);
			this.addChild(this.color6);
			this.addChild(this.color7);
		}
		
		private function getColorComponent(colorValue:uint=0xFF0000):UIComponent
		{
			var u:UIComponent=new UIComponent();
			u.name=String(0xFF0000);
			var g:Graphics=u.graphics;
			g.beginFill(colorValue);
			g.drawCircle(20,20,20);
			g.endFill();
			u.addEventListener(TouchEvent.TOUCH_TAP,onColorSelect);
			return u;
		}
		
		private function onColorSelect(e:TouchEvent):void
		{
			var u:UIComponent=UIComponent(e.target);
			this.activeColor=uint(u.name);
			this.dispatchEvent(new Event(ColorPickerComponent.COLOR_PICK_EVENT));
		}
	}
}