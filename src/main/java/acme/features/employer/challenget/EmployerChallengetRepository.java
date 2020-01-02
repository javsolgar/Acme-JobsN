
package acme.features.employer.challenget;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.challenget.Challenget;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface EmployerChallengetRepository extends AbstractRepository {

	@Query("select d from Challenget d where job.id=?1")
	Challenget findOneByJobId(int id);

	@Query("select d from Challenget d where d.id=?1")
	Challenget findOneById(int id);

}
