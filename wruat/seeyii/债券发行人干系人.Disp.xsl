

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
		<tr>
			<td class="ms-toolbar ms-descriptiontext" nowrap="nowrap">
				<table style="padding:20px">
					<tr>
						<td>创建时间：<SharePoint:FormField FieldName="_x6570__x636e__x521b__x5efa__x65" runat="server" ControlMode="Display" DisableInputFieldLabel="true"/></td>
					</tr>
					<tr>
						<td>更新时间：<SharePoint:FormField FieldName="_x6570__x636e__x66f4__x65b0__x65" runat="server" ControlMode="Display" DisableInputFieldLabel="true"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="dvt_1.rowview">
<script type="text/javascript" src="/seeyii/resource/js/SeeyiiView.js"></script>
<link rel="stylesheet" type="text/css" href="/seeyii/resource/css/SeeyiiView.css" />
<script type="text/javascript">
$().ready(function(){
	var parameters = "";
	
	// 干系人类型
	var gxrlx = $("#_x5e72__x7cfb__x4eba__x7c7b__x57").text()
	// Table: 债券常量表
	parameters = "/_api/web/lists/getbytitle('债券常量表')/items?$filter=(_x5e38__x91cf__x5206__x7c7b__x7f eq 1020) and (_x5e38__x91cf__x7f16__x7801_ eq "+gxrlx+")";
	getItemsFromSeeyiiView(parameters, function(v){
		// 干系人类型
		$("#foreign_gxrlx").text(formatRestResult(v[0].OData__x5e38__x91cf__x63cf__x8ff0_));
	});
	
	// 关系链表
	$("#relation_link").html(parseRelationLink($("#relation_link").text()));

	// Title
	var title = $("#Title").text();
	// Table: 债券基本信息
	parameters = "/_api/web/lists/getbytitle('债券基本信息')/items?$filter=_x53d1__x884c__x4e3b__x4f53_ eq "+ encodeURI("'"+title+"'");
	getItemsFromSeeyiiView(parameters, function(v){
		// 相关存续债券
		$("#foreign_bond").html(formatRestResultsToHrefLinks(v, "/seeyii/Lists/List1/Disp.aspx", "_x503a__x5238__x7b80__x79f0_"));
	});
	
	// 查看舆情
	var public_sentiment_query = {
		fxr: "Title"
	};
	$("#public_sentiment").click(function(){
		var hreflink = setButtonHref(public_sentiment_query);
		window.open("/seeyii/Lists/List3/AllItems.aspx" + hreflink, '_blank');
		return false;
	});
	
	hideRibbon();
});
</script>
	<tr class="page-variable">
		<td>
			<span id="Title"><xsl:value-of select="@Title"/></span>
			<span id="_x5e72__x7cfb__x4eba__x7c7b__x57"><xsl:value-of select="@_x5e72__x7cfb__x4eba__x7c7b__x57"/></span>
		</td>
	</tr>
	<tr>
		<td class="under-line-border row-title">
			<span class="page-title"><xsl:value-of select="@Title"/></span>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" cellspacing="0" width="100%" style="border-collapse:collapse" id="MainTable">
				<tr>
					<td class="ms-formlabel" width="15%">发行人：</td>
					<td class="ms-formbody" width="35%"><xsl:value-of select="@Title"/></td>
        			<td class="ms-formlabel" width="15%">发行人社会信用码：</td>
					<td class="ms-formbody" width="35%"><xsl:value-of select="@_x53d1__x884c__x4eba__x793e__x4f"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel">干系人：</td>
					<td class="ms-formbody"><xsl:value-of select="@_x5e72__x7cfb__x4eba_"/></td>
			        <td class="ms-formlabel">干系人社会信用码：</td>
					<td class="ms-formbody"><xsl:value-of select="@_x5e72__x7cfb__x4eba__x793e__x4f"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel">干系人类型：</td>
					<td class="ms-formbody" colspan="3" id="foreign_gxrlx"></td>
				</tr>
				<tr>
					<td class="ms-formlabel under-line-border">持有发债主体比例：</td>
					<td class="ms-formbody under-line-border"><xsl:value-of select="@_x6301__x6709__x53d1__x503a__x4e"/></td>
					<td class="ms-formlabel under-line-border">发债主体持股比例：</td>
					<td class="ms-formbody under-line-border"><xsl:value-of select="@_x53d1__x503a__x4e3b__x4f53__x63"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel text-center" colspan="4">关系链路</td>
      			</tr>
      			<tr>
					<td class="ms-formbody under-line-border" colspan="4" id="relation_link"><xsl:value-of select="@_x5173__x7cfb__x94fe__x8def_"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel text-center" colspan="4">相关存续债券</td>
				</tr>
				<tr>
					<td class="ms-formbody" colspan="4" id="foreign_bond"></td>
				</tr>
				<tr>
					<td>
						<button class="btn seeyii-search" id="public_sentiment"><span>查看舆情</span></button>
					</td>
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