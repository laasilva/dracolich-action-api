package dm.dracolich.api.action.controller;

import dm.dracolich.api.action.CharacterDTO;
import dm.dracolich.api.action.error.ErrorCodes;
import dm.dracolich.api.action.exception.ResponseException;
import dm.dracolich.api.action.mapper.CharacterMapper;
import dm.dracolich.api.action.response.DmdResponse;
import dm.dracolich.api.action.service.action.ActionService;
import dm.dracolich.api.action.records.CreateCharacterDTO;
import dm.dracolich.api.action.service.character.CharacterService;
import dm.dracolich.forge.to.DiceEnum;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static java.lang.String.format;

@RestController
@RequestMapping("actions")
@Tag(name = "Action")
@RequiredArgsConstructor
public class ActionController {

    private final ActionService actionService;
    private final CharacterService characterService;

    private final CharacterMapper mapper;

    @Operation(summary = "Roll a dice", description = "Rolls a dice based on the specified face type")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Dice rolled successfully"),
            @ApiResponse(responseCode = "400", description = "Invalid dice type",
                    content = @Content(schema = @Schema(implementation = DmdResponse.class)))
    })
    @GetMapping(path = {"/dice"}, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> rollForAction(@RequestHeader("face-id") DiceEnum faceId) {
        return ResponseEntity.ok(actionService.rollForAction(faceId.name()));
    }

    @Operation(summary = "Create a character", description = "Creates a new character with the provided data")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Character created successfully",
                    content = @Content(schema = @Schema(implementation = DmdResponse.class))),
            @ApiResponse(responseCode = "400", description = "Invalid request body",
                    content = @Content(schema = @Schema(implementation = DmdResponse.class))),
            @ApiResponse(responseCode = "422", description = "Validation errors",
                    content = @Content(schema = @Schema(implementation = DmdResponse.class))),
            @ApiResponse(responseCode = "500", description = "Internal server error",
                    content = @Content(schema = @Schema(implementation = DmdResponse.class)))
    })
    @PostMapping(path = {"/character"}, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<DmdResponse<CharacterDTO>> createCharacter(@RequestBody CreateCharacterDTO request) {
        var response = characterService.createCharacter(request);

        if(response.failure())
            throw new ResponseException(format(ErrorCodes.DMD002.getMessage(),
                    "character", request.name()), response.getErrors(), HttpStatus.UNPROCESSABLE_CONTENT);

        return new ResponseEntity<>(DmdResponse.of(response.getPayload(), HttpStatus.CREATED,
                "Character created gracefully"), HttpStatus.CREATED);
    }
}
