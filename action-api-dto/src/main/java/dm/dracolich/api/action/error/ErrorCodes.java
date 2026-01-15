package dm.dracolich.api.action.error;

import lombok.Getter;

@Getter
public enum ErrorCodes {
    DMD001("DMD001", "Unknown issue happened."),
    DMD002("DMD002", "Error while creating %s=[{%s}]");


    private final String code;
    private final String message;

    ErrorCodes(String code, String message) {
        this.code = code;
        this.message = message;
    }
}
