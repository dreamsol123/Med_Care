<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<s:url  id="contextz" value="/template/theme" />
<sj:head locale="en" jqueryui="true" jquerytheme="mytheme" customBasepath="%{contextz}"/>
<script type="text/javascript">
$.subscribe('complete', function(event,data)
        {
          setTimeout(function(){ $("#foldeffect1").fadeIn(); }, 50);
          setTimeout(function(){ $("#foldeffect1").fadeOut(); }, 4000);
        });
</script>
<script type="text/javascript">
function pageisNotAvibale(){
$("#facilityisnotavilable").dialog('open');
}
</script>
<sj:dialog id="facilityisnotavilable" buttons="{ 'OK ':function() { },'Cancel':function() { },}"  showEffect="slide" hideEffect="explode" autoOpen="false" modal="true" title="This facility is not available in Existing Module"openTopics="openEffectDialog"closeTopics="closeEffectDialog"modal="true" width="390" height="100"/>
<div class="list-icon"><div class="clear"></div><div class="head">
Pack Configuration View</div></div>
<div class="container_block"><div style=" float:left; padding:20px 1%; width:98%;">
<div class="page_form">
<div class="clear"></div>
<div style="float: right; margin: 0 0px 10px 0;">
<input class="btn createNewBtn" value="Add New Pack" type="button" onclick="addpackConfiguration()">
<input class="btn importNewBtn" value="Import Sub Dept" type="button" onclick="pageisNotAvibale();">  
<span class="normalDropDown"> 
 </span>
 </div>
 <div style="float: left; margin: 0 0px 10px 0;">
 <div class="floatL" onmouseout="hideCVoptionMenu()" onmouseover="showCVoptionMenu()"><div class="customDropdown floatL"><select style="display: none;" name="cvid" id="cvid" class="select chzn-done">
<optgroup label="Predefined Views" class="st" style="border:none">

<option value="a" selected="selected">
All Open Leads
</option>
<option value="b" class="st">
My Leads
</option>
<option value="c" class="st">
Todays Leads
</option>
<option value="d" class="st">
Converted Leads
</option>
<option value="e" class="st">
Unread Leads
</option>
<option value="f" class="st">
My Converted Leads
</option>
<option value="g" class="st">
Mailing Labels
</option>
</optgroup><optgroup label="Recent Views" class="st" style="border:none">

<option value="h" class="st">
Recently Created Leads
</option>
<option value="i" class="st">
Recently Modified Leads
</option></optgroup></select><div style="width: 178px;" class="chzn-container chzn-container-single chzn-container-single-nosearch"><a href="javascript:void(0)" class="chzn-single" tabindex="-1"><span>All Open Leads</span><div><b></b></div></a></div></div><span id="cvIcons" class="floatL" style="display:block; padding: 9px 0px 0px 4px;"> 

 </span></div>

<span class="normalDropDown"> 

 </span>
 </div>
 <div class="clear"></div>
<div class="listviewBorder">
<div style="" class="listviewButtonLayer" id="listviewButtonLayerDiv">
<div class="pwie"><table class="lvblayerTable secContentbb" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr></tr><tr><td></td></tr><tr><td> <table class="floatL" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="pL10"> 

<input id="sendMailButton" class="button"  value="Send Mail" type="button" onclick="pageisNotAvibale();">
<input name="cvDelete" id="cvDelete" class="button" value="Edit" type="button" onclick="pageisNotAvibale();">	
<input name="cvDelete" id="cvDelete" class="button" value="Delete" type="button" onclick="pageisNotAvibale();">		
<span class="normalDropDown"><input class="dbtn" name="moreAct" id="moreAct" value="More Actions" type="button" onclick="pageisNotAvibale();"></span> 
</td></tr></tbody></table>
<img src="images/spacer_002.gif" class="refbtn"></td><td class="alignright printTitle"><a href="javascript:;"><img src="images/spacer_002.gif" class="sheetIconN" title="Sheet" border="0" height="26" width="33"></a><a href="javascript:;"><img src="images/spacer_002.gif" class="printIconN" title="Print View" border="0" height="26" width="29"></a></td>   
</tr></tbody></table></div></div>
	<s:url id="packRemoteUrl" action="PackViewUrl"/>
	<s:url id="modifyPackUrl" action="DeletePackUrl"></s:url>
    <sjg:grid
    	id="gridViewpack"
    	caption="Pack Configuration View"
    	dataType="json"
    	href="%{packRemoteUrl}"
    	pager="true"
    	navigator="true"
    	navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
    	navigatorAdd="false"
    	navigatorView="true"
    	navigatorEdit="false"
    	gridModel="gridModel"
    	editurl="%{modifyPackUrl}"
    	rowList="10,30,50,100"
    	rowNum="10"
    	viewrecords="true"
    	autowidth="true"
    	shrinkToFit="false"
    	loadonce="true"
    	multiselect="true"
    	rownumbers="true"
    >
    	<sjg:gridColumn name="id" index="id" title="ID" width="60" hidden="true" key="true"  sortable="false"/>
    	<sjg:gridColumn name="applicationcode" index="applicationcode"  width="150" title="Application Name" editable="true" edittype="text"  sortable="true"/>
    	<sjg:gridColumn name="countryIsoCode" index="countryIsoCode" width="100" title="Country" editable="true" edittype="text" sortable="true" />
    	<sjg:gridColumn name="timeperiod" index="timeperiod" title="Time Period" width="100" editable="true"  hidden="true" edittype="text" sortable="false"/>
        <sjg:gridColumn name="usercounter" index="usercounter" title="User Counter" width="60" editable="true" edittype="text"  sortable="true"/>
        <sjg:gridColumn name="period" index="period" title="Time Given" editable="true" width="100" edittype="text" sortable="true" />
    	<sjg:gridColumn name="currency" index="currency" title="Currency" editable="true" width="130" edittype="text" sortable="false"/>
        <sjg:gridColumn name="cost" index="cost" title="Cost Value" editable="true" width="150" edittype="text" sortable="true" />
    	<sjg:gridColumn name="offerFrom" index="offerFrom" title="Offer From" editable="true" width="150" edittype="text"  sortable="true"/>
    	<sjg:gridColumn name="offerTo" index="offerTo" title="Offer To" editable="true" width="150" edittype="text" sortable="false"/>
        <sjg:gridColumn name="insertTimeDate" index="Configuration Date/Time" title="Date" width="150" editable="true" edittype="text" sortable="false"/>
   </sjg:grid>
</div>
</div>
</div>
</div>

