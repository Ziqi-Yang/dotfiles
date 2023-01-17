// disable ctrl+w
try {
 let {classes:Cc, interfaces:Ci, manager:Cm, utils:Cu} = Components;
 const {Services} = Cu.import('resource://gre/modules/Services.jsm');
 function ConfigJS() { Services.obs.addObserver(this, 'chrome-document-global-created', false); }
 ConfigJS.prototype = {
  observe: function (aSubject) { aSubject.addEventListener('DOMContentLoaded', this, {once: true}); },
  handleEvent: function (aEvent) {
   let document = aEvent.originalTarget;
   let window = document.defaultView;
   let location = window.location;
   if (/^(chrome:(?!\/\/(global\/content\/commonDialog|browser\/content\/webext-panels)\.x?html)|about:(?!blank))/i.test(location.href)) {
    if (window._gBrowser) {
     let attr, elm, key, mbo;
      let KEYS = ['key_close'];
      let ATTR = ['key','modifiers','command','oncommand'];
      for (key in KEYS){
       elm = window.document.getElementById(KEYS[key]);
       if (elm) for (attr in ATTR) if (ATTR[attr] in elm.attributes) elm.removeAttribute(ATTR[attr]);
      }
    }
   }
  }
 };
 if (!Services.appinfo.inSafeMode) { new ConfigJS(); }
} catch(e) {Cu.reportError(e);}
