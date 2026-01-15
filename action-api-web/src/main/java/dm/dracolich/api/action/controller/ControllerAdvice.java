package dm.dracolich.api.action.controller;

import dm.dracolich.api.action.exception.ResponseException;
import dm.dracolich.api.action.response.DmdResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ControllerAdvice {
    @ExceptionHandler(ResponseException.class)
    public ResponseEntity<DmdResponse<?>> handleResponseException(ResponseException ex) {
        return new ResponseEntity<>(new DmdResponse<>(false, null, ex.getErrors(),
                ex.getHttpStatus(), ex.getMessage()), ex.getHttpStatus());
    }
}
