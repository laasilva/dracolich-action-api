package dm.dracolich.api.action.service.character;

import dm.dracolich.api.action.CharacterDTO;
import dm.dracolich.api.action.error.ApiError;
import dm.dracolich.api.action.error.ErrorCodes;
import dm.dracolich.api.action.records.CreateCharacterDTO;
import dm.dracolich.api.action.response.ServiceResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CharacterServiceImpl implements CharacterService {
    @Override
    public ServiceResponse<CharacterDTO> createCharacter(CreateCharacterDTO request) {
        CharacterDTO character = null;

        return new ServiceResponse<>(false, null, List.of(new ApiError(ErrorCodes.DMD001)));
//        return ServiceResponse.of(character);
    }
}
