package dm.dracolich.api.action.domain;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Traits {
    private String id;
    private Integer age;
    private Double height;
    private Double weight;
    private String eyeColor;
    private String hairColor;
    private String skinColor;
    private String personalityTraits;
    private String ideals;
    private String flaws;
    private String bonds;
    private String backstory;
    private String features;
    private String appearance;
    private String treasure;
    private String additionalTraits;
    private String characterReferencePictureUrl;
}