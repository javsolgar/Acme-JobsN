
package acme.features.employer.challenget;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.challenget.Challenget;
import acme.entities.roles.Employer;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Principal;
import acme.framework.services.AbstractShowService;

@Service
public class EmployerChallengetShowService implements AbstractShowService<Employer, Challenget> {

	@Autowired
	private EmployerChallengetRepository repository;


	@Override
	public boolean authorise(final Request<Challenget> request) {
		assert request != null;

		Challenget Challenget;
		Principal principal;
		int idPrincipal, id;
		boolean res;

		principal = request.getPrincipal();
		idPrincipal = principal.getAccountId();
		id = request.getModel().getInteger("jobId");
		Challenget = this.repository.findOneByJobId(id);

		res = idPrincipal == Challenget.getJob().getEmployer().getUserAccount().getId();

		return res;
	}

	@Override
	public void unbind(final Request<Challenget> request, final Challenget entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "linkInfo", "text", "jobTitle", "jobId");

	}

	@Override
	public Challenget findOne(final Request<Challenget> request) {
		assert request != null;
		Challenget result;
		int id;

		id = request.getModel().getInteger("jobId");
		result = this.repository.findOneByJobId(id);
		return result;
	}

}
