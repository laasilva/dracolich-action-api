package dm.dracolich.api.action.service.character;

import dm.dracolich.api.action.CharacterDTO;
import dm.dracolich.api.action.records.CreateCharacterDTO;
import dm.dracolich.api.action.response.ServiceResponse;

public interface CharacterService {
    ServiceResponse<CharacterDTO> createCharacter(CreateCharacterDTO request);
}
