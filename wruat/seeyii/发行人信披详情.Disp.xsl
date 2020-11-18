
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
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton1"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
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
			<td class="ms-toolbar" nowrap="nowrap">
				<table>
					<tr>
						<td class="ms-descriptiontext" nowrap="nowrap">
							<SharePoint:CreatedModifiedInfo ControlMode="Display" runat="server"/>
						</td>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton2"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="dvt_1.rowview">
		<tr>
			<td>
				<table border="0" cellspacing="0" width="100%">
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件主体</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@Title"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>发行人</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x53d1__x884c__x4eba_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件详情</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x8be6__x60c5_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件描述</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x63cf__x8ff0_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>生成日期</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x751f__x6210__x65e5__x671f_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>发行人统一社会用代码</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x53d1__x884c__x4eba__x7edf__x4e"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件主体统一社会用代码</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x4e3b__x4f53__x7e"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事项主体类型</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x9879__x4e3b__x4f53__x7c"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>网站截图url</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x7f51__x7ad9__x622a__x56fe_url"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件标识</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x6807__x8bc6_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件类型</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x7c7b__x578b_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>文书号1</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6587__x4e66__x53f7_1"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>文书号2</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6587__x4e66__x53f7_2"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>文书号3</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6587__x4e66__x53f7_3"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>涉事方1</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6d89__x4e8b__x65b9_1"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>涉事方2</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6d89__x4e8b__x65b9_2"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>涉事方3</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6d89__x4e8b__x65b9_3"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>涉事金额1（人民币元）</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6d89__x4e8b__x91d1__x989d_1_xf"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>涉事金额2（人民币元）</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6d89__x4e8b__x91d1__x989d_2_xf"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>涉事金额3（人民币元）</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6d89__x4e8b__x91d1__x989d_3_xf"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件标签1</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x6807__x7b7e_1"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件标签2</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x6807__x7b7e_2"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件标签3</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x6807__x7b7e_3"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>重要程度</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x91cd__x8981__x7a0b__x5ea6_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件来源</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x6765__x6e90_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件来源链接</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x6765__x6e90__x94"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件发生时间</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x53d1__x751f__x65"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件结束时间</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x7ed3__x675f__x65"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件发布时间</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x53d1__x5e03__x65"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>事件获取时间</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x83b7__x53d6__x65"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>关系链路</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x5173__x7cfb__x94fe__x8def_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>备用字段1</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x5907__x7528__x5b57__x6bb5_1"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>备用字段2</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x5907__x7528__x5b57__x6bb5_2"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>备用字段3</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x5907__x7528__x5b57__x6bb5_3"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>备用字段4</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x5907__x7528__x5b57__x6bb5_4"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>备用字段5</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x5907__x7528__x5b57__x6bb5_5"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>数据状态</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x662f__x5426__x6709__x6548_"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>数据创建时间</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6570__x636e__x521b__x5efa__x65"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>数据更新时间</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x6570__x636e__x66f4__x65b0__x65"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>dbid</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@dbid"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>数据指纹id</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<xsl:value-of select="@_x4e8b__x4ef6__x4e3b__x4f53_"/>
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