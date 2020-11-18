

<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
	<xsl:output method="html" indent="no"/>
	<xsl:decimal-format NaN=""/>
	<xsl:param name="dvt_apos">'</xsl:param>
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
	<script type="text/javascript" language="javascript" src="/HTML and XSL Templates/javascript/jquery.min.js"></script>
	<script type="text/javascript" language="javascript" src="/HTML and XSL Templates/javascript/jquery.SPWebServices.min.js"></script>
	<script type="text/javascript" language="javascript" src="/seeyii/resource/js/SeeyiiView_old3.js"></script>
	<link rel="stylesheet" type="text/css" href="/seeyii/resource/css/SeeyiiView.css" />
  <script type="text/javascript">
  FORMCONST = {
    _x5e72__x7cfb__x4eba__x7c7b__x57: {
      operation: "mapConstTable",
      listName: "债券常量表",
      sourceField: "_x5e38__x91cf__x7f16__x7801_",
      constCodeField: "_x5e38__x91cf__x5206__x7c7b__x7f",
      constCodeValue: "1020",
      returnField: "_x5e38__x91cf__x63cf__x8ff0_"
    },
    _x5173__x7cfb__x94fe__x8def_: {
      operation: "parseRelationLink"
    },
    foreign_xgzq: {
      operation: "mapForeignTable",
      listName: "债券基本信息",
      foreignField: "_x53d1__x884c__x4e3b__x4f53_",
      returnField: "_x503a__x5238__x7b80__x79f0_",
      infoType: "",
      rowNoLimit: true,
      baseUrl: "/seeyii/Lists/List1/Disp2.aspx"
    },
    foreign_btn:{
      operation: "addBtnHref",
      baseUrl: "/seeyii/Lists/List3/AllItems.aspx",
      query: {
        // value字段不能异步获取
        fxr: "Title"
      }
    }
  };
  </script>
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
						<td class="ms-formbody" width="35%" id="Title"><xsl:value-of select="@Title"/></td>
            <td class="ms-formlabel" width="15%">发行人社会信用码：</td>
						<td class="ms-formbody" width="35%" id="_x53d1__x884c__x4eba__x793e__x4f"><xsl:value-of select="@_x53d1__x884c__x4eba__x793e__x4f"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">干系人：</td>
						<td class="ms-formbody" id="_x5e72__x7cfb__x4eba_"><xsl:value-of select="@_x5e72__x7cfb__x4eba_"/></td>
            <td class="ms-formlabel">干系人社会信用码：</td>
						<td class="ms-formbody" id="_x5e72__x7cfb__x4eba__x793e__x4f"><xsl:value-of select="@_x5e72__x7cfb__x4eba__x793e__x4f"/></td>
					</tr>
          <tr>
						<td class="ms-formlabel">干系人类型：</td>
						<td class="ms-formbody init-hide" colspan="3" id="_x5e72__x7cfb__x4eba__x7c7b__x57"><xsl:value-of select="@_x5e72__x7cfb__x4eba__x7c7b__x57"/></td>
					</tr>
					<tr>
						<td class="ms-formlabel">持有发债主体比例：</td>
						<td class="ms-formbody" id="_x6301__x6709__x53d1__x503a__x4e"><xsl:value-of select="@_x6301__x6709__x53d1__x503a__x4e"/></td>
            <td class="ms-formlabel">发债主体持股比例：</td>
						<td class="ms-formbody" id="_x53d1__x503a__x4e3b__x4f53__x63"><xsl:value-of select="@_x53d1__x503a__x4e3b__x4f53__x63"/></td>
					</tr>
          <tr class="under-line-border">
						<td class="ms-formbody init-hide enhance-back" colspan="4" id="_x5173__x7cfb__x94fe__x8def_"><xsl:value-of select="@_x5173__x7cfb__x94fe__x8def_"/></td>
					</tr>
          <tr>
						<td class="ms-formlabel text-center" colspan="4">相关存续债券</td>
          </tr>
          <tr class="under-line-border">
						<td class="ms-formbody init-hide" colspan="4" id="foreign_xgzq"><xsl:value-of select="@Title"/></td>
					</tr>
				</table>
			</td>
		</tr>
    <tr>
			<td>
				<button class="btn seeyii-search" id="foreign_btn"><span>查看舆情</span><img src="/seeyii/images/wait.png"/></button>
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