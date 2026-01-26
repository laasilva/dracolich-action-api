package dm.dracolich.api.action.repository;

import dm.dracolich.api.action.entity.RaceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RaceRepository extends JpaRepository<RaceEntity, String> {
}
