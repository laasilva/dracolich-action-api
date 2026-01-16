package dm.dracolich.api.action.repository;

import dm.dracolich.api.action.entity.SubclassEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubclassRepository extends JpaRepository<SubclassEntity, String> {
    Boolean existsByName(String subclassName);
}
