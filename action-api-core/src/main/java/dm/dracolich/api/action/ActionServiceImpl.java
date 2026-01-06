package dm.dracolich.api.action;

import dm.dracolich.api.action.domain.ActionRollout;
import dm.dracolich.forge.service.RolloutService;
import dm.dracolich.forge.to.DiceEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class ActionServiceImpl implements ActionService {
    private final RolloutService rolloutService;

    @Override
    public ActionRollout rollForAction(String dice) {
        var rollout = rolloutService.rollDice(DiceEnum.of(dice), UUID.randomUUID().toString(),
                UUID.randomUUID().toString(), 2L);

        return ActionRollout.builder().rollout(Integer.valueOf(rollout.getId()))
                .total(Integer.valueOf(rollout.getId()))
            .build();
    }
}
