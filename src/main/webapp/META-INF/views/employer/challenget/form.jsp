<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	
	
	<jstl:if test="${command == 'show'}">
	<acme:form-textbox code="employer.challenget.form.label.jobTitle" path="jobTitle" readonly="true"/>
	<acme:form-integer code="employer.challenget.form.label.jobId" path="jobId" readonly="true"/>
	</jstl:if>
	<acme:form-textarea code="employer.challenget.form.label.text" path="text"/>
	<acme:form-textarea code="employer.challenget.form.label.linkInfo" path="linkInfo"/>
	

	<acme:form-return code="employer.challenget.form.label.button.return"/>

</acme:form>