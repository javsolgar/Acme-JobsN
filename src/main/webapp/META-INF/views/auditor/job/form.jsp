<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-textbox code="authenticated.job.form.label.reference" path="reference"/>
	<acme:form-textbox code="authenticated.job.form.label.title" path="title"/>
	<acme:form-moment code="authenticated.job.form.label.deadline" path="deadline"/>
	<acme:form-money code="authenticated.job.form.label.salary" path="salary"/>
	<acme:form-money code="authenticated.job.form.label.moreInfo" path="moreInfo"/>
	<jstl:if test="${hasChallenge==true}">
	<jstl:if test="${command=='show'}">
	<h4><acme:message code="auditor.job.form.label.challengeShow"/></h4>
	</jstl:if>
	</jstl:if>
	<jstl:if test="${command=='create' }">
	<acme:message code="auditor.job.form.label.challengeCreate"/>
	</jstl:if>
	<jstl:if test="${hasChallenge==true}">
	<acme:form-textarea code="auditor.job.form.label.textChallenge" path="textChallenge"/>
	<acme:form-textbox code="auditor.job.form.label.link" path="link"/>
	</jstl:if>
	<jstl:set var="idJob" value="${id}"/>
	<jstl:set var="jobId" value="${id}"/>
	<h4><acme:menu-suboption code="authenticated.job.form.label.duties" action="/auditor/descriptor/show?jobId=${jobId}"/></h4>
  	<h4><acme:menu-suboption code="authenticated.job.form.label.auditRecords" action="/auditor/auditrecord/list?id=${idJob}"/></h4>
	<h4><acme:menu-suboption code="authenticated.job.form.label.auditRecords.create" action="/auditor/auditrecord/create?idJob=${idJob}"/></h4>



	<acme:form-return code="authenticated.job.form.label.button.return"/>
</acme:form>