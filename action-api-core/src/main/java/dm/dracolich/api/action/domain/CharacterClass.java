package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.DiceTypeEnum;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CharacterClass {
    private String id;
    private String className;
    @Builder.Default
    private Set<Subclass> subclasses = new HashSet<>();
    private String background;
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
    private DiceTypeEnum hitDice;
    private Boolean custom;
}