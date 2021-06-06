Require Import Nat.

(* Função Somatório *)
Fixpoint somat (n:nat) : nat :=
  match n with
  | 0 => 0
  | S m => n + (somat m)
end.

(*Lemma  somat_correct: forall (n:nat), (somat n)= (div2 (mult n (S n))).
Proof.
intros.
induction n.
trivial. (* Caso do 0 *)
Qed.*)

Lemma  dois_div :
forall (n m:nat), (n + (m/2))=((n + (n + m)) / 2).
Proof.
(* completar *)
intros.
induction n.
trivial.
Qed.

Lemma somat_aux : 
forall (n:nat),(plus n (somat n)) = (div2 (plus n (plus n (plus n (mult n n))))).
Proof.
(* completar *)
Qed.

Lemma somat_correct: forall (n:nat), (somat n) = (div2 (mult n (S n))).
Proof.
(* completar *)
Qed.
