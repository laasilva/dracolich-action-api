package dm.dracolich.api.action.repository;

import dm.dracolich.api.action.entity.CharacterClassEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CharacterClassRepository extends JpaRepository<CharacterClassEntity, String> {
    Boolean existsByClassName(String className);
}
