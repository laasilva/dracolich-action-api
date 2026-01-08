package dm.dracolich.api.action.controller;

import dm.dracolich.api.action.ActionService;
import dm.dracolich.api.action.request.CreateCharacterRequest;
import dm.dracolich.api.action.to.DiceEnum;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("actions")
@Tag(name = "Action")
@RequiredArgsConstructor
public class ActionController {

    private final ActionService actionService;

    @GetMapping(path = {"/dice"}, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> rollForAction(@RequestHeader("face-id") DiceEnum faceId) {
        return ResponseEntity.ok(actionService.rollForAction(faceId.name()));
    }

    @PostMapping(path = {"/character"}, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> createCharacter(@RequestBody CreateCharacterRequest request) {
        return ResponseEntity.ok((request));
    }
}
