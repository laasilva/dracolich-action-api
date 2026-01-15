package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.AbilityTypeEnum;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Attribute {
    private String id;
    private String attributeName;
    private AbilityTypeEnum attributeType;
    private Integer attributePoints;
}