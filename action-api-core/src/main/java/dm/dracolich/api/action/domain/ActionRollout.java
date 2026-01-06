package dm.dracolich.api.action.domain;

import lombok.*;

@Data
@Getter
@Setter
@Builder
@AllArgsConstructor
public class ActionRollout {
    private Integer rollout; // dice roll result
    private Integer attributeSum; // check type of roll, only add relevant attributes
    private Integer savingThrowsSum; // check type of roll, only add relevant saving throws
    private Integer skillsSum; // check type of roll, only add relevant skills
    private Integer perception; // if perception roll
    private Integer equipment; // if attack/defense roll
    private Integer hitPoIntegers; // if attack roll
    private Integer tempHitPoIntegers; // if attack roll
    private Integer initiative; // if initiative roll
    private Integer speed; // if movement / dexterity roll
    private Integer otherBonus; // if there are any other bonuses to be applied (cantrips, spell saves and bonus actions, etc)
    private Integer total; // sum of all values
}
