<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%
	String userRights = session.getAttribute("userRights") == null ? "" : session.getAttribute("userRights").toString();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<s:url  id="contextz" value="/template/theme" />
<sj:head locale="en" jqueryui="true" jquerytheme="mytheme" customBasepath="%{contextz}"/>

<script type="text/javascript">
function addNew(){
	$("#data_part").html("<br><br><br><br><br><br><br><br><br><br><br><br><center><img src=images/ajax-loaderNew.gif></center>");
	$.ajax({
	    type : "post",
	    url : "view/Over2Cloud/CorporatePatientServices/cpservices/beforeBedAdd.action",
	    success : function(subdeptdata) {
       $("#"+"data_part").html(subdeptdata);
	},
	   error: function() {
            alert("error");
        }
	 });
}

function getGridView()
{
	$.ajax({
 		type :"post",
 		url :"view/Over2Cloud/CorporatePatientServices/cpservices/dataOnGridForBedType.action?status="+$("#status").val()+"&serviceID="+$("#serviceID").val(),
 		success : function(data) 
	    {
			$("#middleDiv").html(data);
		},
	    error: function()
	    {
	        alert("error viewLinsence");
	    }
 	}); 	
}
//getGridView();

	loadBedTypeData();
	function loadBedTypeData()
	{

		var searchParameter=$("#wildSearch").val();
		//alert("value of wild search..."+searchParameter);
		$.ajax({
		    type : "post",
		    url : "view/Over2Cloud/CorporatePatientServices/cpservices/dataOnGridForBedType.action?status="+$("#status").val()+"&wildSearch="+searchParameter,
		    success : function(subdeptdata) {
	       $("#"+"result_part").html(subdeptdata);
		},
		   error: function() {
	            alert("error");
	        }
		 });
	}
 

	
</script>
<script type="text/javascript">
var row=0;
$.subscribe('rowselect', function(event, data) {
	row = event.originalEvent.id;
});	
function editRow()
{
	if(row==0)
	{
		alert("Please select atleast one row to edit.");
	}
	else
	{
		//jQuery("#gridedittable").jqGrid('editGridRow', row ,{height:180, width:425,reloadAfterSubmit:false,closeAfterEdit:true,top:0,left:350,modal:true , afterSubmit: function () {
			
	    //}});
		jQuery("#gridedittable").jqGrid('editGridRow', row ,{reloadAfterSubmit:false,closeAfterEdit:true,top:0,left:350,modal:true});
		reloadPage();
	}
}


function deleteRow()
{
	  var status = jQuery("#gridedittable").jqGrid('getCell',row,'flag');
	if(row==0)
	{
		alert("Please select atleast one row to Inactive.");
	}
	else if(status=='Inactive')
	{
		alert("The selected data is already Inactive.");
	}
	else
	{
		$("#gridedittable").jqGrid('delGridRow',row, {height:120,reloadAfterSubmit:true,top:0,left:350,modal:true});
		reloadPage();
	}	
}
function searchRow()
{
	 $("#gridedittable").jqGrid('searchGrid',row, {height:120,reloadAfterSubmit:true,top:0,left:350,modal:true});
}
 
function reloadPage()
{
var grid = $("#gridedittable");
grid.trigger("reloadGrid",[{current:true}]);
}

</script>
</head>

<body>
<div class="clear"></div>
<div class="middle-content">

<div class="list-icon">
	 <div class="head">Bed Type View</div><div class="head"><img alt="" src="images/forward.png" style="margin-top:50%; float: left;"></div><div class="head"><s:iterator value="totalCount">
	
</s:iterator>
</div> 
</div> 

<!-- Code For Header Strip -->
<div class="clear"></div>
<div class="listviewBorder" style="margin-top: 10px;width: 97%;margin-left: 20px;" align="center">

<div style="" class="listviewButtonLayer" id="listviewButtonLayerDiv">
<div class="pwie">
	<table class="lvblayerTable secContentbb" border="0" cellpadding="0" cellspacing="0" width="100%">
		<tbody>
			<tr>
				  <!-- Block for insert Left Hand Side Button -->
				  <td>
					  <table class="floatL" border="0" cellpadding="0" cellspacing="0">
					    <tbody><tr>
					 <td class="pL10">
					 <sj:a id="editButton" title="Edit"  buttonIcon="ui-icon-pencil" cssClass="button" cssStyle="height:25px; width:32px" button="true" onclick="editRow()"></sj:a>
   	  <sj:a id="delButton" title="Deactivate" buttonIcon="ui-icon-trash" cssClass="button" cssStyle="height:25px; width:32px" button="true"  onclick="deleteRow()"></sj:a>
 	<sj:a id="searchButton" title="Search" buttonIcon="ui-icon-search" cssClass="button" cssStyle="height:25px; width:32px" button="true"  onclick="searchRow()"></sj:a>
	<sj:a id="refButton" title="Refresh" buttonIcon="ui-icon-refresh" cssClass="button" cssStyle="height:25px; width:32px" button="true"  onclick="reloadPage()"></sj:a>
	<s:select  
	id="status"
	name="status"
	list="#{'-1':'All','Active':'Active','Inactive':'Inactive'}"
	cssClass="button"
	cssStyle="margin-top: -29px;margin-left:3px"
	theme="simple"
	onchange="loadBedTypeData();"
	/>
					    </td></tr>
					    </tbody>
					  </table>
				  </td>
				  <td class="alignright printTitle">
				    <sj:a button="true" cssClass="button" cssStyle="height:25px;"  title="Add"  buttonIcon="ui-icon-plus" onclick="addNew();">Add</sj:a>
				  </td>
			</tr>
		</tbody>
	</table>
</div>
</div>
<!-- Code End for Header Strip -->

 <div id="result_part"></div>
 </div>
 </div>
</body>

<script type="text/javascript">
</script>
</html>