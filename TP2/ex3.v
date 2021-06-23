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

Lemma euclides :
 forall (a b: nat), (b > 0) ->
    {par: (nat * nat) | (a = ((fst par) * b) + (snd par))
      /\ (b > (snd par))}.
Proof.
intros.
induction a.

(* Caso Base *)
   (* q = 0 /\ r = 0*)
 - split with (0, 0).
   simpl.
   split.
   reflexivity.
   apply H.


(* Caso Indutivo *)
(* Guardar informações *)
 - destruct IHa as [x p].
   destruct x as [q r]. (* Separar par x *)
   destruct p as [p1 p2]. (* Separar condições de p *)
   case (le_lt_dec b (S r)).   (* Analisar os casos de b >= r+1*)

   (* b <= S r *)
   (* q' = S q /\ r' = 0 *)
   * intro Hle.
     (* Sabemos que b = r + 1 *)
     cut (b = (S r)).
     intro HBeq.
     split with (S q, 0).
     simpl.
     split.
     rewrite <- (Nat.add_comm 0 (b + (q * b))).
     simpl.

     rewrite -> HBeq.
     simpl.
     rewrite <- (Nat.add_comm (q * (S r)) r).
     rewrite <- HBeq. (*recolocar b *)
     rewrite p1.
     simpl.
     reflexivity. (* b > r && b <= S r logo b = S r *)
     exact H.
     apply Nat.le_antisymm.
     exact Hle.
     assumption.

   (* b > S r *)
   (* q' = q /\ r' = S r *)
   * intro Hgt.
     split with (q, S r).
     simpl.
     split.
     rewrite <- (Nat.add_comm (S r) (q * b)).
     simpl.
     rewrite <- (Nat.add_comm (q * b) r).
     rewrite p1.
     simpl.
     reflexivity.
     exact Hgt.
Qed.


(* Extrair código para "euclides.ml" *)
Set Extraction Optimize.
Unset Extraction KeepSingleton.
Set Extraction AutoInline.

Require Import ExtrOcamlNatInt.


Extract Inductive sumbool => "bool" [ "true" "false" ].
Extract Inductive prod => "(*)"  [ "(,)" ].
Extract Inductive nat => int  [ "0" "succ" ].

Extract Inlined Constant le_lt_dec => "(<)".

Extraction "euclides.ml" euclides.

