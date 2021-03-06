<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<html>
<head>
<script type="text/javascript" src="<s:url value="/js/confirmsmspages.js"/>">
</script>
<SCRIPT type="text/javascript">

$.subscribe('rowselect', function(event,data) {
    $("#gridinfo").html('<p>Edit Mode for Row : '+event.originalEvent.id+'</p>');
});
$.subscribe('oneditsuccess', function(event, data){
	var message = event.originalEvent.response.statusText;
	$("#gridinfo").html('<p>Status: ' + message + '</p>');
});
$.subscribe('rowadd', function(event,data) {
    $("#gridedittable").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:false});
	});
$.subscribe('searchgrid', function(event,data) {
    $("#gridedittable").jqGrid('searchGrid', {sopt:['cn','bw','eq','ne','lt','gt','ew']} );
	});
$.subscribe('showcolumns', function(event,data) {
    $("#gridedittable").jqGrid('setColumns',{});
	});
</SCRIPT>
<script type="text/javascript">
function okSendsmsButton(){
	alert("*********************");
	validsel_id = $("#gridedittable").jqGrid('getGridParam','selarrrow');
	duplicatesel_id = $("#duplicategridedittable").jqGrid('getGridParam','selarrrow');
	alert("validsel_id"+validsel_id);
	alert("duplicatesel_id"+duplicatesel_id);
	if(validsel_id!=null && validsel_id!=""){
	
	urls ='view/Over2Cloud/CommunicationOver2Cloud/mail/getViaAjaxinstantSendMsg?select_id='+validsel_id+"&duplicatesel_id="+duplicatesel_id;
	 $.ajax({
	    type : 'post',
	    url :urls ,
	    success : function(saveData) {
	 $("#excelValidUploadResult").html(saveData);
	 $("#excelValidUploadResult").fadeIn(3000);
	 $("#excelValidUploadResult").fadeOut(3000);
	},
	   error: function() {
	        alert("error");
	    }
	 });
	}
}
</script>
</head>
<body>
<sj:accordion id="accordion" autoHeight="false">
<sj:accordionItem title="Valid Data" id="oneId"> 
 <s:url id="ShowConfirmSMS_URL" action="showSMSConfirmExceldata"/>
    <div id="excelValidUploadResult">
    <sjg:grid
    	id="gridedittable"
    	caption="Valid Mail Confirmation "
    	dataType="json"
    	href="%{ShowConfirmSMS_URL}"
    	pager="true"
    	navigator="false"
    	gridModel="gridsmsvdataList"
    	rowList="10,15,20,50,75,100,200,500,800,1000,1200,1500"
    	rowNum="15"
    	multiselect="true"
    	onSelectRowTopics="rowselect"
    	viewrecords="true"
    	width="850"
    	shrinkToFit="true"
    >
          <sjg:gridColumn name="id" index="id" title="id" align="center" search="false" width="20"/>
    	  <sjg:gridColumn name="client_name" index="client_name" title="Person Name" align="center"  width="90" editable="true" hidden="true"/>
    	  <sjg:gridColumn name="subject" index="subject" title="Subject " align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="contactEmail" index="contactEmail" title="Email" align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="msg" index="msg" title="Mesage" align="center"  width="120" />
          <sjg:gridColumn name="date" index="date" title=" Date" align="center" width="60"  editable="true" hidden="false"/>
          <sjg:gridColumn name="time" index="time" title=" Time" align="center" width="60"   editable="true" hidden="false"/>
    </sjg:grid>
    </div>
      </sj:accordionItem>
      <sj:accordionItem title="Duplicate Data" id="twoId">
       <div id="excelDuplicateUploadResult">
      <sjg:grid
    	id="duplicategridedittable"
    	caption="Duplicate Mail Cinfirmation page"
    	dataType="json"
    	href="%{ShowConfirmSMS_URL}"
    	pager="true"
    	navigator="false"
    	gridModel="gridsmsdudataList"
    	rowList="10,15,20,50,75,100,200,500,800,1000,1200,1500"
    	rowNum="15"
    	multiselect="true"
    	onSelectRowTopics="rowselect"
    	viewrecords="true"
    	width="850"
    	shrinkToFit="true"
    >
          <sjg:gridColumn name="id" index="id" title="id" align="center" search="false" width="20"/>
    	  <sjg:gridColumn name="client_name" index="client_name" title="Person Name" align="center"  width="90" editable="true" hidden="true"/>
    	  <sjg:gridColumn name="subject" index="subject" title="Subject " align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="contactEmail" index="contactEmail" title="Email" align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="msg" index="msg" title="Mesage" align="center"  width="120" />
          <sjg:gridColumn name="date" index="date" title=" Date" align="center" width="60"  editable="true" hidden="false"/>
          <sjg:gridColumn name="time" index="time" title=" Time" align="center" width="60"   editable="true" hidden="false"/>
    </sjg:grid>
    </div>
      </sj:accordionItem>
      
      	<sj:accordionItem title="Invalid Data" id="threeId">
      	<sjg:grid
    	id="invalidgridedittable"
    	caption="Invalid  Mail Confirmation Pages"
    	dataType="json"
    	href="%{ShowConfirmSMS_URL}"
    	pager="true"
    	navigator="false"
    	gridModel="gridsmsinvdataList"
    	rowList="10,15,20,50,75,100,200,500,800,1000,1200,1500"
    	rowNum="15"
    	multiselect="true"
    	onSelectRowTopics="rowselect"
    	viewrecords="true"
    	width="850"
    	shrinkToFit="true"
    >
          <sjg:gridColumn name="id" index="id" title="id" align="center" search="false" width="20"/>
    	  <sjg:gridColumn name="client_name" index="client_name" title="Person Name" align="center"  width="90" editable="true" hidden="true"/>
          <sjg:gridColumn name="subject" index="subject" title="Subject " align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="contactEmail" index="contactEmail" title="Email" align="center"  width="80" editable="true"/>
          
          <sjg:gridColumn name="msg" index="msg" title="Mesage" align="center"  width="120" />
          <sjg:gridColumn name="date" index="date" title=" Date" align="center" width="60"  editable="true" hidden="false"/>
          <sjg:gridColumn name="time" index="time" title=" Time" align="center" width="60"   editable="true" hidden="false"/>
    </sjg:grid>
      	</sj:accordionItem>
      <sj:accordionItem title="BlackList Data" id="fourId">
      <sjg:grid
    	id="balcklistgridedittable"
    	caption="Blacklist  Mail Confirmation Page"
    	dataType="json"
    	href="%{ShowConfirmSMS_URL}"
    	pager="true"
    	navigator="false"
    	gridModel="gridsmsbdataList"
    	rowList="10,15,20,50,75,100,200,500,800,1000,1200,1500"
    	rowNum="15"
    	onSelectRowTopics="rowselect"
    	viewrecords="true"
    	width="850"
    	shrinkToFit="true"
    >
          <sjg:gridColumn name="id" index="id" title="id" align="center" search="false" width="20" />
    	  <sjg:gridColumn name="client_name" index="client_name" title="Person Name" align="center"  width="90" editable="true" hidden="true"/>
          <sjg:gridColumn name="subject" index="subject" title="Subject " align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="contactEmail" index="contactEmail" title="Email" align="center"  width="80" editable="true"/>
          <sjg:gridColumn name="msg" index="msg" title="Mesage" align="center"  width="120" />
          <sjg:gridColumn name="date" index="date" title=" Date" align="center" width="60"  editable="true" hidden="false"/>
          <sjg:gridColumn name="time" index="time" title=" Time" align="center" width="60"   editable="true" hidden="false"/>
    </sjg:grid>
      </sj:accordionItem>
      </sj:accordion>
 
	<s:form  id="xlsfiledatass"  name="xlsfiledatass"
															method="get"  theme="css_xhtml" method="get">
    
    <s:if test="%{#parameters.scheduleLink}">
         <div class="form_menubox">
        <div class="user_form_text">Scheduler:</div>
        <input
			type="radio" value="Onetimes" name="options1" onClick="validateClickforconfirm(this.value);" tabindex="1" checked>
		<label>One Time&nbsp;&nbsp;</label> <font face="Verdana"> <input
			type="radio" value="Daily" name="options1" id="options1" onClick="validateClickforconfirm(this.value);" tabindex="2"></font><label>
		Daily&nbsp;&nbsp; &nbsp;<font face="Verdana"><input
			type="radio" value="Weekly" name="options1" id="options1" onClick="validateClickforconfirm(this.value);" tabindex="3"
			class="selectcell"></font> Weekly&nbsp; <font face="Verdana">
		<input type="radio" value="days" name="options1" id="options1" onClick="validateClickforconfirm(this.value);" tabindex="4"></font>
		Monthly&nbsp;&nbsp; <font face="Verdana"> 
		<input type="radio"
			value="Yearly" name="options1" id="options1" onClick="validateClickforconfirm(this.value);" tabindex="5">
			</font> Yearly&nbsp; <b></b>
       </div>   
        <div class="form_menubox">
            <div class="user_form_text">Day & Time:</div>
        	<div class="user_form_input"><sj:datepicker id="dates"  displayFormat="dd/mm/yy"/></div>
		  <select size="1" name="month1">
		</select> &nbsp;Day<select size="1" name="days" id="days" disabled>
			<option value="0">Sunday</option>
			<option value="1">Monday</option>
			<option value="2">Tuesday</option>
			<option value="3">Wednesday</option>
			<option value="4">Thursday</option>
			<option value="5">Friday</option>
			<option value="6">Saturday</option>
		</select>
		
		 <div class="user_form_input"><sj:datepicker id="hourss" name="hourss"  value="%{new java.util.Date()}" timepicker="true" timepickerOnly="true"/>
		 </div>
 </div>
    
    </s:if>
    </s:form>
    
	 
</body>