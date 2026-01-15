package dm.dracolich.api.action.domain;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Alignment {
    private String id;
    private String alignmentName;
    private String alignmentDescription;
}