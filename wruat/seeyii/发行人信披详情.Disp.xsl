


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
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<SharePoint:FormToolBar runat="server" ControlMode="Display"/>
				<SharePoint:ItemValidationFailedMessage runat="server" ControlMode="Display"/>
			</td>
		</tr>
		<xsl:for-each select="$Rows">
			<xsl:call-template name="dvt_1.rowview"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="dvt_1.rowview">
<script type="text/javascript" src="/seeyii/resource/js/SeeyiiView.js"></script>
<link rel="stylesheet" type="text/css" href="/seeyii/resource/css/SeeyiiView.css" />
<script type="text/javascript">
$().ready(function(){
	var parameters = "";
	
	// 变量: 事件来源链接
	var sjlylj = $("#_x4e8b__x4ef6__x6765__x6e90__x94").text();
	$("#sjly").html("<a href="+sjlylj +">"+$("#sjly").text()+"</a>");
	// 事件发生时间
	$("#fssj").text(formatDateTime($("#fssj").text()));
	// 事件结束时间
	$("#jssj").text(formatDateTime($("#jssj").text()));
	// 事件发布时间
	$("#fbsj").text(formatDateTime($("#fbsj").text()));
	// 事件获取时间
	$("#hqsj").text(formatDateTime($("#hqsj").text()));
	// 关系链表
	$("#relation_link").html(parseRelationLink($("#relation_link").text()));

	// 变量: 事件类型
	var sjlx = $("#_x4e8b__x4ef6__x7c7b__x578b_").text();
	// Table: 债券常量表
	parameters = "/_api/web/lists/getbytitle('债券常量表')/items?$filter=(_x5e38__x91cf__x5206__x7c7b__x7f eq 1010) and (_x5e38__x91cf__x7f16__x7801_ eq '"+sjlx+"')";
	getItemsFromSeeyiiView(parameters, function(v){
		// 事件类型
		$("#foreign_sjlx").text(formatRestResult(v[0].OData__x5e38__x91cf__x63cf__x8ff0_));
	});
	
	// 变量： 事项主体类型
	var sxztlx = $("#_x4e8b__x9879__x4e3b__x4f53__x7c").text();
	// Table: 债券常量表
	parameters = "/_api/web/lists/getbytitle('债券常量表')/items?$filter=(_x5e38__x91cf__x5206__x7c7b__x7f eq 1020) and (_x5e38__x91cf__x7f16__x7801_ eq "+sxztlx+")";
	getItemsFromSeeyiiView(parameters, function(v){
		// 事项主体类型
		$("#foreign_sxztlx").text(formatRestResult(v[0].OData__x5e38__x91cf__x63cf__x8ff0_));
	});

	// 重要程度
	var zycd = $(".page-title-notice").text();
	if (zycd == "1"){
		$(".page-title-notice").text("普通事件");
		$(".page-title-notice").css("color", "green");
	} else if(zycd == "9"){
		$(".page-title-notice").text("重大事件");
		$(".page-title-notice").css("color", "red");
	} else{
		$(".page-title-notice").text("一般事件");
		$(".page-title-notice").css("color", "yellow");
	}
	
	// 发行人
	var fxren = $("#fxren").text();
	// Table: 债券基本信息
	parameters = "/_api/web/lists/getbytitle('债券基本信息')/items?$filter=_x53d1__x884c__x4e3b__x4f53_ eq "+ encodeURI("'"+fxren+"'");
	getItemsFromSeeyiiView(parameters, function(v){
		// 相关存续债券
		$("#foreign_bond").html(formatRestResultsToHrefLinks(v, "/seeyii/Lists/List1/Disp.aspx", "_x503a__x5238__x7b80__x79f0_"));
	});

	hideRibbon();
});
</script>
	<tr class="page-variable">
		<td>
			<span id="_x4e8b__x4ef6__x7c7b__x578b_"><xsl:value-of select="@_x4e8b__x4ef6__x7c7b__x578b_"/></span>
			<span id="_x4e8b__x9879__x4e3b__x4f53__x7c"><xsl:value-of select="@_x4e8b__x9879__x4e3b__x4f53__x7c"/></span>
			<span id="_x4e8b__x4ef6__x6765__x6e90__x94"><xsl:value-of select="@_x4e8b__x4ef6__x6765__x6e90__x94"/></span>
		</td>
	</tr>
	<tr>
		<td class="under-line-border row-title">
			<span class="page-title"><xsl:value-of select="@_x53d1__x884c__x4eba_"/></span>
			<span class="page-title-notice"><xsl:value-of select="@_x91cd__x8981__x7a0b__x5ea6_"/></span>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" cellspacing="0" width="100%" style="border-collapse:collapse" id="MainTable">
				<tr>
        			<td class="ms-formlabel" width="15%">事件主体：</td>
					<td class="ms-formbody" width="35%"><xsl:value-of select="@Title"/></td>
					<td class="ms-formlabel" width="15%">事件主体统一社会用代码：</td>
					<td class="ms-formbody" width="35%"><xsl:value-of select="@_x4e8b__x4ef6__x4e3b__x4f53__x7e"/></td>
				</tr>
				<tr>
        			<td class="ms-formlabel" width="15%">发行人：</td>
					<td class="ms-formbody" width="35%" id="fxren"><xsl:value-of select="@_x53d1__x884c__x4eba_"/></td>
					<td class="ms-formlabel" width="15%">发行人统一社会用代码：</td>
					<td class="ms-formbody" width="35%"><xsl:value-of select="@_x53d1__x884c__x4eba__x7edf__x4e"/></td>
				</tr>
				<tr>
        			<td class="ms-formlabel" width="15%">事件发生时间：</td>
					<td class="ms-formbody" width="35%" id="fssj"><xsl:value-of select="@_x4e8b__x4ef6__x53d1__x751f__x65"/></td>
					<td class="ms-formlabel" width="15%">事件结束时间：</td>
					<td class="ms-formbody" width="35%" id="jssj"><xsl:value-of select="@_x4e8b__x4ef6__x7ed3__x675f__x65"/></td>
				</tr>
				<tr>
        			<td class="ms-formlabel" width="15%">事件发布时间：</td>
					<td class="ms-formbody" width="35%" id="fbsj"><xsl:value-of select="@_x4e8b__x4ef6__x53d1__x5e03__x65"/></td>
					<td class="ms-formlabel" width="15%">事件获取时间：</td>
					<td class="ms-formbody" width="35%" id="hqsj"><xsl:value-of select="@_x4e8b__x4ef6__x83b7__x53d6__x65"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel">事件类型：</td>
					<td class="ms-formbody" colspan="3" id="foreign_sjlx"></td>
				</tr>
				<tr>
					<td class="ms-formlabel">事项主体类型：</td>
					<td class="ms-formbody" colspan="3" id="foreign_sxztlx"></td>
				</tr>
				<tr>
					<td class="ms-formlabel under-line-border">事件来源：</td>
					<td class="ms-formbody under-line-border" colspan="3" id="sjly"><xsl:value-of select="@_x4e8b__x4ef6__x6765__x6e90_"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel">文书号</td>
					<td class="ms-formbody" colspan="3">
						<div><xsl:value-of select="@_x6587__x4e66__x53f7_1"/></div>
						<div><xsl:value-of select="@_x6587__x4e66__x53f7_2"/></div>
						<div><xsl:value-of select="@_x6587__x4e66__x53f7_3"/></div>
					</td>
				</tr>
				<tr>
					<td class="ms-formlabel">涉事方</td>
					<td class="ms-formbody" colspan="3">
					<div><xsl:value-of select="@_x6d89__x4e8b__x65b9_1"/></div>
					<div><xsl:value-of select="@_x6d89__x4e8b__x65b9_2"/></div>
					<div><xsl:value-of select="@_x6d89__x4e8b__x65b9_3"/></div>
					</td>
				</tr>
				<tr>
					<td class="ms-formlabel">涉事金额（人民币元）</td>
					<td class="ms-formbody" colspan="3">
					<div><xsl:value-of select="@_x6d89__x4e8b__x91d1__x989d_1_xf"/></div>
					<div><xsl:value-of select="@_x6d89__x4e8b__x91d1__x989d_2_xf"/></div>
					<div><xsl:value-of select="@_x6d89__x4e8b__x91d1__x989d_3_xf"/></div>
					</td>
				</tr>
				<tr>
					<td class="ms-formlabel under-line-border">事件标签</td>
					<td class="ms-formbody under-line-border" colspan="3">
					<div><xsl:value-of select="@_x4e8b__x4ef6__x6807__x7b7e_1"/></div>
					<div><xsl:value-of select="@_x4e8b__x4ef6__x6807__x7b7e_2"/></div>
					<div><xsl:value-of select="@_x4e8b__x4ef6__x6807__x7b7e_3"/></div>
					</td>
				</tr>
				<tr>
					<td class="ms-formlabel text-center" colspan="4">事件描述</td>
				</tr>
				<tr>
					<td class="ms-formbody under-line-border" colspan="4"><xsl:value-of select="@_x4e8b__x4ef6__x63cf__x8ff0_"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel text-center" colspan="4">关系链路</td>
				</tr>
				<tr>
					<td class="ms-formbody under-line-border" id="relation_link" colspan="4"><xsl:value-of select="@_x5173__x7cfb__x94fe__x8def_"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel text-center" colspan="4">相关存续债券</td>
				</tr>
				<tr>
					<td class="ms-formbody" colspan="4" id="foreign_bond"></td>
				</tr>

				<tr id="idAttachmentsRow">
					<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
						<SharePoint:FieldLabel ControlMode="Display" FieldName="Attachments" runat="server"/>
					</td>
					<td valign="top" class="ms-formbody" width="80%">
						<SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="Display" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('u','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
						<script>
      var elm = document.getElementById("idAttachmentsTable");
      if (elm == null || elm.rows.length == 0)
      document.getElementById("idAttachmentsRow").style.display='none';
    </script>
					</td>
				</tr>
				<xsl:if test="$dvt_1_automode = '1'" ddwrt:cf_ignore="1">
					<tr>
						<td colspan="99" class="ms-vb">
							<span ddwrt:amkeyfield="ID" ddwrt:amkeyvalue="ddwrt:EscapeDelims(string(@ID))" ddwrt:ammode="view"></span>
						</td>
					</tr>
				</xsl:if>
			</table>
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