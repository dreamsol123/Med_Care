<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<html>
<head>
<s:url  id="contextz" value="/template/theme" />
<sj:head locale="en" jqueryui="true" jquerytheme="mytheme" customBasepath="%{contextz}"/>

<script type="text/javascript">
function back()
{
	CpsRotaMap();
}
function validatePrimaryExcel()
{
		$("#formmatDownload").submit();
}
$.subscribe('validateUploadForm', function(event,data)
		{
			var mystring=$(".pIds").text();
		    var fieldtype = mystring.split(",");
		    var pattern = /^\d{10}$/;
		    for(var i=0; i<fieldtype.length; i++)
		    {
		        var fieldsvalues = fieldtype[i].split("#")[0];
		        var fieldsnames = fieldtype[i].split("#")[1];
		        var colType = fieldtype[i].split("#")[2];  
		        var validationType = fieldtype[i].split("#")[3];
		        $("#"+fieldsvalues).css("background-color","");
		        errZoneformtwo.innerHTML="";
		        if(fieldsvalues!= "" )
		        {
		             if(colType=="EX"){
			             if (/\.(xls[mx]?)$/.test($("#"+fieldsvalues).val())){
			             }else{
			            errZoneformtwo.innerHTML="<div class='user_form_inputError2'>Only Excel File (.xls or .xlsx Formate </div>";
			            $("#"+fieldsvalues).css("background-color","#ff701a");  //255;165;79
			            $("#"+fieldsvalues).focus();
			            setTimeout(function(){ $("#errZoneformtwo").fadeIn(); }, 10);
			            setTimeout(function(){ $("#errZoneformtwo").fadeOut(); }, 2000);
			            event.originalEvent.options.submit = false;
			            break;
			               }
			             } 
		        }
		    }  
		    if(event.originalEvent.options.submit != false)
		    {
		    	$("#ExcelDialog").dialog('open');
		    }
		});
</script>
</head>
<body>
<div class="clear"></div>
<div class="middle-content">
<div class="list-icon">
	<div class="head">Roster Upload</div><div class="head"><img alt="" src="images/forward.png" style="margin-top:50%; float: left;"></div><div class="head">Upload</div>
</div>
<div class="clear"></div>
<div style="overflow:auto; height:150px; width: 96%; margin: 1%; border: 1px solid #e4e4e5; -webkit-border-radius: 6px; -moz-border-radius: 6px; border-radius: 6px; -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, .10); -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, .10); box-shadow: 0 1px 4px rgba(0, 0, 0, .10); padding: 1%;">

<s:form id="formone" name="formone" action="uploadexcelfile" theme="css_xhtml"   method="post" enctype="multipart/form-data" >
 
<center><div style="float:center; border-color: black; background-color: rgb(255,99,71); color: white;width: 100%; font-size: small; border: 0px solid red; border-radius: 6px;"><div id="errZoneformtwo" style="float:center; margin-left: 7px"></div></div></center>
		   <span id="complSpan" class="pIds" style="display: none; ">feedbackExcel#Excel#EX#,</span>
	     <div class="newColumn" >
			 <div class="leftColumn" >Excel:</div>
			 <div class="rightColumn">
			     <span class="needed"></span>
			     <s:file name="feedbackExcel" id="feedbackExcel" cssClass="textField"/>
			 </div>
		 </div>
		 
		  <div class="newColumn">
		   <div class="leftColumn">Download Format:</div>
		   <div class="rightColumn">
		   <a href="<%=request.getContextPath()%>/view/Over2Cloud/HelpDeskOver2Cloud/Feedback_Draft/excel_format/CPSRoster.xls" ><font color="#194d65">Download </font></a>
		   </div>
	   </div>
	   
		 <div class="clear"></div>
	                  
	    <div class="fields"  align="center">
			<ul>
				<li class="submit" style="background:none;">
					<div >
	                <sj:submit 
	                        targets="createExcel" 
	                        clearForm="true"
	                        value=" Upload " 
	                        button="true"
	                        onBeforeTopics="validateUploadForm"
	                        onCompleteTopics="beforeFirstAccordian"
	                        cssStyle="margin-left: -40px;"
				            />
				            <sj:a cssStyle="margin-left: 200px;margin-top: -45px;" button="true" href="#" onclick="resetForm('formone');">Reset</sj:a>
				            <sj:a cssStyle="margin-left: 5px;margin-top: -45px;" button="true" href="#" onclick="back();">Back</sj:a>
	               </div>
	               </li>
		     </ul>
	    </div>
	    
	    <center>
		     <sj:dialog id="ExcelDialog" autoOpen="false" closeOnEscape="true"  modal="true" title="Roster View Before Upload" width="1150" height="300" showEffect="slide" hideEffect="explode" position="['center','center']">
	                  <center><div id="createExcel"></div></center>
	         </sj:dialog>
         </center>
</s:form>
<div id="test" class="rightColumn" style="position: fixed; margin-left: 638px; margin-top:0px;">    
	   
   </div>
</div>
</div>
</body>
</html>
