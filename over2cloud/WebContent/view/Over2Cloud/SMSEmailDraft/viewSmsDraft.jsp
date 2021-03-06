<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s"  uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<s:url id="viewGridSmsData" action="ViewSmsDraftInGrid" escapeAmp="false">
<s:param name="searchField" value="%{searchField}"></s:param>
<s:param name="searchString" value="%{searchString}"></s:param>
<s:param name="searchOper" value="%{searchOper}"></s:param>
<s:param name="id" value="%{id}" />
</s:url>
<s:url id="modifyGrid" action="modifySmsDraftInGrid"/>
<sjg:grid 
		  id="gridedittable111"
          href="%{viewGridSmsData}"
          gridModel="viewsmsData"
          groupField="['module']"
          groupColumnShow="[false]"
          groupCollapse="true"
          groupText="['<b>{0}: {1}</b>']"
          navigator="true"
          navigatorAdd="false"
          navigatorView="true"
          navigatorDelete="true"
          navigatorEdit="true"
          navigatorSearch="true"
          rowList="15,20,25,30"
          rownumbers="-1"
          viewrecords="true"       
          pager="true"
          pagerButtons="true"
          pagerInput="false"   
          multiselect="false"  
          loadingText="Requesting Data..."  
          rowNum="10"
          navigatorSearchOptions="{sopt:['eq','cn']}"
          navigatorEditOptions="{height:450,width:400,reloadAfterSubmit:true, afterSubmit: function () {
									refreshRow();
	  			  }}"
		          navigatorDeleteOptions="{caption:'Inactive',msg: 'Inactive selected record(s)?',bSubmit: 'Inactive', afterSubmit: function () {
			refreshRow();
	    }}"
          editurl="%{modifyGrid}"
          shrinkToFit="false"
          autowidth="true"
          onSelectRowTopics="rowselect"
          
          >
          <s:iterator value="viewSmsDraftGrid" id="viewSmsDraftGrid" >  
		<s:if test="%{colomnName=='status'}">
				<sjg:gridColumn 
					name="%{colomnName}"
					index="%{colomnName}"
					title="%{headingName}"
					width="%{width}"
					align="%{align}"
					editable="true"
					search="%{search}"
					hidden="%{hideOrShow}"
					edittype="select"
					editoptions="{value:'Active:Active;Inactive:Inactive'}"
					/>
				
				</s:if>
				<s:else>
					<sjg:gridColumn 
					name="%{colomnName}"
					index="%{colomnName}"
					title="%{headingName}"
					width="%{width}"
					align="%{align}"
					editable="%{editable}"
					search="%{search}"
					hidden="%{hideOrShow}"
					/>
				</s:else>
		</s:iterator> 
	          
          
		
</sjg:grid>


</body>
</html>
