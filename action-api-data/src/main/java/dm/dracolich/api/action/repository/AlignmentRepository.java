package dm.dracolich.api.action.repository;

import dm.dracolich.api.action.entity.AlignmentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlignmentRepository extends JpaRepository<AlignmentEntity, String> {
    Boolean existsByAlignmentName(String alignmentName);
}
