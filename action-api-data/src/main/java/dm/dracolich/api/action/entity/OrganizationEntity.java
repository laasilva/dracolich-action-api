package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "organizations")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Organization {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "organization_name")
    private String organizationName;

    @Column(name = "organization_description")
    private String organizationDescription;

    @Column(name = "organization_symbol_image_url")
    private String organizationSymbolImageUrl;
}
