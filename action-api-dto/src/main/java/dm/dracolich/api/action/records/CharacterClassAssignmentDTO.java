package dm.dracolich.api.action.records;

public record CharacterClassAssignmentDTO(String id,
                                          CharacterClassDTO characterClass,
                                          String subclassName,
                                          Integer level) { }