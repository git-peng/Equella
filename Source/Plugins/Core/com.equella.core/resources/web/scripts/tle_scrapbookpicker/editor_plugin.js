(function(){tinymce.create("tinymce.plugins.TleScrapbookPickerPlugin",{init:function(a,b){a.addCommand("mceTleScrapbookPicker",function(){a.windowManager.bookmark=a.selection.getBookmark("simple");a.windowManager.open({file:baseActionUrl+"select_embed",width:810,height:600,inline:1,scroll:true},{plugin_url:b,some_custom_arg:"custom arg"})});a.addButton("tle_scrapbookpicker",{title:"Embed a file from scrapbook",cmd:"mceTleScrapbookPicker",image:b+"/images/scrapbook.gif"})},createControl:function(b,a){return null},getInfo:function(){return{longname:"Tle Scrapbook Picker plugin",author:"TLEI",authorurl:"http://thelearningedge.com.au",infourl:"http://thelearningedge.com.au",version:"5.0"}}});tinymce.PluginManager.add("tle_scrapbookpicker",tinymce.plugins.TleScrapbookPickerPlugin)})();