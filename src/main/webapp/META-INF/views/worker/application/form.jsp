<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:form>
	<acme:form-textbox code="worker.application.form.label.reference" path="reference"/>
	<jstl:if test="${command != 'create'}">
	<acme:form-moment code="worker.application.form.label.moment" path="moment"/>
	</jstl:if>
	<acme:form-textarea code="worker.application.form.label.skills" path="skills"/>
	<acme:form-textarea code="worker.application.form.label.statement" path="statement"/>
	<acme:form-textarea code="worker.application.form.label.qualifications" path="qualifications"/>
	<jstl:if test="${command == 'show' }">
	<acme:form-textbox code="worker.application.form.label.status" path="status" readonly="true"/>
	</jstl:if>
	<jstl:if test="${status != 'pending'}">
		<acme:form-textbox code="worker.application.form.label.justification" path="justification"/>
	</jstl:if>
	<jstl:if test="${param.hasChallenge=='true' }">
	<jstl:if test="${command == 'create' }">
	<h4><acme:message code="worker.application.form.label.answerCreate"/></h4>
	<acme:form-textarea code="worker.application.form.label.answer" path="answer"/>
	<acme:form-textbox code="worker.application.form.label.link" path="link"/>
	<acme:form-textbox code="worker.applicaiton.form.label.passwordCreate" path="password"/>
	</jstl:if>
	</jstl:if>
	<jstl:if test="${command=='show'}">
	<jstl:if test="${hasPassword==true }">
		<h4><acme:message code="worker.application.form.label.answerShow"/></h4>
		<acme:form-textbox code="worker.application.form.label.password" path="password"/>
		<acme:form-textarea code="worker.application.form.label.answer" path="answer"/>
		<acme:form-textbox code="worker.application.form.label.link" path="link"/>
	</jstl:if>
	<jstl:if test="${hasPassword==false && hasAnswer==true}">
		<h4><acme:message code="worker.application.form.label.answerShow"/></h4>
		<acme:form-textarea code="worker.application.form.label.asnwer" path="answer"/>
		<acme:form-textbox code="worker.application.form.label.link" path="link"/>
	</jstl:if>
	</jstl:if>
	<acme:form-submit test ="${command == 'create'}" code="worker.application.form.label.button.create" action="/worker/application/create?jobId=${param.jobId}&hasChallenge=${param.hasChallenge}"/>
	<acme:form-return code="worker.application.form.label.button.return"/>
</acme:form>