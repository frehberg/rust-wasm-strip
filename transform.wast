(module
 (type $0 (func (param i32 i32) (result i32)))
 (import "env" "memory" (memory $0 17))
 (table 0 anyfunc)
 (data (i32.const 4) "0\00\10\00")
 (data (i32.const 12) "\ff\ff\ff\ff\00\00\00\00\01\00\00\00\01\00\00\00")
 (data (i32.const 28) "\ff\ff\ff\ff\00\00\00\00\01\00\00\00\ff\ff\ff\ff")
 (export "transform" (func $0))
 (func $0 (type $0) (param $var$0 i32) (param $var$1 i32) (result i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $var$0)
    )
   )
   (set_local $var$3
    (i32.const 0)
   )
   (loop $label$1
    (set_local $var$2
     (i32.add
      (get_local $var$3)
      (i32.const 1)
     )
    )
    (block $label$2
     (br_if $label$2
      (i32.ne
       (i32.load8_u
        (tee_local $var$3
         (i32.add
          (get_local $var$1)
          (get_local $var$3)
         )
        )
       )
       (i32.const 105)
      )
     )
     (i32.store8
      (get_local $var$3)
      (i32.const 111)
     )
    )
    (set_local $var$3
     (get_local $var$2)
    )
    (br_if $label$1
     (i32.lt_u
      (get_local $var$2)
      (get_local $var$0)
     )
    )
   )
  )
  (get_local $var$0)
 )
)

