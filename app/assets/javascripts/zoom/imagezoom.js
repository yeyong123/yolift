
//http://www.cnblogs.com/cloudgamer/

var ImageZoom = function(image, viewer, options) {
	this._initialize( image, viewer, options );
	this._initLoad();
};

ImageZoom.prototype = {

  _initialize: function(image, viewer, options) {
	this._image = $$(image);
	this._zoom = document.createElement("img");
	this._viewer = $$(viewer);
	this._viewerWidth = 0;
	this._viewerHeight = 0;
	this._preload = new Image();
	this._rect = null;
	this._repairLeft = 0;
	this._repairTop = 0;
	this._rangeWidth = 0;
	this._rangeHeight = 0;
	this._timer = null;
	this._loaded = false;
	this._substitute = false;
	
	var opt = this._setOptions(options);
	
	this._scale = opt.scale;
	this._max = opt.max;
	this._min = opt.min;
	this._originPic = opt.originPic;
	this._zoomPic = opt.zoomPic;
	this._rangeWidth = opt.rangeWidth;
	this._rangeHeight = opt.rangeHeight;
	
	this.delay = opt.delay;
	this.autoHide = opt.autoHide;
	this.mouse = opt.mouse;
	this.rate = opt.rate;
	
	this.onLoad = opt.onLoad;
	this.onStart = opt.onStart;
	this.onMove = opt.onMove;
	this.onEnd = opt.onEnd;
	
	var oThis = this, END = function(){ oThis._end(); };
	this._END = function(){ oThis._timer = setTimeout( END, oThis.delay ); };
	this._START = $$F.bindAsEventListener( this._start, this );
	this._MOVE = $$F.bindAsEventListener( this._move, this );
	this._MOUSE = $$F.bindAsEventListener( this._mouse, this );
	this._OUT = $$F.bindAsEventListener( function(e){
			if ( !e.relatedTarget ) this._END();
		}, this );
	
	$$CE.fireEvent( this, "init" );
  },

  _setOptions: function(options) {
    this.options = {
		scale:		0,
		max:		10,
		min:		1.5,
		originPic:	"",
		zoomPic:	"",
		rangeWidth:	0,
		rangeHeight:0,
		delay:		20,
		autoHide:	true,
		mouse:		false,
		rate:		.2,
		onLoad:		$$.emptyFunction,
		onStart:	$$.emptyFunction,
		onMove:		$$.emptyFunction,
		onEnd:		$$.emptyFunction
    };
    return $$.extend(this.options, options || {});
  },
  
  _initLoad: function() {
	var image = this._image, originPic = this._originPic,
		useOrigin = !this._zoomPic && this._scale,
		loadImage = $$F.bind( useOrigin ? this._loadOriginImage : this._loadImage, this );
	
	this.autoHide && this._hide();
	
	if ( originPic && originPic != image.src ) {
		image.onload = loadImage;
		image.src = originPic;
	} else if ( image.src ) {
		if ( !image.complete ) {
			image.onload = loadImage;
		} else {
			loadImage();
		}
	} else {
		return;
	}
	
	if ( !useOrigin ) {
		var preload = this._preload, zoomPic = this._zoomPic || image.src,
			loadPreload = $$F.bind( this._loadPreload, this );
		if ( zoomPic != preload.src ) {
			preload.onload = loadPreload;
			preload.src = zoomPic;
		} else {
			if ( !preload.complete ) {
				preload.onload = loadPreload;
			} else {
				this._loadPreload();
			}
		}
	}
  },
  
  _loadOriginImage: function() {
	this._image.onload = null;
	this._zoom.src = this._image.src;
	this._initLoaded();
  },
  
  _loadImage: function() {
	this._image.onload = null;
	if ( this._loaded ) {
		this._initLoaded();
	} else {
		this._loaded = true;
		if ( this._scale ) {
			this._substitute = true;
			this._zoom.src = this._image.src;
			this._initLoaded();
		}
	}
  },
 
  _loadPreload: function() {
	this._preload.onload = null;
	this._zoom.src = this._preload.src;
	if ( this._loaded ) {
		
		if ( !this._substitute ) { this._initLoaded(); }
	} else {
		this._loaded = true;
	}
  },
  
  _initLoaded: function(src) {
	
	this._initSize();
	
	this._initViewer();
	
	this._initData();
	
	$$CE.fireEvent( this, "load" );
	this.onLoad();
	this.start();
  },
  
  _initSize: function() {
	var zoom = this._zoom, image = this._image, scale = this._scale;
	if ( !scale ) { scale = this._preload.width / image.width; }
	this._scale = scale = Math.min( Math.max( this._min, scale ), this._max );
	
	zoom.width = Math.ceil( image.width * scale );
	zoom.height = Math.ceil( image.height * scale );
  },
  
  _initViewer: function() {
	var zoom = this._zoom, viewer = this._viewer;
	
	var styles = { padding: 0, overflow: "hidden" }, p = $$D.getStyle( viewer, "position" );
	if ( p != "relative" && p != "absolute" ){ styles.position = "relative"; };
	$$D.setStyle( viewer, styles );
	zoom.style.position = "absolute";
	
	if ( !$$D.contains( viewer, zoom ) ){ viewer.appendChild( zoom ); }
  },
  
  _initData: function() {
	var zoom = this._zoom, image = this._image, viewer = this._viewer,
		scale = this._scale, rangeWidth = this._rangeWidth, rangeHeight = this._rangeHeight;
	
	this._rect = $$D.rect( image );
	
	this._repairLeft = image.clientLeft + parseInt($$D.getStyle( image, "padding-left" ));
	this._repairTop = image.clientTop + parseInt($$D.getStyle( image, "padding-top" ));
	
	if ( rangeWidth > 0 && rangeHeight > 0 ) {
		rangeWidth = Math.ceil( rangeWidth );
		rangeHeight = Math.ceil( rangeHeight );
		this._viewerWidth = Math.ceil( rangeWidth * scale );
		this._viewerHeight = Math.ceil( rangeHeight * scale );
		$$D.setStyle( viewer, {
			width: this._viewerWidth + "px",
			height: this._viewerHeight + "px"
		});
	} else {
		var styles;
		if ( !viewer.clientWidth ) {
			var style = viewer.style;
			styles = {
				display: style.display,
				position: style.position,
				visibility: style.visibility
			};
			$$D.setStyle( viewer, {
				display: "block", position: "absolute", visibility: "hidden"
			});
		}
		this._viewerWidth = viewer.clientWidth;
		this._viewerHeight = viewer.clientHeight;
		if ( styles ) { $$D.setStyle( viewer, styles ); }
		
		rangeWidth = Math.ceil( this._viewerWidth / scale );
		rangeHeight = Math.ceil( this._viewerHeight / scale );
	}
	this._rangeWidth = rangeWidth;
	this._rangeHeight = rangeHeight;
  },
 
  _start: function() {
	clearTimeout( this._timer );
	var viewer = this._viewer, image = this._image, scale = this._scale;
	viewer.style.display = "block";
	$$CE.fireEvent( this, "start" );
	this.onStart();
	$$E.removeEvent( image, "mouseover", this._START );
	$$E.removeEvent( image, "mousemove", this._START );
	$$E.addEvent( document, "mousemove", this._MOVE );
	$$E.addEvent( document, "mouseout", this._OUT );
	this.mouse && $$E.addEvent( document, $$B.firefox ? "DOMMouseScroll" : "mousewheel", this._MOUSE );
  },
  
  _move: function(e) {
	clearTimeout( this._timer );
	var x = e.pageX, y = e.pageY, rect = this._rect;
	if ( x < rect.left || x > rect.right || y < rect.top || y > rect.bottom ) {
		//this._END();
	} else {
		var pos = {}, scale = this._scale, zoom = this._zoom,
			viewerWidth = this._viewerWidth,
			viewerHeight = this._viewerHeight;
		
		pos.left = viewerWidth / 2 - ( x - rect.left - this._repairLeft ) * scale;
		pos.top = viewerHeight / 2 - ( y - rect.top - this._repairTop ) * scale;
		
		$$CE.fireEvent( this, "repair", e, pos );
		
		x = Math.ceil(Math.min(Math.max( pos.left, viewerWidth - zoom.width ), 0));
		y = Math.ceil(Math.min(Math.max( pos.top, viewerHeight - zoom.height ), 0));
		
		zoom.style.left = x + "px";
		zoom.style.top = y + "px";
		
		$$CE.fireEvent( this, "move", e, x, y );
		this.onMove();
	}
  },
  
  _end: function() {
	$$CE.fireEvent( this, "end" );
	this.onEnd();
	this.autoHide && this._hide();
	this.stop();
	this.start();
  },
  
  _hide: function() {
	this._viewer.style.display = "none";
  },
 
  _mouse: function(e) {
	this._scale += ( e.wheelDelta ? e.wheelDelta / (-120) : (e.detail || 0) / 3 ) * this.rate;
	
	var opt = this.options;
	this._rangeWidth = opt.rangeWidth;
	this._rangeHeight = opt.rangeHeight;
	
	this._initSize();
	this._initData();
	this._move(e);
	e.preventDefault();
  },
  
  start: function() {
	if ( this._viewerWidth && this._viewerHeight ) {
		var image = this._image, START = this._START;
		$$E.addEvent( image, "mouseover", START );
		$$E.addEvent( image, "mousemove", START );
	}
  },
  
  stop: function() {
	clearTimeout( this._timer );
	$$E.removeEvent( this._image, "mouseover", this._START );
	$$E.removeEvent( this._image, "mousemove", this._START );
	$$E.removeEvent( document, "mousemove", this._MOVE );
	$$E.removeEvent( document, "mouseout", this._OUT );
	$$E.removeEvent( document, $$B.firefox ? "DOMMouseScroll" : "mousewheel", this._MOUSE );
  },
  
  reset: function(options) {
	this.stop();
	
	var viewer = this._viewer, zoom = this._zoom;
	if ( $$D.contains( viewer, zoom ) ) { viewer.removeChild( zoom ); }
	
	var opt = $$.extend( this.options, options || {} );
	this._scale = opt.scale;
	this._max = opt.max;
	this._min = opt.min;
	this._originPic = opt.originPic;
	this._zoomPic = opt.zoomPic;
	this._rangeWidth = opt.rangeWidth;
	this._rangeHeight = opt.rangeHeight;
	
	
	this._loaded = this._substitute = false;
	this._rect = null;
	this._repairLeft = this._repairTop = 
	this._viewerWidth = this._viewerHeight = 0;
	
	this._initLoad();
  },
 
  dispose: function() {
	$$CE.fireEvent( this, "dispose" );
	this.stop();
	if ( $$D.contains( this._viewer, this._zoom ) ) {
		this._viewer.removeChild( this._zoom );
	}
	this._image.onload = this._preload.onload =
		this._image = this._preload = this._zoom = this._viewer =
		this.onLoad = this.onStart = this.onMove = this.onEnd =
		this._START = this._MOVE = this._END = this._OUT = null
  }
}

ImageZoom._MODE = {
	
	"follow": {
		methods: {
			init: function() {
				this._stylesFollow = null;
				this._repairFollowLeft = 0;
				this._repairFollowTop = 0;
			},
			load: function() {
				var viewer = this._viewer, style = viewer.style, styles;
				this._stylesFollow = {
					left: style.left, top: style.top, position: style.position
				};
				viewer.style.position = "absolute";
				
				if ( !viewer.offsetWidth ) {
					styles = { display: style.display, visibility: style.visibility };
					$$D.setStyle( viewer, { display: "block", visibility: "hidden" });
				}
				
				this._repairFollowLeft = viewer.offsetWidth / 2;
				this._repairFollowTop = viewer.offsetHeight / 2;
				
				if ( !/BODY|HTML/.test( viewer.offsetParent.nodeName ) ) {
					var parent = viewer.offsetParent, rect = $$D.rect( parent );
					this._repairFollowLeft += rect.left + parent.clientLeft;
					this._repairFollowTop += rect.top + parent.clientTop;
				}
				if ( styles ) { $$D.setStyle( viewer, styles ); }
			},
			repair: function(e, pos) {
				var zoom = this._zoom,
					viewerWidth = this._viewerWidth,
					viewerHeight = this._viewerHeight;
				pos.left = ( viewerWidth / 2 - pos.left ) * ( viewerWidth / zoom.width - 1 );
				pos.top = ( viewerHeight / 2 - pos.top ) * ( viewerHeight / zoom.height - 1 );
			},
			move: function(e) {
				var style = this._viewer.style;
				style.left = e.pageX - this._repairFollowLeft + "px";
				style.top = e.pageY - this._repairFollowTop + "px";
			},
			dispose: function() {
				$$D.setStyle( this._viewer, this._stylesFollow );
			}
		}
	},
	
	"handle": {
		options: {
			handle:		""
    	},
		methods: {
			init: function() {
				var handle = $$( this.options.handle );
				if ( !handle ) {
					var body = document.body;
					handle = body.insertBefore(this._viewer.cloneNode(false), body.childNodes[0]);
					handle.id = "";
					handle["_createbyhandle"] = true;
				} else {
					var style = handle.style;
					this._stylesHandle = {
						left: style.left, top: style.top, position: style.position,
						display: style.display, visibility: style.visibility,
						padding: style.padding, margin: style.margin,
						width: style.width, height: style.height
					};
				}
				$$D.setStyle( handle, { padding: 0, margin: 0, display: "none" } );
				
				this._handle = handle;
				this._repairHandleLeft = 0;
				this._repairHandleTop = 0;
			},
			load: function() {
				var handle = this._handle, rect = this._rect;
				$$D.setStyle( handle, {
					position: "absolute",
					width: this._rangeWidth + "px",
					height: this._rangeHeight + "px",
					display: "block",
					visibility: "hidden"
				});
				
				this._repairHandleLeft = rect.left + this._repairLeft - handle.clientLeft;
				this._repairHandleTop = rect.top + this._repairTop - handle.clientTop;
				
				if ( !/BODY|HTML/.test( handle.offsetParent.nodeName ) ) {
					var parent = handle.offsetParent, rect = $$D.rect( parent );
					this._repairHandleLeft -= rect.left + parent.clientLeft;
					this._repairHandleTop -= rect.top + parent.clientTop;
				}
			
				$$D.setStyle( handle, { display: "none", visibility: "visible" });
			},
			start: function() {
				this._handle.style.display = "block";
			},
			move: function(e, x, y) {
				var style = this._handle.style, scale = this._scale;
				style.left = Math.ceil( this._repairHandleLeft - x / scale ) + "px";
				style.top = Math.ceil( this._repairHandleTop - y / scale )  + "px";
			},
			end: function() {
				this._handle.style.display = "none";
			},
			dispose: function() {
				if( "_createbyhandle" in this._handle ){
					document.body.removeChild( this._handle );
				} else {
					$$D.setStyle( this._handle, this._stylesHandle );
				}
				this._handle = null;
			}
		}
	},
	
	"cropper": {
		options: {
			opacity:	.5
    	},
		methods: {
			init: function() {
				var body = document.body,
					cropper = body.insertBefore(document.createElement("img"), body.childNodes[0]);
				cropper.style.display = "none";
				
				this._cropper = cropper;
				this.opacity = this.options.opacity;
			},
			load: function() {
				var cropper = this._cropper, image = this._image, rect = this._rect;
				cropper.src = image.src;
				cropper.width = image.width;
				cropper.height = image.height;
				$$D.setStyle( cropper, {
					position: "absolute",
					left: rect.left + this._repairLeft + "px",
					top: rect.top + this._repairTop + "px"
				});
			},
			start: function() {
				this._cropper.style.display = "block";
				$$D.setStyle( this._image, "opacity", this.opacity );
			},
			move: function(e, x, y) {
				var w = this._rangeWidth, h = this._rangeHeight, scale = this._scale;
				x = Math.ceil( -x / scale ); y = Math.ceil( -y / scale );
				this._cropper.style.clip = "rect(" + y + "px " + (x + w) + "px " + (y + h) + "px " + x + "px)";
			},
			end: function() {
				$$D.setStyle( this._image, "opacity", 1 );
				this._cropper.style.display = "none";
			},
			dispose: function() {
				$$D.setStyle( this._image, "opacity", 1 );
				document.body.removeChild( this._cropper );
				this._cropper = null;
			}
		}
	}
}

ImageZoom.prototype._initialize = (function(){
	var init = ImageZoom.prototype._initialize,
		mode = ImageZoom._MODE,
		modes = {
			"follow": [ mode.follow ],
			"handle": [ mode.handle ],
			"cropper": [ mode.cropper ],
			"handle-cropper": [ mode.handle, mode.cropper ]
		};
	return function(){
		var options = arguments[2];
		if ( options && options.mode && modes[ options.mode ] ) {
			$$A.forEach( modes[ options.mode ], function( mode ){
				
				$$.extend( options, mode.options, false );
				
				$$A.forEach( mode.methods, function( method, name ){
					$$CE.addEvent( this, name, method );
				}, this );
			}, this );
		}
		init.apply( this, arguments );
	}
})();
