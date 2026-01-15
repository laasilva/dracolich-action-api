package dm.dracolich.api.action.domain;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Organization {
    private String id;
    private String organizationName;
    private String organizationDescription;
    private String organizationSymbolImageUrl;
}