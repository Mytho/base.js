/*! Base ~ Released under MIT license ~ Copyright (c) 2013 Teun Zengerink */
(function(){var a={}.hasOwnProperty,b=function(b,c){function d(){this.constructor=b}for(var e in c)a.call(c,e)&&(b[e]=c[e]);return d.prototype=c.prototype,b.prototype=new d,b.__super__=c.prototype,b};define(["./events"],function(a){var c,d;return c=function(a){function c(){return d=c.__super__.constructor.apply(this,arguments)}return b(c,a),c.prototype.keys={8:"backspace",9:"tab",13:"enter",16:"shift",17:"ctrl",18:"alt",37:"left",38:"up",39:"right",40:"down",48:"0",49:"1",50:"2",51:"3",52:"4",53:"5",54:"6",55:"7",56:"8",57:"9",65:"a",66:"b",67:"c",68:"d",69:"e",70:"f",71:"g",72:"h",73:"i",74:"j",75:"k",76:"l",77:"m",78:"n",79:"o",80:"p",81:"q",82:"r",83:"s",84:"t",85:"u",86:"v",87:"w",88:"x",89:"y",90:"z",112:"f1",113:"f2",114:"f3",115:"f4",116:"f5",117:"f6",118:"f7",119:"f8",120:"f9",121:"f10",122:"f11",123:"f12",96:"num0",97:"num1",98:"num2",99:"num3",100:"num4",101:"num5",102:"num6",103:"num7",104:"num8",105:"num9"},c.prototype.handler=function(a){return/input|textarea|select/i.test((a.target||a.srcElement).nodeName)?void 0:this.fire(keys[a.keyCode])},c.prototype.off=function(a){return this.unbind(document,"keyup",this.handler),c.__super__.off.call(this,a)},c.prototype.on=function(a,b){return this.bind(document,"keyup",this.handler),c.__super__.on.call(this,a,b)},c}(a)})}).call(this);