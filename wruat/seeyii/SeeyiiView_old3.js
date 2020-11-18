$().ready(function(){
	// 1.遍历
	if (!FORMCONST) return;
	$.each(FORMCONST, function(key, value){
		var result = "--";
		
		var sourceVal = $("#" + key).text();
		if (sourceVal == ""){
			$("#" + key).html(result);
			$("#" + key).removeClass("init-hide");
			return;
		}
		
		try{
			switch (value.operation){
				// 关联常量表
				case "mapConstTable":
					mapConstTable(sourceVal, value, function(newValue){
						$("#" + key).html(newValue);
						$("#" + key).removeClass("init-hide");
					});
					break;
				// 修改时间格式
				case "formatDateTime":
					$("#" + key).html(formatDateTime(sourceVal));
					$("#" + key).removeClass("init-hide");
					break;
				// 关系链表
				case "parseRelationLink":
					result = parseRelationLink(sourceVal);
					$("#" + key).html(result);
					$("#" + key).removeClass("init-hide");
					break;
				// 获取其他表单的信息
				case "mapForeignTable":
					 mapForeignTable(sourceVal, value, function(newValue){
					 	if (newValue) {
							var temp = formatForeignValue(newValue, value);
							if (!temp) temp = "--";
							$("#" + key).html(temp);
						} else {
							$("#" + key).html("--");
						}
						$("#" + key).removeClass("init-hide");
					});
					break;
				// 跳转按钮
				case "addBtnHref":
					SetButtonHref(value, $("#" + key));
					break;
				// 外部链接改为a标签 
				case "ExternalLink":
					$("#" + key).html("<a href='"+sourceVal+"'>"+sourceVal+"</a>");
					$("#" + key).removeClass("init-hide");
					break;
				// 表单常量
				case "formConst":
					$("#" + key).html(value.constClassification[sourceVal]);
					$("#" + key).removeClass("init-hide");
					break;
				default:
					$("#" + key).html(result);
					$("#" + key).removeClass("init-hide");
					break;
			}
		} catch (error){ return; }
	});
	
	// 2. 隐藏ribbon
	hideRibbon();
});

function mapConstTable(sourceVal, v, callback){
	$().SPServices({
		operation: "GetListItems",
		async: true,
		listName: v.listName,
		CAMLQuery: "<Query>"+
						"<Where>"+
							"<And>"+
								"<Eq><FieldRef Name='" + v.sourceField + "'/><Value Type='Text'>" + sourceVal + "</Value></Eq>"+
								"<Eq><FieldRef Name='" + v.constCodeField + "' /><Value Type='Text'>" + v.constCodeValue + "</Value></Eq>"+
							"</And>"+
						"</Where>"+
						"<RowLimit>1</RowLimit>"+
					"</Query>",
		CAMLViewFields: "<ViewFields><FieldRef Name='" + v.returnField + "' /></ViewFields>",
		completefunc: function (xData, Status) {
			$(xData.responseXML).SPFilterNode("z:row").each(function() {
				callback($(this).attr("ows_" + v.returnField));
			});
		}
	});
}

function parseRelationLink(sourceVal){
	var result = "<div id='relation-link'>";
	var obj = jQuery.parseJSON($("<div/>").html(sourceVal).text());
	$.each(obj[0], function(i, item) {
		if (item.hasOwnProperty("name")) {
			result = result + "<div class='issuer-node'>"+item["name"]+"</div>";
		} else if (item.hasOwnProperty("equity_ratio")) {
			var rate = item["equity_ratio"] + '%';
				result = result + "<div class='issuer-link'><span class='issuer-text'>"+RELATIONTYPEDEFINE[item["type"][0]]+": " + rate + "</span></div>";
		}
	});
	result = result + "</div>";
	return result;
}

function mapForeignTable(sourceVal, v, callback){
	var rowLimit = "<RowLimit>1</RowLimit>";
	if (v.rowNoLimit) {
		rowLimit = "";
	}
	$().SPServices({
		operation: "GetListItems",
		async: true,
		listName: v.listName,
		CAMLQuery: "<Query>"+
						"<Where>"+
								"<Eq><FieldRef Name='" + v.foreignField+ "'/><Value Type='Text'>" + sourceVal + "</Value></Eq>"+
						"</Where>"+
						rowLimit +
					"</Query>",
		CAMLViewFields: "<ViewFields><FieldRef Name='" + v.returnField + "' /></ViewFields>",
		completefunc: function (xData, Status) {
			var responseRows = $(xData.responseXML).SPFilterNode("z:row");
			if (responseRows.length == 0) {
				callback("");
			} else if (v.rowNoLimit){
				callback(transformXml2Html(v, responseRows));
			} else {
				callback(responseRows[0].getAttribute("ows_" + v.returnField));
			}
		}
	});
}

function transformXml2Html(v, rows){
	var result = "";

	$.each(rows, function(i, item){
		var temp = "<a class='relate-bond' href='"+v.baseUrl+"?id="+item.getAttribute("ows_ID")+"'>"+item.getAttribute("ows_" + v.returnField)+"</a>";
		result = result + temp;
	});
	return result;
}

function SetButtonHref(v, $btnDom){
	var hreflink = "";
	$.each(v.query, function(key, value){
		var q = $("#" + value).text();
		if (hreflink == ""){
			hreflink = "?" + key + "=" + escapeProperly(q);
		}else{
			hreflink = hreflink + "&" + key  + "=" + escapeProperly(q);
		}
	});
	$btnDom.click(function(){
		window.open(v.baseUrl + hreflink, '_blank');
		return false;
	});
}

function formatDateTime(dateTime) {
	if (dateTime.indexOf(10) == "T") {
		var newDate = $().SPServices.SPConvertDateToISO({
		   dateToConvert: new Date(dateTime),
		});
		return newDate.substring(0, 10);
	} else {
		return dateTime.substring(0, 10);
	}
}

function formatForeignValue(info, v){
	switch (v.infoType.toLowerCase()) {
		case "datetime":
			return formatDateTime(info);
		case  "const":
			return v["constClassification"][info];
		default:
			return info;
	}
}

/*
* Ribbon初始化不显示	
*/
function hideRibbon() {
	SP.SOD.executeOrDelayUntilScriptLoaded(function () {
		try {
			var pm = SP.Ribbon.PageManager.get_instance();
			pm.add_ribbonInited(function () {
				ResetRibbon();
			});
			var ribbon = null;
			try {
				ribbon = pm.get_ribbon();
			}catch (e) { }
			if (!ribbon) {
				if (typeof (_ribbonStartInit) == "function")
				_ribbonStartInit(_ribbon.initialTabId, false, null);
			}
			else {
				ResetRibbon();
			}
		} catch (e){ }
		}, "sp.ribbon.js"
	);
}
function ResetRibbon() {
	try {
		var ribbon = SP.Ribbon.PageManager.get_instance().get_ribbon();
		SelectRibbonTab("Ribbon.Read", true);
		// ribbon.removeChild("Ribbon.ListForm.Display");
		// ribbon.removeChild("Ribbon.ListForm.Edit");
	} catch (e){ }
}