(module

  (import "callbacks" "draw" (func $draw))

  (memory 4)
  (export "memory" (memory 0))

  (export "fill" (func $fill))

  (func $fill (param $r i32) (param $g i32) (param $b i32) (param $a i32)
    (local $counter i32)
    (local $offset i32)

    (local.set $counter (i32.const 0))

    (block
      (loop

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

        ;; break if counter is 256000
        (br_if 1 (i32.eq (local.get $counter) (i32.const 256000)))

        ;; otherwise carry on
        (br 0)
      )
    )

    (call $draw)
  )
)
