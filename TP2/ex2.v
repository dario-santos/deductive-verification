Require Import Nat.
Require Import Arith.

(* Função Somatório *)
Fixpoint somat (n:nat) : nat :=
 match n with
  | 0 => 0
  | S m => n + (somat m)
end.

Search (( _ + _) * (_ + _)).


(* 

  A + B = B + A
 
(S n) + (plus (S n) m = (plus (S n) + m + (S n)

*)


Lemma dois_div :
  forall (n m:nat), (n + (div2 m)) = (div2 (n + (n + m))).
Proof.
intros.
induction n.
simpl.

(* Caso Base *)
reflexivity.

(* Caso indutivo *)
rewrite (Nat.add_comm (S n) ((S n) + m)).
simpl.
rewrite (Nat.add_comm (n + m) (S n)).
simpl.
rewrite IHn.
reflexivity.
Qed.

Lemma somat_aux :
forall (n:nat), (plus n (somat n)) = (div2 (plus n (plus n (plus n (mult n n))))).
Proof.
(* completar *)
induction n.

(* Caso Base *)
simpl.
reflexivity.

(* Caso Indutivo *)
simpl.
rewrite <- (Nat.add_comm (mul n (S n)) n).
rewrite <- (Nat.mul_comm (S n) n).
rewrite <- (Nat.add_comm (S (n + S (n + S (S n * n + n)))) n).
rewrite <- (Nat.add_comm (S (S n * n + n)) n).
rewrite <- (Nat.add_comm (S (S (S n * n + n) + n)) n).
simpl.

rewrite -> IHn.
rewrite <- (Nat.add_comm (S (div2 (n + (n + (n + n * n))))) n).
simpl.
rewrite <- (Nat.add_comm  n (div2 (n + (n + (n + n * n))))).
rewrite -> (dois_div n (n + (n + (n + n * n)))).
rewrite <- (Nat.add_comm  (n + (n + (n + (n + n * n)))) n).
rewrite <- (Nat.add_comm  (n + (n + (n + n * n))) n).
rewrite <- (Nat.add_comm  (n + n * n) n). 
rewrite <- (Nat.add_comm  (n + n * n + n) n).
reflexivity.
Qed.

Lemma somat_correct: forall (n:nat), (somat n) = (div2 (mult n (S n))).
Proof.
(* Caso Base *)
intros.
induction n.
simpl.
reflexivity.

(* Caso Indutivo *)
simpl.
rewrite -> (somat_aux n).
rewrite <- (Nat.mul_comm (S (S n)) n).
rewrite <- (Nat.add_comm (S (S n) * n) n).
simpl.
rewrite <- (Nat.add_comm (n + n * n) n).
rewrite <- (Nat.add_comm (n + n * n + n) n).
reflexivity.
Qed.
