(module

  (import "callbacks" "logAdd"      (func $log_add (param i32) (param i32) (param i32)))
  (import "callbacks" "logSubtract" (func $log_sub (param i32) (param i32) (param i32)))

  (export "add" (func $add))
  (export "subtract" (func $subtract))

  (func $add (param $a i32) (param $b i32) (result i32)
    (local $result i32)

    (local.set $result (i32.add (local.get $a) (local.get $b)))
    (call $log_add (local.get $a) (local.get $b) (local.get $result))
    (return (local.get $result))
  )

  (func $subtract (param $a i32) (param $b i32) (result i32)
    (local $result i32)

    (local.set $result (i32.sub (local.get $a) (local.get $b)))
    (call $log_sub (local.get $a) (local.get $b) (local.get $result))
    (return (local.get $result))
  )
)
