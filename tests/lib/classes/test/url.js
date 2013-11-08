/*! Base ~ Released under MIT license ~ Copyright (c) 2013 Teun Zengerink */
(function(){var a={}.hasOwnProperty,b=function(b,c){function d(){this.constructor=b}for(var e in c)a.call(c,e)&&(b[e]=c[e]);return d.prototype=c.prototype,b.prototype=new d,b.__super__=c.prototype,b};define(["../../classes/test","../../../../base/lib/classes/url"],function(a,c){var d,e;return d=function(a){function d(){return e=d.__super__.constructor.apply(this,arguments)}return b(d,a),d.prototype.name="TestUrl",d.prototype.baseOne="some/base",d.prototype.baseTwo="some/other/base/",d.prototype.uriOne="some/longer/uri",d.prototype.uriTwo="/some/longer/uri/",d.prototype.testBase=function(){var a,b;return a=new c(this.baseOne),b=new c(this.baseTwo),equal(a.base(),""+window.location.protocol+"//"+window.location.host+"/"+this.baseOne),equal(b.base(),""+window.location.protocol+"//"+window.location.host+"/"+this.baseTwo.replace(/^\/|\/$/g,""))},d.prototype.testSite=function(){var a,b;return a=new c(this.baseOne),b=new c(this.baseTwo),equal(a.site(this.uriOne),""+window.location.protocol+"//"+window.location.host+"/"+this.baseOne+"/"+this.uriOne),equal(b.site(this.uriTwo),""+window.location.protocol+"//"+window.location.host+"/"+this.baseTwo.replace(/^\/|\/$/g,"")+"/"+this.uriTwo.replace(/^\/|\/$/g,""))},d}(a)})}).call(this);