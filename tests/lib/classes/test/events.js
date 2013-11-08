/*! Base ~ Released under MIT license ~ Copyright (c) 2013 Teun Zengerink */
(function(){var a={}.hasOwnProperty,b=function(b,c){function d(){this.constructor=b}for(var e in c)a.call(c,e)&&(b[e]=c[e]);return d.prototype=c.prototype,b.prototype=new d,b.__super__=c.prototype,b};define(["../../classes/test","../../../../base/lib/classes/events"],function(a,c){var d,e;return d=function(a){function d(){return e=d.__super__.constructor.apply(this,arguments)}return b(d,a),d.prototype.name="TestEvents",d.prototype["default"]=!1,d.prototype.varOne=!1,d.prototype.varTwo=!1,d.prototype.setUp=function(){return this.varOne=this.varTwo=this["default"]},d.prototype.testBind=function(){var a,b,d=this;return b=new c,a=document.getElementsByTagName("html")[0],b.bind(a,"click",function(a){return d.varOne=a}),b.fire(a,"click","some-test-string"),b.unbind(a,"click"),equal(this.varOne,"some-test-string")},d.prototype.testBindMap=function(){var a,b,d=this;return b=new c,a=document.getElementsByTagName("html")[0],b.bind(a,{mouseenter:function(){return d.varOne="some-test-string"},mouseleave:function(){return d.varTwo="some-test-string"}}),b.fire(a,"mouseenter"),b.fire(a,"mouseleave"),b.unbind(a,"mouseenter"),b.unbind(a,"mouseleave"),equal(this.varOne,"some-test-string"),equal(this.varTwo,"some-test-string")},d.prototype.testUnbind=function(){var a,b,d=this;return b=new c,a=document.getElementsByTagName("html")[0],b.bind(a,"click",function(){return d.varOne=!d["default"]}),b.unbind(a,"click"),b.fire(a,"click"),equal(this.varOne,this["default"])},d.prototype.testOn=function(){var a,b=this;return a=new c,a.on("test",function(a){return b.varOne=a}),a.trigger("test","some-test-string"),equal(this.varOne,"some-test-string")},d.prototype.testOnMap=function(){var a,b=this;return a=new c,a.on({testOne:function(){return b.varOne="some-test-string"},testTwo:function(){return b.varTwo="some-test-string"}}),a.trigger("testOne"),a.trigger("testTwo"),a.off("testOne"),a.off("testTwo"),equal(this.varOne,"some-test-string"),equal(this.varTwo,"some-test-string")},d.prototype.testOff=function(){var a,b=this;return a=new c,a.on("test",function(){return b.varOne=!b["default"]}),a.off("test"),a.trigger("test"),equal(this.varOne,this["default"])},d}(a)})}).call(this);