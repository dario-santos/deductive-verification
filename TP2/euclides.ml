
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

(** val le_lt_dec : nat -> nat -> sumbool **)

let rec le_lt_dec n m =
  match n with
  | O -> Left
  | S n0 -> (match m with
             | O -> Right
             | S m0 -> le_lt_dec n0 m0)

(** val euclides : nat -> nat -> (nat, nat) prod **)

let rec euclides a b =
  match a with
  | O -> Pair (O, O)
  | S n ->
    let Pair (q, r) = euclides n b in
    (match le_lt_dec b (S r) with
     | Left -> Pair ((S q), O)
     | Right -> Pair (q, (S r)))
