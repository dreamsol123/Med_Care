
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<s:hidden name="level" id="level" value="%{level}"></s:hidden>
<table border="1" width="100%" align="center" bordercolor="#e1e1e1" >
    <s:if test="dashFor=='Status'">
		    <tr>
		    <s:if test="%{filterFlag==\"C\"}">
				<td align="center" class="title"><b>&nbsp;Sub Category</b></td>
			</s:if>
		 	<s:elseif test="hodFlag">
				<td align="center" class="title"><b>&nbsp;Sub Dept</b></td>
			</s:elseif>
			<s:elseif test="mgmtFlag">
			<td align="center"  class="title"><b>&nbsp;Department</b></td>
			</s:elseif>
			<s:elseif test="normalFlag">
			<td align="center"   class="title"><b>&nbsp;Sub Dept</b></td>
			</s:elseif>
			
				<td align="center"   class="title" title="Pending"><b>&nbsp;PN</b></td>
				<td align="center"   class="title" title="High Priority"><b>&nbsp;HP</b></td>
				<td align="center"   class="title" title="Park"><b>&nbsp;PK</b></td>
				<td align="center"  class="title" title="Resolve"><b>&nbsp;RS</b></td>
				<td align="center"   class="title" title="Ignore"><b>&nbsp;IG</b></td>
				<td align="center"   class="title" title="Re-Assign"><b>&nbsp;RA</b></td>
				<td align="center"  class="title" title="Re-Open"><b>&nbsp;RO</b></td>
				<td align="center"  class="title" style="color:#004276;background:#C2C2CC "  title="All"><b>&nbsp;Total</b></td>
			</tr>
		
		<s:iterator id="rsCompl"  status="status" value="%{dashObj.dashList}" >
			
			 	<tr>
			 	    
			 	    <s:if test="#rsCompl.deptName=='Total'">
				 	<td align="left"    class="titleData" style="color:#004276;background:#C2C2CC "  ><b><s:property value="#rsCompl.deptName"/></b></td>
				 	    <td align="center"  style="color:#004276;background:#C2C2CC " class="titleData"   onclick="getData('<s:property value="#rsCompl.id"/>','Pending','T','dataFor','Level1');" title="Get Pending Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.pct"/></b></a></td>
						<td align="center"  style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','High Priority','T','dataFor','Level1');" title="Get High Priority Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.hpct"/></b></a></td>
						<td align="center"  style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','Snooze','T','dataFor','Level1');" title="Get Park Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.sct"/></b></a></td>
						<td align="center"  style="color:#004276;background:#C2C2CC " class="titleData"  onclick="getData('<s:property value="#rsCompl.id"/>','Resolved','T','dataFor','Level1');" title="Get Resolve Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.rct"/></b></a></td>
						<td align="center"  style="color:#004276;background:#C2C2CC "class="titleData"  onclick="getData('<s:property value="#rsCompl.id"/>','Ignore','T','dataFor','Level1');" title="Get Ignore Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.ignt"/></b></a></td>
						<td align="center" style="color:#004276;background:#C2C2CC "  class="titleData"  onclick="getData('<s:property value="#rsCompl.id"/>','Re-assign','T','dataFor','Level1');" title="Get Re-Assign Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.ract"/></b></a></td>
						<td align="center"  style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','Re-Opened','T','dataFor','Level1');" title="Get Re-Open Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.reopct"/></b></a></td>
				 	 	<td align="center" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','All','T','dataFor','Level1');" title="Get Re-Open Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.grand"/></b></a></td>
				 	 </s:if>
			 	    <s:else>
			 	    <td align="left"    class="titleData" style="color:#004276;background:#EAEAEA " ><b><s:property value="#rsCompl.deptName"/></b></td>
			 	    <td align="center"   class="titleData"   onclick="getData('<s:property value="#rsCompl.id"/>','Pending','T','dataFor','Level1');" title="Get Pending Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.pc"/></b></a></td>
					<td align="center"   class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','High Priority','T','dataFor','Level1');" title="Get High Priority Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.hpc"/></b></a></td>
					<td align="center"   class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','Snooze','T','dataFor','Level1');" title="Get Park Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.sc"/></b></a></td>
					<td align="center"   class="titleData"  onclick="getData('<s:property value="#rsCompl.id"/>','Resolved','T','dataFor','Level1');" title="Get Resolve Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.rc"/></b></a></td>
					<td align="center"  class="titleData"  onclick="getData('<s:property value="#rsCompl.id"/>','Ignore','T','dataFor','Level1');" title="Get Ignore Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.igc"/></b></a></td>
					<td align="center"   class="titleData"  onclick="getData('<s:property value="#rsCompl.id"/>','Re-assign','T','dataFor','Level1');" title="Get Re-Assign Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.rac"/></b></a></td>
					<td align="center"   class="titleData" onclick="getData('<s:property value="#rsCompl.id"/>','Re-Opened','T','dataFor','Level1');" title="Get Re-Open Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.reopc"/></b></a></td>
					<td align="center"   style="color:#004276;background:#C2C2CC " class="titleData"   onclick="getData('<s:property value="#rsCompl.id"/>','All','T','dataFor','Level1');" title="Get Pending Data"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl.ht"/></b></a></td>
			 	    </s:else>
			 	    
			 	</tr>
		 	
		</s:iterator>
</s:if>
<s:elseif test="dashFor=='level'">
 <tr>
		<td align="center" width="38%" class="title"><b>&nbsp; Level</b></td>
		<td align="center" width="14%" class="title" title="Pending"><b>&nbsp;PN</b></td>
		<td align="center" width="15%" class="title" title="Re-Assign"><b>&nbsp;RA</b></td>
		<td align="center" width="14%" class="title" title="Park"><b>&nbsp;PK</b></td>
		<td align="center" width="19%" class="title" title="Resolve"><b>&nbsp;RS</b></td>
		<td align="center" width="19%" class="title" title="Ignore"><b>&nbsp;IG</b></td>
		<td align="center" width="19%" class="title" title="Re-Open"><b>&nbsp;RO</b></td>
		<td align="center" style="color:#004276;background:#C2C2CC " class="title" title="All"><b>&nbsp;Total</b></td>
	</tr>


<s:iterator id="rsCompl12"  status="status" value="%{leveldashObj.dashList}" >
	
 	<tr>
 	
 	  <s:if test="#rsCompl12.level=='Total'">
 	<td align="left" width="38%" class="titleData" style="color:#004276;background:#C2C2CC "   ><b><s:property value="#rsCompl12.level"/></b></td>  
 	   	 <td align="center" width="14%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="rsCompl12.id"/>','Pending','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.pct"/></b></a></td>
		<td align="center" width="15%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Re-Assign','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.ract"/></b></a></td>
		<td align="center" width="14%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Snooze','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.sct"/></b></a></td>
		<td align="center" width="19%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Resolved','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.rct"/></b></a></td>
		<td align="center" width="19%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Ignore','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.ignt"/></b></a></td>
		<td align="center" width="19%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Re-Opened','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.reopct"/></b></a></td>
		<td align="center" width="19%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','All','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.grand"/></b></a></td>
 	 </s:if>
	  <s:else>
	  <td align="left" width="38%" class="titleData" style="color:#004276;background:#EAEAEA "   ><b><s:property value="#rsCompl12.level"/></b></td>
 	   <td align="center" width="14%" class="titleData" onclick="getData('<s:property value="rsCompl12.id"/>','Pending','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.pc"/></b></a></td>
		<td align="center" width="15%" class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Re-Assign','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.rac"/></b></a></td>
		<td align="center" width="14%" class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Snooze','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.sc"/></b></a></td>
		<td align="center" width="19%" class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Resolved','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.rc"/></b></a></td>
		<td align="center" width="19%" class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Ignore','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.igc"/></b></a></td>
		<td align="center" width="19%" class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','Re-Opened','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.reopc"/></b></a></td>
		<td align="center" width="19%" style="color:#004276;background:#C2C2CC " class="titleData" onclick="getData('<s:property value="#rsCompl12.id"/>','All','L','dataFor','<s:property value="#rsCompl12.level"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="#rsCompl12.ht"/></b></a></td>
		</s:else>
 	</tr>
 
	</s:iterator>
</s:elseif>
<s:elseif test="dashFor=='categ'">
    <tr>
		<td align="center" width="70%" class="title"><b>&nbsp; Category</b></td>
		<td align="center" width="30%" class="title"><b>&nbsp;Counter</b></td>
	</tr>


<s:iterator id="rsCompl1dfr4245"  status="status" value="%{catgCountList}" >
	
 	<tr>
 	    <td align="left" width="70%"   class="titleData" style="color:#004276;background:#EAEAEA "><b><s:property value="%{feedback_catg}"/></b></td>
		<%-- <td align="center" width="30%"  onclick="getCategoryData('<s:property value="%{id}"/>');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="%{counter}"/></b></a></td> --%>
		<td align="center" width="30%"  onclick="getData('<s:property value="#rsCompl1dfr4245.id"/>','','C','dataFor','');"><a style="cursor: pointer;text-decoration: none;"  href="#"><b><s:property value="%{counter}"/></b></a></td>
 	</tr>
 
	</s:iterator>
</s:elseif>

</table>

</body>
</html>
