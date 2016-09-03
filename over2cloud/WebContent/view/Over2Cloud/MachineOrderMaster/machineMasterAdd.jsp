<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<style type="text/css">
.user_form_input {
	margin-bottom: 10px;
}
</style>
<html>
<head>
<s:url id="contextz" value="/template/theme" />
<sj:head locale="en" jqueryui="true" jquerytheme="mytheme"
	customBasepath="%{contextz}" />
<script type="text/javascript" src="<s:url value="/js/common/commonvalidation.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/showhide.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/helpdesk/fbdraft.js"/>"></script>
<SCRIPT type="text/javascript">
/* $(document).ready(function(){
    $("#form_reg").click(function(){
    	 getmachineName('machine');
    });
});
 */ 
$.subscribe('getNames', function(event,data)
		{
			 getmachineName('machine');
		});


$.subscribe('level', function(event,data)
		{
			
			 setTimeout(function(){ $("#resultDiv").fadeIn(); }, 10);
			 setTimeout(function(){ $("#resultDiv").fadeOut();
			// cancelButton();
			 },4000);
			 reset('formone');
			 getmachineName('machine');
		});
		
		function cancelButton()
		{
			$('#completionResult').dialog('close');
			viewmainkeyword();
		}
		
	$.subscribe('level1', function(event, data) {
		setTimeout( function() {
			$("#resultDiv2").fadeIn();
		}, 10);
		setTimeout( function() {
			$("#resultDiv2").fadeOut();
		}, 4000);
		 reset('formtwo');
		//$('select').find('option:first').attr('selected', 'selected');
	});

	function viewmainkeyword()
	{
		$("#data_part").html("<br><br><center><img src=images/ajax-loaderNew.gif style='margin-top: 15%;'></center>");
		$.ajax({
		    type : "post",
		    url : "view/Over2Cloud/MachineOrder/machineMasterHeader.action",
		    success : function(subdeptdata) {
	       $("#"+"data_part").html(subdeptdata);
		},
		   error: function() {
	            alert("error");
	        }
		 });
	}

function getmachineName(targetid){
	//alert("hii");
	$.ajax({
		type :"post",
		url :"view/Over2Cloud/MachineOrder/getAllMachineNames.action",
		success : function(empData){
		$('#'+targetid+' option').remove();
		$('#'+targetid).append($("<option></option>").attr("value",-1).text("--select Name--"));
    	$(empData).each(function(index)
		{
		   $('#'+targetid).append($("<option></option>").attr("value",this.machinename).text(this.machinename));
		});
	    },
	    error : function () {
			alert("Somthing is wrong to get Data");
		}
	});
}
getmachineName('machine');

	function reset(formId) {
		  $("#"+formId).trigger("reset"); 
		}
	
	
	function getKeyAvailabilty(data)
	{
	    var conP = "<%=request.getContextPath()%>";
	    
	    if(data!="")
	    {
	         document.getElementById("indicator2").style.display="block";
	         $.getJSON(conP+"/view/Over2Cloud/Text2Mail/checkmainKeyword.action?mainKeywordChk="+data,
	            function(checkMainKey){
	                 $("#userStatus").html(checkMainKey.msg);
	                 document.getElementById("indicator2").style.display="none";
	                    
	        });
	    }
	    
	}
</script>

</head>
<sj:dialog
          id="completionResult"
          showEffect="slide" 
    	  hideEffect="explode" 
    	  openTopics="openEffectDialog"
    	  closeTopics="closeEffectDialog"
          autoOpen="false"
          title="Confirmation Message"
          cssStyle="overflow:hidden;text-align:center;margin-top:10px;"
          modal="true"
          width="400"
          height="150"
          draggable="true"
    	  resizable="true"
    	   buttons="{ 
    		'Close':function() { cancelButton(); } 
    		}" 
          >
          <div id="result"></div>
</sj:dialog>
<body>
	<div class="list-icon">
<div class="head">Machine Add</div><div class="head"><img alt="" src="images/forward.png" style="margin-top:50%; float: left;"></div><div class="head">Add</div>
</div>
	
	<div class="container_block">
		<div style="float: left; padding: 20px 1%; width: 98%;">
			<div class="border">
			<sj:accordion id="accordion" autoHeight="false" >
			<sj:accordionItem title="Machine" id="acor_item1" >
					<div class="form_inner" id="form_reg" style="margin-top: 10px;">
						<s:form id="formone" name="formone" namespace="/view/Over2Cloud/MachineOrder" action="addMachineName" theme="simple" method="post" enctype="multipart/form-data">
							<div style="float: left; border-color: black; background-color: rgb(255, 99, 71); color: white; width: 100%; font-size: small; border: 0px solid red; border-radius: 6px;">
								<div id="errZone" style="float: left; margin-left: 7px"></div>
							</div>
							<br/>
							
							<s:iterator value="configKeyTextBox4Machine" status="counter">
								<s:if test="%{mandatory}">
	                      			<span id="mandatoryFields" class="pIds" style="display: none;"><s:property value="%{key}" />#<s:property value="%{value}" />#<s:property value="%{colType}" />#<s:property value="%{validationType}" />,</span>
	                 			</s:if>
	                 			
	                 			<s:if test="#counter.odd">
	                 				<div class="newColumn">
	                 					<div class="leftColumn1"><s:property value="%{value}"/>:</div>
	                 					<div class="rightColumn1">
	                 						<s:if test="%{mandatory}"><span class="needed"></span>
		                 					</s:if>
	   										<s:textfield name="%{key}"  id="%{key}"  cssClass="textField" placeholder="Enter Data" cssStyle="margin:0px 0px 10px 0px;" />
                      						
										</div>
	                 				</div>
	                 			</s:if>
	                 			<s:else>
	                 				<div class="newColumn">
		                 				<div class="leftColumn1"><s:property value="%{value}" />:</div>
										<div class="rightColumn1">
										<s:if test="%{mandatory}">
	                 						<span class="needed"></span>
	                 					</s:if>
											<s:textfield name="%{key}" id="%{key}" cssClass="textField" placeholder="Enter Data" cssStyle="margin:0px 0px 10px 0px;" />
										</div>
									</div>
	                 			</s:else>
	                 			
							</s:iterator>
							
							<div class="clear"></div>
   							<div class="fields">
							<div style="width: 100%; text-align: center; padding-bottom: 10px;">
								<sj:submit 
								     targets="result1" 
								     clearForm="true"
								     value="  Save  " 
								     effect="highlight"
								     effectOptions="{ color : '#222222'}"
								     effectDuration="100"
								     button="true"
								    	
								    	onCompleteTopics="level"
								     cssClass="submit"
							     />
							   	<sj:a 
							 button="true" href="#"
							 onclick="reset('formone');"
							 cssClass="submit"
						>
						
						Reset
					</sj:a>
					<sj:a 
							button="true" href="#"
							onclick="viewmainkeyword();"
							cssClass="submit"
						>
						
						Back
					</sj:a>
							</div>
						</div>
						<div class="clear"></div>
						<sj:div id="resultDiv1"  effect="fold">
		                    <div id="result1"></div>
		                </sj:div>
						</s:form>
					</div>
					
					</sj:accordionItem>
					
					<sj:accordionItem title="Serial No." id="acor_item2" >
					<div class="form_inner" id="form_reg" style="margin-top: 10px;">
						<s:form id="formtwo" name="formtwo" namespace="/view/Over2Cloud/MachineOrder" action="addMachineMaster" theme="simple" method="post" enctype="multipart/form-data">
							<div style="float: left; border-color: black; background-color: rgb(255, 99, 71); color: white; width: 100%; font-size: small; border: 0px solid red; border-radius: 6px;">
								<div id="errZone" style="float: left; margin-left: 7px"></div>
							</div>
							<br/>
							
							<s:iterator value="configKeyTextBox" status="counter">
								<s:if test="%{mandatory}">
	                      			<span id="mandatoryFields" class="pIds" style="display: none;"><s:property value="%{key}" />#<s:property value="%{value}" />#<s:property value="%{colType}" />#<s:property value="%{validationType}" />,</span>
	                 			</s:if>
	                 			
	                 			<s:if test="#counter.odd">
	                 				<div class="newColumn">
	                 					<div class="leftColumn1"><s:property value="%{value}"/>:</div>
	                 					<div class="rightColumn1">
	                 						<s:if test="%{mandatory}"><span class="needed"></span>
		                 					</s:if><s:if test="%{key == 'machine'}">
											<s:select name="%{key}" id="%{key}"  list="{'No data'}" cssClass="textField" placeholder="Enter Data" cssStyle="margin:0px 0px 10px 0px;" />
										</s:if>
										<s:else>
											<s:textfield name="%{key}" id="%{key}" cssClass="textField" placeholder="Enter Data" cssStyle="margin:0px 0px 10px 0px;" />
										</s:else>
										</div>
	                 				</div>
	                 			</s:if>
	                 			<s:else>
	                 				<div class="newColumn">
		                 				<div class="leftColumn1"><s:property value="%{value}" />:</div>
										<div class="rightColumn1">
										<s:if test="%{mandatory}">
	                 						<span class="needed"></span>
	                 					</s:if>
										<s:if test="%{key == 'machine'}">
											<s:select name="%{key}" id="%{key}"  list="{'No data'}" cssClass="textField" placeholder="Enter Data" cssStyle="margin:0px 0px 10px 0px;" />
										</s:if>
										<s:else>
											<s:textfield name="%{key}" id="%{key}" cssClass="textField" placeholder="Enter Data" cssStyle="margin:0px 0px 10px 0px;" />
										</s:else>
										</div>
									</div>
	                 			</s:else>
	                 			
							</s:iterator>
							
							
							
							<div class="clear"></div>
   							<div class="fields">
							<div style="width: 100%; text-align: center; padding-bottom: 10px;">
								<sj:submit 
								     targets="result2" 
								     clearForm="true"
								     value="  Save  " 
								     effect="highlight"
								     effectOptions="{ color : '#222222'}"
								     effectDuration="100"
								     button="true"
								     cssClass="submit"
									onBeforeTopics="validateFirst"	
									onCompleteTopics="level1"
							     />
							   	<sj:a 
							 button="true" href="#"
							 onclick="reset('formone');"
							 cssClass="submit"
						>
						
						Reset
					</sj:a>
					<sj:a 
							button="true" href="#"
							onclick="viewmainkeyword();"
							cssClass="submit"
						>
						
						Back
					</sj:a>
							</div>
						</div>
						<div class="clear"></div>
						<sj:div id="resultDiv2"  effect="fold">
		                    <div id="result2"></div>
		                </sj:div>
						</s:form>
					</div>
					
					</sj:accordionItem>
					</sj:accordion>
					
					
			</div>
		</div>
	</div>
</body>
</html>
