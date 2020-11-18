


<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
	<xsl:output method="html" indent="no"/>
	<xsl:decimal-format NaN=""/>
	<xsl:param name="dvt_apos">&apos;</xsl:param>
	<xsl:param name="ManualRefresh"></xsl:param>
	<xsl:variable name="dvt_1_automode">0</xsl:variable>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="($ManualRefresh = 'True')">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top">
							<xsl:call-template name="dvt_1"/>
						</td>
						<td width="1%" class="ms-vb" valign="top">
							<img src="/_layouts/15/images/staticrefresh.gif" id="ManualRefresh" border="0" onclick="javascript: {ddwrt:GenFireServerEvent('__cancel')}" alt="Click here to refresh the dataview."/>
						</td>
					</tr>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="dvt_1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="dvt_1">
		<xsl:variable name="dvt_StyleName">ListForm</xsl:variable>
		<xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row"/>
		<xsl:variable name="dvt_RowCount" select="count($Rows)"/>
		<xsl:variable name="dvt_IsEmpty" select="$dvt_RowCount = 0"/>
		<xsl:choose>
			<xsl:when test="$dvt_IsEmpty">
				<xsl:call-template name="dvt_1.empty"/>
			</xsl:when>
			<xsl:otherwise>
				<table border="0" width="100%">
					<xsl:call-template name="dvt_1.body">
						<xsl:with-param name="Rows" select="$Rows"/>
					</xsl:call-template>
				</table>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="dvt_1.body">
		<xsl:param name="Rows"/>
		<xsl:for-each select="$Rows">
			<xsl:call-template name="dvt_1.rowview"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="dvt_1.rowview">
<script type="text/javascript" src="/seeyii/resource/js/SeeyiiView.js"></script>
<link rel="stylesheet" type="text/css" href="/seeyii/resource/css/SeeyiiView.css" />
<script type="text/javascript">
FORMCONST = {
    _x503a__x5238__x7c7b__x522b_: {
        operation: "mapConstTable",
        listName: "债券常量表",
        sourceField: "_x6574__x578b__x503c_",
        constCodeField: "_x5e38__x91cf__x5206__x7c7b__x7f",
        constCodeValue: "1030",
        returnField: "_x5e38__x91cf__x63cf__x8ff0_"
    },
    _x8d77__x606f__x65e5_: {
      operation: "formatDateTime"
    },
    _x5230__x671f__x65e5_: {
      operation: "formatDateTime"
    },
    foreign_ztpj: {
      operation: "mapForeignTable",
      listName: "债券要素新表",
			foreignField: "_x503a__x5238_id",
			returnField: "_x503a__x9879__x4fe1__x7528__x7e",
			infoType: ""
    },
    foreign_zxpj: {
      operation: "mapForeignTable",
      listName: "可转债基本信息",
			foreignField: "_x503a__x5238_id",
			returnField: "_x503a__x5238__x4fe1__x7528__x7e",
			infoType: ""
    },
    foreign_fxr: {
      operation: "mapForeignTable",
      listName: "债券要素新表",
			foreignField: "_x503a__x5238_id",
			returnField: "_x53d1__x884c__x65e5_",
			infoType: "datetime"
    },
    foreign_ssr: {
      operation: "mapForeignTable",
      listName: "债券要素新表",
			foreignField: "_x503a__x5238_id",
			returnField: "_x4e0a__x5e02__x65e5__x0028__x4e",
			infoType: "datetime"
    },
    foreign_jysfl: {
      operation: "mapForeignTable",
      listName: "债券多维度分类表",
			foreignField: "_x503a__x5238_id",
			returnField: "_x4ea4__x6613__x6240__x5206__x7c",
			infoType: "const",
			constClassification: {
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
			}
    },
    foreign_zjhfl: {
      operation: "mapForeignTable",
      listName: "债券多维度分类表",
			foreignField: "_x503a__x5238_id",
			returnField: "_x8bc1__x76d1__x4f1a__x5206__x7c",
			infoType: "const",
			constClassification: {
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
			}
    },
    foreign_jysxhfl: {
        operation: "mapForeignTable",
        listName: "债券多维度分类表",
        foreignField: "_x503a__x5238_id",
        returnField: "_x4ea4__x6613__x5546__x534f__x4f",
        infoType: "const",
        constClassification: {
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
        }
    },
    foreign_qssfl: {
        operation: "mapForeignTable",
        listName: "债券多维度分类表",
        foreignField: "_x503a__x5238_id",
        returnField: "_x6e05__x7b97__x6240__x5206__x7c",
        infoType: "const",
        constClassification: {
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
        }
    },
    foreign_zzdflyj: {
        operation: "mapForeignTable",
        listName: "债券多维度分类表",
        foreignField: "_x503a__x5238_id",
        returnField: "_x4e2d__x503a__x767b__x5206__x7c",
        infoType: "const",
        constClassification: {
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
        }
    },
    foreign_zzdflej: {
        operation: "mapForeignTable",
        listName: "债券多维度分类表",
        foreignField: "_x503a__x5238_id",
        returnField: "_x4e2d__x503a__x767b__x5206__x7c0",
        infoType: "const",
        constClassification: {
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
    },
    foreign_btn: {
      operation: "addBtnHref",
      baseUrl: "/seeyii/Lists/List2/AllItems.aspx",
      query: {
        // value字段不能异步获取
        fxr: "_x53d1__x884c__x4e3b__x4f53_"
      }
    }
};
</script>
		<tr>
			<td class="under-line-border  row-title">
				<span class="page-title"><xsl:value-of select="@_x503a__x5238__x7b80__x79f0_"/></span>
				<span class="page-title">(<xsl:value-of select="@_x503a__x5238__x4ee3__x7801_"/>)</span>
			</td>
		</tr>
		<tr>
			<td>
				<table border="0" cellspacing="0" width="100%" style="border-collapse:collapse" id="MainTable">
					<tr>
						<td class="ms-formlabel">债券全称：</td>
						<td class="ms-formbody" colspan="3" id="Title"><xsl:value-of select="@Title"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">债券类型：</td>
						<td class="ms-formbody init-hide" colspan="3" id="_x503a__x5238__x7c7b__x522b_"><xsl:value-of select="@_x503a__x5238__x7c7b__x522b_"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel under-line-border" width="15%">主体评级：</td>
						<td class="ms-formbody under-line-border init-hide" width="35%" id="foreign_ztpj"><xsl:value-of select="@_x503a__x5238_id"/></td>
						<td class="ms-formlabel under-line-border" width="15%">债项评级：</td>
						<td class="ms-formbody under-line-border init-hide" width="35%" id="foreign_zxpj"><xsl:value-of select="@_x503a__x5238_id"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">发行人：</td>
						<td class="ms-formbody" colspan="3" id="_x53d1__x884c__x4e3b__x4f53_"><xsl:value-of select="@_x53d1__x884c__x4e3b__x4f53_"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">担保人：</td>
						<td class="ms-formbody" colspan="3" id="_x62c5__x4fdd__x4eba_"><xsl:value-of select="@_x62c5__x4fdd__x4eba_"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">发行日：</td>
						<td class="ms-formbody init-hide" id="foreign_fxr"><xsl:value-of select="@_x503a__x5238_id"/></td>
						<td class="ms-formlabel">上市日：</td>
						<td class="ms-formbody init-hide" id="foreign_ssr"><xsl:value-of select="@_x503a__x5238_id"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel under-line-border">起息日：</td>
						<td class="ms-formbody under-line-border" id="_x8d77__x606f__x65e5_"><xsl:value-of select="@_x8d77__x606f__x65e5_"/></td>
						<td class="ms-formlabel under-line-border">到期兑付日：</td>
						<td class="ms-formbody under-line-border" id="_x5230__x671f__x65e5_"><xsl:value-of select="@_x5230__x671f__x65e5_"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel text-center" colspan="4">债券多维度信息</td>
					</tr>
					<tr>
						<td class="ms-formlabel">交易所分类：</td>
						<td class="ms-formbody init-hide" id="foreign_jysfl"><xsl:value-of select="@_x503a__x5238_id"/></td>
						<td class="ms-formlabel">证监会分类：</td>
						<td class="ms-formbody init-hide" id="foreign_zjhfl"><xsl:value-of select="@_x503a__x5238_id"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">交易商协会分类：</td>
						<td class="ms-formbody init-hide" id="foreign_jysxhfl"><xsl:value-of select="@_x503a__x5238_id"/></td>
						<td class="ms-formlabel">清算所分类：</td>
						<td class="ms-formbody init-hide" id="foreign_qssfl"><xsl:value-of select="@_x503a__x5238_id"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">中债登分类一级：</td>
						<td class="ms-formbody init-hide" id="foreign_zzdflyj"><xsl:value-of select="@_x503a__x5238_id"/></td>
						<td class="ms-formlabel">中债登分类二级：</td>
						<td class="ms-formbody init-hide" id="foreign_zzdflej"><xsl:value-of select="@_x503a__x5238_id"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<button class="btn seeyii-search" id="foreign_btn"><span>查看发行主体关联方</span><img src="/seeyii/images/wait.png"/></button>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="dvt_1.empty">
		<xsl:variable name="dvt_ViewEmptyText">此视图中没有项目可显示。</xsl:variable>
		<table border="0" width="100%">
			<tr>
				<td class="ms-vb">
					<xsl:value-of select="$dvt_ViewEmptyText"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>	