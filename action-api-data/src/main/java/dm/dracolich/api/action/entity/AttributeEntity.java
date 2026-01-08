package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents a generic attribute with a name and point value.
 * <p>
 * Attributes are used to define bonuses or modifiers provided by
 * races, classes, or equipment. They are reusable and can be
 * associated with multiple entities through join tables.
 * </p>
 */
@Entity
@Table(name = "attributes", uniqueConstraints = {
        @UniqueConstraint(columnNames = "attribute_name")
})
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttributeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "attribute_name", nullable = false, unique = true)
    private String attributeName;

    @Column(name = "attribute_type")
    private AbilityTypeEntityEnum attributeType;

    @Column(name = "attribute_points")
    private Integer attributePoints; // how many points are added to the attribute
}
