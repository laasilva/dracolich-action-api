package dm.dracolich.api.action.domain;

import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Race {
    private String id;
    private String raceName;
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
    @Builder.Default
    private Set<RaceAbilityAssignment> raceAbilities = new HashSet<>();
    private Boolean custom;
}