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
@Table(name = "attributes")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Attribute {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "attribute_name", nullable = false, unique = true)
    private String attributeName;

    @Column(name = "attribute_type")
    private AbilityType attributeType;

    @Column(name = "attribute_points")
    private Integer attributePoints; // how many points are added to the attribute
}
