var bondNatureClassification = {
	"_x4ea4__x6613__x6240__x5206__x7c": {
		"1100": "国债",
		"1101": "地方政府债",
		"1102": "金融债",
		"1103": "企业债",
		"1104": "中小企业私募债",
		"1105": "公司债券",
		"1106": "可转换公司债",
		"1107": "分离交易的可转换公司债",
		"1108": "可交换公司债",
		"1109": "非公开发行公司债",
		"1110": "次级债",
		"1111": "企业资产支持证券",
		"1112": "信贷资产支持证券",
		"1113": "其他债",
		"1200": "国债",
		"1201": "地方政府债",
		"1202": "政策性金融债",
		"1203": "公司债",
		"1204": "企业债",
		"1205": "可转债",
		"1206": "可交换公司债",
		"1207": "非公开发行公司债",
		"1208": "非公开发行可交换债",
		"1209": "证券公司次级债",
		"1210": "证券公司短期公司债",
		"1211": "企业资产支持证券",
		"1212": "不动产投资信托",
		"1213": "创新创业可转换债券",
		"1214": "政府支持债券"
	},
	"_x8bc1__x76d1__x4f1a__x5206__x7c": {
		"2300": "一般公司债",
		"2301": "证券公司债",
		"2302": "可交换债",
		"2303": "中小企业私募债",
		"2304": "可交换私募债",
		"2305": "证券公司次级债",
		"2306": "期货公司次级债",
		"2307": "可转债",
		"2308": "可分离交易可转债",
		"2309": "企业资产支持证券"
	},
	"_x4ea4__x6613__x5546__x534f__x4f": {
		"2400": "超短期融资券(SCP)",
        "2401": "短期融资券(CP)",
        "2402": "中期票据(MTN)",
        "2403": "资产支持票据(ABN)",
        "2404": "绿色债务融资工具(GN)",
        "2405": "中小企业集合票据(SMECN)",
        "2406": "中小企业区域集优票据(SMECNII)",
        "2407": "项目收益票据(PRN)",
        "2408": "定向工具(PPN)",
        "2409": "自贸试验区债券融资工具(F-CP)",
        "2410": "信用风险缓释凭证(CRMW)",
        "2411": "信用联结票据(CLN)",
        "2412": "资产支持商业票据(ABCP)"
	},
	"_x6e05__x7b97__x6240__x5206__x7c": {
		"2100": "人民币债券",
	    "2101": "特别提款权计价债券",
	    "2102": "同业存单",
	    "2103": "资产支持证券",
	    "2104": "信用风险缓释凭证",
	    "2105": "信用联结票据",
	    "2106": "非公开定向债券融资工具",
	    "2107": "中期票据",
	    "2108": "短期融资券",
	    "2109": "超短期融资券",
	    "2110": "集合票据",
	    "2111": "绿色债务融资工具",
	    "2112": "非金融企业资产支持票据",
	    "2113": "项目收益票据",
	    "2114": "金融企业短期融资券",
	    "2115": "金融债",
	    "2116": "标准化票据"
	},
	"_x4e2d__x503a__x767b__x5206__x7c": {
		"2000": "国债",
        "2001": "央行票据",
        "2002": "地方政府债",
        "2003": "政策性银行债",
        "2004": "企业债",
        "2005": "短期融资债",
        "2006": "商业银行债",
        "2007": "资产支持证券",
        "2008": "非银行金融债",
        "2009": "国际机构债",
        "2010": "政府支持机构债券",
        "2011": "超短期融资债",
        "2012": "非公开发行债券",
        "2013": "保险公司金融债",
        "2014": "中期票据",
        "2015": "中小企业集合票据"
	},
	"_x4e2d__x503a__x767b__x5206__x7c0": {
		"2000000": "记账式附息国债",
        "2000001": "记账式贴现国债",
        "2000002": "凭证式国债",
        "2000003": "储蓄式国债",
        "2000004": "特别国债",
        "2003001": "国家开发银行债",
        "2003002": "进出口银行债",
        "2003003": "农业发展银行债",
        "2005000": "企业短融",
        "2005001": "证券公司短融",
        "2006000": "普通债",
        "2006001": "次级债",
        "2006002": "混合债",
        "2006003": "其他一级资本工具",
        "2006004": "二级资本工具",
        "2007000": "ABS",
        "2007001": "MBS",
        "2010000": "中央汇金债",
        "2010001": "铁道债",
        "2012000": "项目收益债",
        "2012001": "绿色债券"
	}
};

var RELATIONTYPEDEFINE = {
	"A100": "股权信息",
	"B100": "法定代表人关系",
	"Z100": "管理关系（合伙人关系）",
	"Y100": "合约关系",
	"D100": "实控关系",
	"X100": "分支机构",
	"W100": "海外子公司"
};

function getItemsFromSeeyiiView(parameters, callout){
	var oDataUrl = _spPageContextInfo.webAbsoluteUrl + parameters;
	$.ajax({
		url: oDataUrl,
		type: "GET",
		dataType: "json",
		headers: {
			"accept": "application/json;odata=verbose"
		},
		success: function(data){
			if (data.d.results.length == 0){
				callout([""]);
			} else {
				callout(data.d.results);
			}
		},
		error: function (data, errMessage) {
			console.log("Error");
		}
	});
}

function formatRestResult(info){
	if (info == "undefined" || info == null){
		return "--";
	} else{
		return info;
	}
}

function formatDateTime(info){
	if (info == "undefined" || info == null || info == ""){
		return "--";
	} else{
		var newDate = $().SPServices.SPConvertDateToISO({
		   dateToConvert: new Date(info),
		});
		return newDate.substring(0, 10);
	}
}

function formatBondNature(key, info){
	if (info == null) { return "--"; }
	try{
		return bondNatureClassification[key][info];
	} catch (e){
		return "--";
	}
}

function setButtonHref(query){
	var hreflink = "";
	$.each(query, function(key, value){
		var q = $("#" + value).text();
		if (hreflink == ""){
			hreflink = "?" + key + "=" + escapeProperly(q);
		}else{
			hreflink = hreflink + "&" + key  + "=" + escapeProperly(q);
		}
	});
	return hreflink;
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

function formatRestResultsToHrefLinks(v, baseUrl, colname){
	if (v.length == 0) return "--";
	var result = "";
	$.each(v, function(i, item){
		var t = item["ID"];
		var temp = "<a class='relate-bond' href='"+baseUrl+"?id="+item["ID"]+"'>"+item["OData_" + colname]+"</a>";
		result = result + temp;
	});
	return result;
}


/*
* Ribbon初始化不显示	
*/
function hideRibbon(){
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
function ResetRibbon(){
	try {
		var ribbon = SP.Ribbon.PageManager.get_instance().get_ribbon();
		SelectRibbonTab("Ribbon.Read", true);
		// ribbon.removeChild("Ribbon.ListForm.Display");
		// ribbon.removeChild("Ribbon.ListForm.Edit");
	} catch (e){ }
}



