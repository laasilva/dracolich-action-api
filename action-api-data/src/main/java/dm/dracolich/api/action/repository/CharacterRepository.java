package dm.dracolich.api.action.repository;

import dm.dracolich.api.action.entity.CharacterEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CharacterRepository extends JpaRepository<CharacterEntity, String> {
}
