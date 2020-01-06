<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	
	<jstl:set var="fm" value="${finalMode}"/>
	<jstl:set var="read" value="true"/>
	<jstl:if test="${command == 'create'}">
	<jstl:set var="read" value="false"/>
	</jstl:if>
	
	
	
	
	<acme:form-textbox code="employer.job.form.label.reference" path="reference" readonly="${read}"/>
	<acme:form-textbox code="employer.job.form.label.title" path="title" readonly="${fm}"/>
	
	<jstl:if test="${command == 'create'}">
	<acme:form-textarea code="employer.job.form.label.description" path="description"/>
	</jstl:if>
	
	<acme:form-moment code="employer.job.form.label.deadline" path="deadline" readonly="${fm}"/>
	<acme:form-money code="employer.job.form.label.salary" path="salary" readonly="${fm}"/>
	<acme:form-textbox code="employer.job.form.label.moreInfo" path="moreInfo" readonly="${fm}"/>
	<jstl:if test="${command=='create'}">
	<jstl:if test="${command=='create' || command=='update'}">
	<h4><acme:message code="employer.job.form.label.challengeCreate"/></h4>
	</jstl:if>
	<acme:form-textarea code="employer.job.form.label.textChallenge" path="textChallenge" readonly="${fm}"/>
	<acme:form-textbox code="employer.job.form.label.link" path="link" readonly="${fm}"/>
	</jstl:if>
	
	<jstl:if test="${hasChallenge==true && finalMode==true}">
	<jstl:if test="${command=='show'}">
	<h4><acme:message code="employer.job.form.label.challengeShow"/></h4>
	</jstl:if>
	<acme:form-textarea code="employer.job.form.label.textChallenge" path="textChallenge" readonly="${fm}"/>
	<acme:form-textbox code="employer.job.form.label.link" path="link" readonly="${fm}"/>
	</jstl:if>
	
	<jstl:if test="${finalMode==false}">
	<h4><acme:message code="employer.job.form.label.challengeShow"/></h4>
	<acme:form-textarea code="employer.job.form.label.textChallenge" path="textChallenge" readonly="${fm}"/>
	<acme:form-textbox code="employer.job.form.label.link" path="link" readonly="${fm}"/>
	</jstl:if>
	
	<jstl:if test="${finalMode == false && command != 'create'}">
	<acme:form-select code="employer.job.form.label.finalMode" path="finalMode">
	<acme:form-option code="employer.job.form.label.finalMode.false" value="false"/>
	<acme:form-option code="employer.job.form.label.finalMode.true" value="true"/>
	</acme:form-select>
	</jstl:if>
	
	<jstl:if test="${finalMode == true && command == 'update'}">
	<acme:form-select code="employer.job.form.label.finalMode" path="finalMode">
	<acme:form-option code="employer.job.form.label.finalMode.true" value="true"/>
	<acme:form-option code="employer.job.form.label.finalMode.false" value="false"/>
	</acme:form-select>
	</jstl:if>
	
	<jstl:if test="${finalMode == true && command == 'show'}">
	<acme:form-select code="employer.job.form.label.finalMode" path="finalMode">
	<acme:form-option code="employer.job.form.label.finalMode.true" value="true"/>
	</acme:form-select>
	</jstl:if>
	
	<jstl:set var="idJob" value="${id}"/>
	<jstl:set var="jobId" value="${id}"/>
	<jstl:if test="${command != 'create'}">
	<h4><acme:menu-suboption code="employer.job.form.label.duties" action="/employer/descriptor/show?jobId=${jobId}&fm=${fm}"/></h4>
	<jstl:if test="${finalMode == true && command == 'show'}">
  	<h4><acme:menu-suboption code="employer.job.form.label.auditRecords" action="/employer/auditrecord/list_mine?id=${idJob}"/></h4>
  	</jstl:if>
	</jstl:if>
	
	
	

	<acme:form-submit test ="${command == 'create'}" code="employer.job.form.button.create" action="/employer/job/create"/>
	
	<acme:form-submit test="${command == 'show' && finalMode == false}" code="employer.job.form.button.update" action="/employer/job/update"/>
	<acme:form-submit test="${command == 'update'}" code="employer.job.form.button.update" action="/employer/job/update"/>
	
	
	<jstl:if test="${hasApplication == false}">
	<acme:form-submit test ="${command != 'create'}" code="employer.job.form.button.delete" action="/employer/job/delete"/>
	</jstl:if>
	<acme:form-return code="employer.job.form.label.button.return"/>
</acme:form>