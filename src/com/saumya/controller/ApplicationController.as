package com.saumya.controller
{
	import flash.display.Graphics;
	import flash.events.TouchEvent;

	public class ApplicationController
	{
		
		private var appView:ASlate;
		private var board:Graphics;
		
		public function ApplicationController(view:ASlate)
		{
			this.appView=view;
			this.init();
		}
		
		private function init():void
		{
			this.board=this.appView.graphics;
			this.appView.slate.addEventListener(TouchEvent.TOUCH_BEGIN,onTouchStart);
			//this.appView.slate.addEventListener(TouchEvent.TOUCH_END,onTouchEnd);
			this.appView.slate.addEventListener(TouchEvent.TOUCH_MOVE,onTouchMove);
		}
		
		
		private function onTouchStart(e:TouchEvent):void
		{
			/*
			var g:Graphics=this.appView.slate.graphics;
			g.lineStyle(1,0xFF0000);
			g.beginFill(0x00FF00);
			g.drawCircle(e.localX,e.localY,5);
			*/
			this.board.moveTo(e.localX,e.localY);
		}
		
		private function onTouchEnd(e:TouchEvent):void
		{
			var g:Graphics=this.appView.slate.graphics;
			g.lineStyle(1,0xFF0000);
			g.beginFill(0x00FF00);
			g.drawCircle(e.localX,e.localY,5);
		}
		
		
		private function onTouchMove(e:TouchEvent):void
		{
			this.board.lineStyle(1,0xFFFFFF);
			this.board.beginFill(0x00FF00);
			//g.drawCircle(e.localX,e.localY,5);
			
			this.board.lineTo(e.localX,e.localY);
			this.board.moveTo(e.localX,e.localY);
		}
		
		
	}
}