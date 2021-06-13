Require Import Nat.
Require Import Arith.
Require Import Extraction.

(* 
  Referencias
   - https://www.di.ubi.pt/~desousa/2011-2012/ComFia/coq_lesson1.pdf;
   - https://www.di.uminho.pt/~jba/tmp/slides-Coq.pdf;
   - https://coq.inria.fr/V8.1/tutorial.html;
   - https://stackoverflow.com/questions/46410116/coq-how-to-prove-max-a-b-ab
*)

Search ( _ > _).

Lemma euclides :
 forall (a b: nat), (b > 0) ->
    {par: (nat * nat) | (a = ((fst par) * b) + (snd par))
      /\ (b > (snd par))}.
Proof.
intros.
induction a.

(* Caso Base *)
 - split with (0, 0).
   simpl.
   split.
   reflexivity.
   apply H.


(* Caso Indutivo *)
(* a) pair(q+1, 0) *)
 - elim IHa.
   intros x.
   elim x.
   intros q r.
   simpl.
   intro.
   elim p. (* Separar condições de p *)
   intros p1 p2.
   case (le_lt_dec b (S r)). (* Analisar os casos de b >= r+1*)

   (* b <= S r *)
   * intro Hle.
     split with (S q, 0).
     simpl.
     split.
     rewrite <- (Nat.add_comm 0 (b + (q * b))).
     rewrite <- (Nat.add_comm (q * b) b).
     simpl.
     (*Sabemos que b = r +1 *)
     cut (b = (S r)).
     intro HBeq.
     rewrite -> HBeq.
     rewrite <- (Nat.add_comm (S r) ((q * (S r)))).
     simpl.
     rewrite <- HBeq. (*recolocar b *)
     rewrite <- (Nat.add_comm (q * b) r).
     rewrite p1.
     reflexivity.
     auto with arith. (* b > r && b <= S r logo b = S r *)
     exact H.

   (* b > S r *)
   * intros.
     split with (q, S r).
     simpl.
     split.
     rewrite <- (Nat.add_comm (S r) (q * b)).
     simpl.
     rewrite <- (Nat.add_comm (q * b) r).
     rewrite p1.
     reflexivity.
     exact l.
Qed.

Extraction "euclides.ml" euclides.
