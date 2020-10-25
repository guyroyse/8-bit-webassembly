(module

  (import "callbacks" "draw" (func $draw))

  (memory $mem 4)
  (export "memory" (memory $mem))

  (export "fill" (func $fill))

  (func $fill (param $r i32) (param $g i32) (param $b i32) (param $a i32)
    (local $counter i32)
    (local $offset i32)

    (local.set $counter (i32.const 0))

    (loop $loop

      (local.set $offset (i32.rem_u (local.get $counter) (i32.const 8)))

      (if (i32.eq (local.get $offset) (i32.const 0))
        (i32.store8 (local.get $counter) (local.get $r))
      )

      (if (i32.eq (local.get $offset) (i32.const 1))
        (i32.store8 (local.get $counter) (local.get $g))
      )

      (if (i32.eq (local.get $offset) (i32.const 2))
        (i32.store8 (local.get $counter) (local.get $b))
      )

      (if (i32.eq (local.get $offset) (i32.const 3))
        (i32.store8 (local.get $counter) (local.get $a))
      )

      (if (i32.eq (local.get $offset) (i32.const 4))
        (i32.store8 (local.get $counter) (local.get $a))
      )

      (if (i32.eq (local.get $offset) (i32.const 5))
        (i32.store8 (local.get $counter) (local.get $r))
      )

      (if (i32.eq (local.get $offset) (i32.const 6))
        (i32.store8 (local.get $counter) (local.get $r))
      )

      (if (i32.eq (local.get $offset) (i32.const 7))
        (i32.store8 (local.get $counter) (local.get $g))
      )

      ;; increment the counter
      (local.set $counter (i32.add (local.get $counter) (i32.const 1)))

      ;; continue loop if counter is less then 256_000

      (br_if $loop (i32.lt_u (local.get $counter) (i32.const 256_000)))
    )

    (call $draw)
  )
)
