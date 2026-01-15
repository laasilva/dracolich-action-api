package dm.dracolich.api.action.mapper;

import dm.dracolich.api.action.CharacterDTO;
import dm.dracolich.api.action.domain.Character;
import dm.dracolich.api.action.entity.CharacterEntity;
import dm.dracolich.api.action.records.CreateCharacterDTO;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.FIELD)
public interface CharacterMapper {
    Character dtoToDomain(CharacterDTO dto);
    Character requestToDomain(CreateCharacterDTO request);
    Character entityToDomain(CharacterEntity entity);
    CharacterDTO domainToDto(Character character);
}
