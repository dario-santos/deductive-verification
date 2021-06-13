
type nat =
| O
| S of nat

type ('a, 'b) prod =
| Pair of 'a * 'b

type 'a sig0 = 'a
  (* singleton inductive, whose constructor was exist *)

type sumbool =
| Left
| Right

val le_lt_dec : nat -> nat -> sumbool

val euclides : nat -> nat -> (nat, nat) prod
