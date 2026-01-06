package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents a character's personality traits and backstory.
 * <p>
 * Traits define the character's backstory, moral alignment,
 * and personality characteristics that influence roleplay.
 * </p>
 */
@Entity
@Table(name = "traits")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Traits {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @OneToOne
    @JoinColumn(name = "alignment_id")
    private Alignment alignment;

    @Column
    private String age;

    @Column
    private String height;

    @Column
    private String weight;

    @Column(name = "eye_color")
    private String eyeColor;

    @Column(name = "hair_color")
    private String hairColor;

    @Column(name = "skin_color")
    private String skinColor;

    @Column(name = "personality_traits", columnDefinition = "TEXT")
    private String personalityTraits; // character personality traits

    @Column(columnDefinition = "TEXT")
    private String ideals; // character ideals

    @Column(columnDefinition = "TEXT")
    private String flaws; // character flaws

    @Column(columnDefinition = "TEXT")
    private String bonds; // character bonds - either with players, NPCs, or locations

    @Column(columnDefinition = "TEXT")
    private String backstory; // character backstory

    @Column(columnDefinition = "TEXT")
    private String features; // physical features

    @Column(columnDefinition = "TEXT")
    private String appearance; // character appearance

    @Column(columnDefinition = "TEXT")
    private String treasure; // character treasures and personal possessions

    @Column(name = "additional_traits", columnDefinition = "TEXT")
    private String additionalTraits; // any additional traits the character has

    @Column(name = "character_reference_picture_url")
    private String characterReferencePictureUrl;
}
