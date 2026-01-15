package dm.dracolich.api.action.domain;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CharacterClassAssignment {
    private String id;
    private CharacterClass characterClass;
    private Subclass subclass;
    private Integer level;
}