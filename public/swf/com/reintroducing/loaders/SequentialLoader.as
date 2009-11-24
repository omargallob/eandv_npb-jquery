package com.reintroducing.loaders{	import com.reintroducing.events.SequentialLoaderEvent;		import flash.display.Loader;	import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IOErrorEvent;	import flash.events.ProgressEvent;	import flash.net.URLRequest;	import flash.system.LoaderContext;		/**	 * The SequentialLoader loads a series of SWFs and/or images in an ordered sequence.  This is a conversion of the AS2 SequentialLoader class	 * originally written by Tom Stanley [http://www.staticmethods.com] with some additional methods added for more control.	 * 	 * <p>The class dispatches a custom SequentialLoaderEvent depending on what happens.  The events are as follows:</p>	 * 	 * <ul>	 * <li>SequentialLoaderEvent.ON_ITEM_START: Dispatched when an item starts to load (params object contains index)</li>	 * <li>SequentialLoaderEvent.ON_ITEM_PROGRESS: Dispatched while an item is loading (params object contains index, percent loaded, bytesLoaded, bytesTotal)</li>	 * <li>SequentialLoaderEvent.ON_ITEM_INIT: Dispatched when an item is loaded (params object contains index, asset)</li>	 * <li>SequentialLoaderEvent.ON_ITEM_SKIPPED: Dispatched when an item fails to load (params object contains index)</li>	 * <li>SequentialLoaderEvent.ON_SEQUENCE_COMPLETE: Dispatched when every item in the sequence has finished loading</li>	 * </ul>	 * 	 * @author Matt Przybylski [http://www.reintroducing.com]	 * @version 1.1	 */	public class SequentialLoader extends EventDispatcher	{//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------		private var _assets:Array;		private var _pauseAfterEachLoad:Boolean;		private var _isPaused:Boolean;		private var _totalLoads:int;		private var _loader:Loader;		private var _currentIndex:int;		private var _currentAsset:String;		private var _loaderContext:LoaderContext;		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------				public static const DEFAULT_NAME:String = "com.reintroducing.loaders.SequentialLoader";		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------			/**		 * Creates a new instance of the SequentialLoader class and passes in the assets to load.  You can set the optional pauseAfterEachLoad boolean which allows you to		 * pause after each item is loaded to do another action and then resume the SequentialLoader using the resume() method.		 * 		 * @param $assets An array that holds the paths to the SWFs/images to be loaded		 * @param $pauseAfterEachLoad An optional boolean that allows you to pause the SequentialLoader after each item is loaded (default: false)		 * @param $checkPolicyFile An optional boolean that checks to see if a policy file should be loaded or not on the first load (default: false)		 * 		 * @return void		 */		public function SequentialLoader($assets:Array, $pauseAfterEachLoad:Boolean = false, $checkPolicyFile:Boolean = false):void		{			this._assets = new Array();						this._assets = $assets;			this._pauseAfterEachLoad = $pauseAfterEachLoad;			this._totalLoads = this._assets.length;			this._loaderContext = new LoaderContext($checkPolicyFile);		}//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------				private function loadItem($index:int):void		{			this._currentIndex = $index;			this._currentAsset = this._assets[this._currentIndex];						var l:Loader = new Loader();			l.contentLoaderInfo.addEventListener(Event.INIT, doLoadInit);			l.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, doProgress);			l.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, doError);						(this._currentIndex == 0) ? l.load(new URLRequest(this._currentAsset), this._loaderContext) : l.load(new URLRequest(this._currentAsset));						this._loader = l;						var evt:SequentialLoaderEvent = new SequentialLoaderEvent(SequentialLoaderEvent.ON_ITEM_START, {index: this._currentIndex});			this.dispatchEvent(evt);		}				private function completeSequence():void		{			var evt:SequentialLoaderEvent = new SequentialLoaderEvent(SequentialLoaderEvent.ON_SEQUENCE_COMPLETE, {});			this.dispatchEvent(evt);		}				private function killEvents():void		{			this._loader.contentLoaderInfo.removeEventListener(Event.INIT, doLoadInit);			this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, doProgress);			this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, doError);			this._loader = null;		}		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------			/**		 * Starts the loading of the specified assets.		 * 		 * @return void		 */		public function start():void		{			this.loadItem(0);		}				/**		 * Pauses the SequentialLoader at its current loading position.		 * 		 * @return void		 */		public function pause():void		{			this._isPaused = true;		}				/**		 * Resume the SequentialLoader and load the next asset in the loading sequence.		 * 		 * @return void		 */		public function resume():void		{			this._isPaused = false;			this._currentIndex++;			this.loadItem(this._currentIndex);		}				/**		 * Cleans up the listeners used by the current Loader.		 * 		 * @return void		 */		public function destroy():void		{			this.killEvents();		}//- EVENT HANDLERS ----------------------------------------------------------------------------------------			private function doProgress($evt:ProgressEvent):void		{			var percent:Number = Math.ceil(($evt.bytesLoaded / $evt.bytesTotal) * 100);						var params:Object = new Object();			params.index = this._currentIndex;			params.percent = percent;			params.bytesLoaded = $evt.bytesLoaded;			params.bytesTotal = $evt.bytesTotal;						var evt:SequentialLoaderEvent = new SequentialLoaderEvent(SequentialLoaderEvent.ON_ITEM_PROGRESS, params);			this.dispatchEvent(evt);		}				private function doLoadInit($evt:Event):void		{			var params:Object = new Object();			params.index = this._currentIndex;			params.asset = $evt.target.loader;						var evt:SequentialLoaderEvent = new SequentialLoaderEvent(SequentialLoaderEvent.ON_ITEM_INIT, params);			this.dispatchEvent(evt);						this.killEvents();						if (this._currentIndex < (this._totalLoads - 1))			{				if (this._isPaused)				{					return;				}				else if (this._pauseAfterEachLoad != true)				{					this._currentIndex++;					this.loadItem(this._currentIndex);				}			} 			else			{				this.completeSequence();			}		}				private function doError($evt:IOErrorEvent):void		{			var params:Object = new Object();			params.index = this._currentIndex;						var evt:SequentialLoaderEvent = new SequentialLoaderEvent(SequentialLoaderEvent.ON_ITEM_SKIPPED, params);			this.dispatchEvent(evt);						this.killEvents();						if (this._currentIndex < this._totalLoads - 1)			{				if (this._isPaused)				{					return;				}				else if (this._pauseAfterEachLoad != true)				{					this._currentIndex++;					this.loadItem(this._currentIndex);				}			} 			else			{				this.completeSequence();			}		}	//- GETTERS & SETTERS -------------------------------------------------------------------------------------			/**		 * Returns the value of isPaused.		 * 		 * @return Boolean		 */		public function get isPaused():Boolean		{			return this._isPaused;		}				/**		 * Sets the value of isPaused.		 * 		 * @return void		 */		public function set isPaused($val:Boolean):void		{			this._isPaused = $val;		}				/**		 * Returns the value of pauseAfterEachLoad.		 * 		 * @return Boolean		 */		public function get pauseAfterEachLoad():Boolean		{			return this._pauseAfterEachLoad;		}		/**		 * Sets the value of pauseAfterEachLoad.		 * 		 * @return void		 */		public function set pauseAfterEachLoad($val:Boolean):void		{			this._pauseAfterEachLoad = $val;		}//- HELPERS -----------------------------------------------------------------------------------------------			public override function toString():String		{			return "com.reintroducing.loaders.SequentialLoader";		}	//- END CLASS ---------------------------------------------------------------------------------------------	}}