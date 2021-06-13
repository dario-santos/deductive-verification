Require Import Nat.
Require Import Arith.
Require Import Extraction.

Search ( _ > _).

Lemma euclides :
 forall (a b: nat), (b > 0) ->
    {par: (nat * nat) | (a = ((fst par) * b) + (snd par))
      /\ (b > (snd par))}.
Proof.
intros.
induction a.

(* Caso Base *)
  split with (0, 0).
   simpl.
   split.
   reflexivity.
   apply H.


(* Caso Indutivo *)
(* a) pair(q+1, 0) *)
 
  elim IHa.
   intro qr.
   elim qr.
   intros q r.
   simpl.
   intros.
   elim p.
   intros.
   elim (le_gt_dec b (S r)).


   (* b <= S r *)
   intro Hle.
   cut (b=(S r));
   auto with arith.
   intro Heq.
   split with (S q, 0).
   simpl.
   split; trivial.
   rewrite -> Heq.
   simpl.
   f_equal.
   rewrite <- Heq.
   rewrite <- (plus_comm 0 (r + (q * (b)))).
   rewrite <- (plus_comm ((q * (b))) r).
   simpl.
   rewrite H0.
   reflexivity.

   (* b > S r *)
   intros.
   split with (q, S r).
   simpl.
   split; trivial.
   rewrite <- (plus_comm (S r) (q * b)).
   simpl.
   f_equal.
   rewrite <- (plus_comm (q * b) r).
   rewrite H0.
   reflexivity.
Qed.