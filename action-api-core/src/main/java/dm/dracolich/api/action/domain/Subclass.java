package dm.dracolich.api.action.domain;

import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Subclass {
    private String id;
    private String name;
    private String description;
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
    private Boolean custom;
}