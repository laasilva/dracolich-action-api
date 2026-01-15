package dm.dracolich.api.action.exception;

import dm.dracolich.api.action.error.ApiError;
import dm.dracolich.api.action.error.ErrorCodes;
import lombok.Getter;
import org.springframework.http.HttpStatus;

import java.util.List;

@Getter
public class ResponseException extends RuntimeException {
    private final List<ApiError> errors;
    private final HttpStatus httpStatus;

    public ResponseException(String message, List<ApiError> errors, HttpStatus httpStatus) {
      super(message);
      this.errors = errors;
        this.httpStatus = httpStatus;
    }

    public ResponseException(List<ApiError> errors, HttpStatus httpStatus) {
      this.errors = errors;
        this.httpStatus = httpStatus;
    }
}
