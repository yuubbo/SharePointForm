<%@ Control Language="C#"
 Inherits="WRs.Webparts.SmartQueryWebPart.BaseLayoutControl,WRs.Webparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=cf3aa4ec30143b93"%>
<%@ Register Tagprefix="WRs" Namespace="WRs.Webparts.SmartQueryWebPart" Assembly="WRs.Webparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=cf3aa4ec30143b93" %>
<%@ Import Namespace="WRs.Webparts.CamlQuery"  %>

<script runat="server">
	void Page_Init(Object sender, EventArgs e)
	{
		string fxrQuery = Request["fxr"];
		if(!this.IsPostBack && !string.IsNullOrEmpty(fxrQuery))
		{
			string script = "$().ready(function(){$('#td-fxr :text').val('"+fxrQuery+"');});";
			ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "search", script, true);
			QueryField fxr = new QueryField("发行人", false);
			this.QueryExpression = fxr.Contains(Request["fxr"]);
		}
	}
</script>
<script type="text/javascript">
	var i = location.href.indexOf('?');
	if (i > -1){
		window.history.pushState(null, null, location.href.substring(0, i));
	} else {
		window.history.pushState(null, null, location.href);
	}
</script>
<div>
	<table style="background-color:#EFEFEF;width:100%">
		<tr>
			<td style="padding-left:5px" id="td-fxr">发行人：<WRs:QueryControl runat="server" FieldName="发行人" id="txtFXR" ShowTitle="false"/></td>
			<td id="td-gxr">干系人：<WRs:QueryControl runat="server" FieldName="干系人" id="gxr" ShowTitle="false"/></td>
			<td align="right" style="padding-right:50px" id="td-submit">
				<asp:Button runat="Server" Text="查询" ID="btn1" />
				<input type="button" value="清空" OnClick="javascript:location.replace(location.href)"/>
			</td>
		</tr>
	</table>     
</div>