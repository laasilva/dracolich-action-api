package dm.dracolich.api.action;

import dm.dracolich.api.action.domain.ActionRollout;

public interface ActionService {
    public ActionRollout rollForAction(String dice);
}
