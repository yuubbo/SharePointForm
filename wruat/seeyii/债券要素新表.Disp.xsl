


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
	$("#fxr").text(formatDateTime($("#fxr").text()));
	$("#ssr").text(formatDateTime($("#ssr").text()));
	
	var zqid = $("#_x503a__x5238_id").text();
	// Table: 债券基本信息
	var parameters = "/_api/web/lists/getbytitle('债券基本信息')/items?$filter=_x503a__x5238_id eq "+zqid;
	GetItemFromSeeyiiView(parameters, function(v){
		// 债券简称 + 债券代码
		var zqjc = formatRestResult(v.OData__x503a__x5238__x7b80__x79f0_)+"("+formatRestResult(v.OData__x503a__x5238__x4ee3__x7801_)+")";
		if (zqjc == "--(--)"){
			$(".page-title").text("--");
		} else{
			$(".page-title").text(zqjc);
		}
		// 发行人
		$("#foreign_fxr").text(formatRestResult(v.OData__x53d1__x884c__x4e3b__x4f53_));
		// 担保人
		$("#forgien_dbr").text(formatRestResult(v.OData__x62c5__x4fdd__x4eba_));
		// 起息日
		$("#foreign_qxr").text(formatDateTime(v.OData__x8d77__x606f__x65e5_));
		// 到期兑付日
		$("#foreign_dqdfr").text(formatDateTime(v.OData__x5230__x671f__x65e5_));
		
		// 债券类别
		var zqlb = formatRestResult(v.OData__x503a__x5238__x7c7b__x522b_);
		if (zqlb != "--"){
			// Table: 债券常量表
			var para2 = "/_api/web/lists/getbytitle('债券常量表')/items?$filter=(_x5e38__x91cf__x5206__x7c7b__x7f eq 1030) and (_x6574__x578b__x503c_ eq "+zqlb+")";
			GetItemFromSeeyiiView(para2, function(v2){
				// 债券类别
				$("#foreign_zqlb").text(formatRestResult(v2.OData__x5e38__x91cf__x63cf__x8ff0_));
			});
		} else{
			$("#foreign_zqlb").text("--");
		}
	});

	// Table: 可转债基本信息
	parameters = "/_api/web/lists/getbytitle('可转债基本信息')/items?$filter=_x503a__x5238_id eq "+zqid;
	GetItemFromSeeyiiView(parameters, function(v){
		// 债项评级
		$("#foreign_zxpj").text(formatRestResult(v.OData__x503a__x5238__x4fe1__x7528__x7e));
	});
	
	// 债券多维度分类表
	parameters = "/_api/web/lists/getbytitle('债券多维度分类表')/items?$filter=_x503a__x5238_id eq "+zqid;
	GetItemFromSeeyiiView(parameters, function(v){
		// 交易所分类
		$("#bond_nature_jysfl").text(formatBondNature("_x4ea4__x6613__x6240__x5206__x7c", v.OData__x4ea4__x6613__x6240__x5206__x7c));
		// 证监会分类
		$("#bond_nature_zjhfl").text(formatBondNature("_x8bc1__x76d1__x4f1a__x5206__x7c", v.OData__x8bc1__x76d1__x4f1a__x5206__x7c));
		// 交易商协会分类
		$("#bond_nature_jysxhfl").text(formatBondNature("_x4ea4__x6613__x5546__x534f__x4f", v.OData__x4ea4__x6613__x5546__x534f__x4f));
		// 清算所分类
		$("#bond_nature_qssfl").text(formatBondNature("_x6e05__x7b97__x6240__x5206__x7c", v.OData__x6e05__x7b97__x6240__x5206__x7c));
		// 中债登分类一级
		$("#bond_nature_zzdflyj").text(formatBondNature("_x4e2d__x503a__x767b__x5206__x7c", v.OData__x4e2d__x503a__x767b__x5206__x7c));
		// 中债登分类二级
		$("#bond_nature_zzdflej").text(formatBondNature("_x4e2d__x503a__x767b__x5206__x7c0", v.OData__x4e2d__x503a__x767b__x5206__x7c0));
	});

	// 查看发行主体关联方
	var issuing_entity_query = {
		fxr: "_x53d1__x884c__x4e3b__x4f53_"
	};
	$("#issuing_entity").click(function(){
		var hreflink = SetButtonHref(issuing_entity_query);
		window.open("/seeyii/Lists/List2/AllItems.aspx" + hreflink, '_blank');
		return false;
	});
	
	hideRibbon();
});
</script>
	<tr class="page-variable">
		<td id="_x503a__x5238_id"><xsl:value-of select="@_x503a__x5238_id"/></td>
	</tr>
	<tr>
		<td class="under-line-border  row-title">
			<span class="page-title"></span>
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
					<td class="ms-formbody" colspan="3" id="foreign_zqlb"></td>
				</tr>
				<tr>
					<td class="ms-formlabel under-line-border" width="15%">主体评级：</td>
					<td class="ms-formbody under-line-border" width="35%"><xsl:value-of select="@_x503a__x9879__x4fe1__x7528__x7e"/></td>
					<td class="ms-formlabel under-line-border" width="15%">债项评级：</td>
					<td class="ms-formbody under-line-border" width="35%" id="foreign_zxpj"></td>
				</tr>
				<tr>
					<td class="ms-formlabel">发行人：</td>
					<td class="ms-formbody" colspan="3" id="foreign_fxr"></td>
				</tr>
				<tr>
					<td class="ms-formlabel">担保人：</td>
					<td class="ms-formbody" colspan="3" id="forgien_dbr"></td>
				</tr>
				<tr>
					<td class="ms-formlabel">发行日：</td>
					<td class="ms-formbody" id="fxr"><xsl:value-of select="@_x53d1__x884c__x65e5_"/></td>
					<td class="ms-formlabel">上市日：</td>
					<td class="ms-formbody" id="ssr"><xsl:value-of select="@_x4e0a__x5e02__x65e5__x0028__x4e"/></td>
				</tr>
				<tr>
					<td class="ms-formlabel under-line-border">起息日：</td>
					<td class="ms-formbody under-line-border" id="foreign_qxr"></td>
					<td class="ms-formlabel under-line-border">到期兑付日：</td>
					<td class="ms-formbody under-line-border" id="foreign_dqdfr"></td>
				</tr>
				<tr>
					<td class="ms-formlabel text-center" colspan="4">债券多维度信息</td>
				</tr>
				<tr>
					<td class="ms-formlabel">交易所分类：</td>
					<td class="ms-formbody" id="bond_nature_jysfl"></td>
					<td class="ms-formlabel">证监会分类：</td>
					<td class="ms-formbody" id="bond_nature_zjhfl"></td>
				</tr>
				<tr>
					<td class="ms-formlabel">交易商协会分类：</td>
					<td class="ms-formbody" id="bond_nature_jysxhfl"></td>
					<td class="ms-formlabel">清算所分类：</td>
					<td class="ms-formbody" id="bond_nature_qssfl"></td>
				</tr>
				<tr>
					<td class="ms-formlabel">中债登分类一级：</td>
					<td class="ms-formbody" id="bond_nature_zzdflyj"></td>
					<td class="ms-formlabel">中债登分类二级：</td>
					<td class="ms-formbody" id="bond_nature_zzdflej"></td>
				</tr>
				<tr>
					<td>
						<button class="btn seeyii-search" id="issuing_entity"><span>查看发行主体关联方</span></button>
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