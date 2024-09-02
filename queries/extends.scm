;;;; Extends the Jsonnet highlighting
;; inherits: jsonnet
;; extends

;;; References - depends on locals.scm

; Make reference same color as parameter 
; (may incur performance issues on big files)
; Depends on locals.scm
((id) @parameter.reference
 (#is? @parameter.reference parameter))

((id) @function.reference
 (#is? @function.reference function))

((id) @variable.reference
 (#is? @variable.reference var))

((id) @variable.local
 (#is? @variable.reference var))

; References do not apply to static field IDs
; Workaround for `(#is-not? local)` not being supported
(fieldname (id) @field)
(fieldname (string (string_content) @field))

; But it does apply if ID in an expression
(fieldname
 ("["
  (id) @parameter.reference
  "]"
  (#is? @parameter.reference parameter)))
(fieldname
 ("["
  (id) @variable.local
  "]"
  (#is? @variable.reference var)))

;;; Linting

; Emphasize implicit plus usage
(implicit_plus
  (_ "}"? @text.danger)
  (object
    "{" @text.danger
  )
)
