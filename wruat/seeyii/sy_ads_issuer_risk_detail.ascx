<%@ Control Language="C#"
 Inherits="WRs.Webparts.SmartQueryWebPart.BaseLayoutControl,WRs.Webparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=cf3aa4ec30143b93"%>
<%@ Register Tagprefix="WRs" Namespace="WRs.Webparts.SmartQueryWebPart" Assembly="WRs.Webparts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=cf3aa4ec30143b93" %>
<%@ Import Namespace="WRs.Webparts.CamlQuery"  %>
<style type="text/css">
#smart-query-table{
	background-color:#EFEFEF;width:100%;
}
#smart-query-table .smart-title{
	width:10%;
	text-align:left;
	padding-left:10px;
}
#smart-query-table input[type="text"]{
	width:500px;
}
#smart-query-table .smart-submit{
	width:30%;
	text-align:right;
	padding-right:50px;
}
</style>
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
	<table id="smart-query-table">
		<tr>
			<td class="smart-title">
				<span style="vertical-align: middle; display: inline-block;">事件主体:</span>
			</td>
			<td class="smart-input">
				<WRs:QueryControl runat="server" FieldName="事件主体" id="sjzt" ShowTitle="false"/>
			</td>
			<td class="smart-submit">
				<asp:Button runat="Server" Text="查询" ID="btn1" />
				<input type="button" value="清空" OnClick="javascript:location.replace(location.href)"/>
			</td>
		</tr>
		<tr>
			<td class="smart-title">
				<span style="vertical-align: middle; display: inline-block;">发行人:</span>
			</td>
			<td class="smart-input" id="td-fxr">
				<WRs:QueryControl runat="server" FieldName="发行人" id="fxr" ShowTitle="false"/>
			</td>
		</tr>
		<tr id="smart-line2">
			<td class="smart-title">
				<span style="vertical-align: middle; display: inline-block;">事件发生时间:</span>
			</td>
			<td class="smart-input">
				<WRs:QueryControl runat="server" FieldName="事件发生时间" id="sjfssj" ShowTitle="false" />
			</td>
		</tr>
	</table>     
</div>