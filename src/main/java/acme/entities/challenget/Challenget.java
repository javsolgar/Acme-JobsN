
package acme.entities.challenget;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.URL;

import acme.entities.jobs.Job;
import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Challenget extends DomainEntity {

	//Serialization Identify -------------------------------------------------------------------------------------------

	private static final long	serialVersionUID	= 1L;

	//	Atributes	----------------------------------------------------------------------------------------------------

	@NotBlank
	@Column(length = 1024)
	@Length(min = 1, max = 200)
	private String				text;

	@URL
	private String				linkInfo;

	@Valid
	@OneToOne
	private Job					job;


	@Transient
	public String getJobTitle() {
		return this.job.getTitle();
	}

	@Transient
	public Integer getJobId() {

		return this.job.getId();
	}
}
