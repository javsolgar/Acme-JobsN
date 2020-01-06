
package acme.entities.derivatedjob;

import javax.persistence.Entity;

import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Derivatedjob extends DomainEntity {

	private static final long	serialVersionUID	= 1L;

	private String				text;

	private String				moreInfo;

}
