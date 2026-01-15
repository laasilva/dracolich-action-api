package dm.dracolich.api.action.domain;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Skills {
    private String id;
    private Integer acrobatics;
    private Integer animalHandling;
    private Integer arcana;
    private Integer athletics;
    private Integer deception;
    private Integer history;
    private Integer insight;
    private Integer intimidation;
    private Integer investigation;
    private Integer medicine;
    private Integer nature;
    private Integer perception;
    private Integer performance;
    private Integer persuasion;
    private Integer religion;
    private Integer sleightOfHand;
    private Integer stealth;
    private Integer survival;
}