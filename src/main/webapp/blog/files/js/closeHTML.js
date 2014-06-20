	function closeHTML(str) {
		var arrTags = [ "span", "font", "b", "u", "i", "h1", "h2", "h3", "h4",
				"h5", "h6", "p", "li", "ul", "table", "div" ];
		for ( var i = 0; i < arrTags.length; i++) {
			var intOpen = 0;
			var intClose = 0;
			var re = new RegExp("\\<" + arrTags[i] + "( [^\\<\\>]+|)\\>", "ig");
			var arrMatch = str.match(re);
			if (arrMatch != null)
				intOpen = arrMatch.length;
			re = new RegExp("\\<\\/"+arrTags[i]+"\\>", "ig");
			arrMatch = str.match(re);
			if (arrMatch != null)
				intClose = arrMatch.length;
			for ( var j = 0; j < intOpen - intClose; j++) {
				str += "</"+arrTags[i]+">";
			}
			/*for(var j=(intOpen-intClose-1);j>=0;j--){ 
			 str+="</"+arrTags[i]+">"; 
			 }*/
		}
		return str;
	}
