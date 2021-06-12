Require Import Nat.
Require Import Arith.

(* Função Somatório *)
Fixpoint somat (n:nat) : nat :=
 match n with
  | 0 => 0
  | S m => n + (somat m)
end.

Search (_ + _ = _ + _).



Lemma dois_div :
  forall (n m:nat), (plus n (div2 m)) = (div2 (plus n (plus n m))).
Proof.
(* completar *)
induction n; 
simpl; 
try reflexivity.
intros.
rewrite -> (Nat.add_comm 0 (S (plus 0 m))).
simpl.
rewrite -> (Nat.add_comm 0 (plus n0 m)).
rewrite -> H.
reflexivity.
Qed.

Lemma somat_aux :
forall (n:nat), (plus n (somat n)) = (div2 (plus n (plus n (plus n (mult n n))))).
Proof.
(* completar *)
Qed.

Lemma somat_correct: forall (n:nat), (somat n) = (div2 (mult n (S n))).
Proof.
(* completar *)

(*
intros.
induction n.
trivial. (* Caso do 0 *)
*)

intros n.
induction n as [ | k IH].
 - trivial.
 - simpl.
rewrite -> IH.

Qed.
