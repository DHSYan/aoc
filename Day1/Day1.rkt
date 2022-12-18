#lang racket
(require racket/port)

; (define (generate first step done? final)
; 	(if (done? first) (final first)
; 		(generate (step first) step done? final)))


; (define (read-all file)
; 	(struct state (file out))
; 	(generate
; 		;first
; 		(state file empty)
;
; 		;done?
; 		(lambda(f)
; 			(eof-object? (state-file f)))
;
; 		;step
; 		(lambda(f)
; 			(state (state-file f) (cons (list (read-line (state-file f))) (state-out f))))
;
; 		;final
; 		)
; 	)

; (define (read-all file)
; 	(define (help file acc) 	
; 		(let* ([current_line (read-line file)])
; 			(if (eof-object? file) acc
; 				(help file (cons current_line acc)))))
; 	(help file empty)
; 	)







				








(define (readlines filename)
  (call-with-input-file filename
    (lambda (p)
      (let loop ([line (read-line p)]
                 [result empty])
        (if (eof-object? line)
            (reverse result)
            (loop (read-line p) (cons line result)))))))

(define input (readlines "input.txt"))

(define (maptonumber lst)
	(define (help lst acc)
		(if (empty? lst) (reverse acc)
			(if (equal? (car lst) "") (cons (foldl + 0 (reverse acc)) (help (cdr lst) empty))
				(help (cdr lst) (cons (string->number(car lst)) acc)))))
	(help lst empty)
	)

(foldl + 0 (take (sort (maptonumber input) >) 3))

