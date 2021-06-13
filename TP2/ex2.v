Require Import Nat.
Require Import Arith.

(* Função Somatório *)
Fixpoint somat (n:nat) : nat :=
 match n with
  | 0 => 0
  | S m => n + (somat m)
end.



(*
  Search (( _ + _) * (_ + _)).

  A + B = B + A

  (S n) + (plus (S n) m = (plus (S n) + m + (S n)
*)


Lemma dois_div :
  forall (n m:nat), (n + (div2 m)) = (div2 (n + (n + m))).
Proof.
intros.
induction n.

(* Caso Base *)
 - simpl.
   reflexivity.

(* Caso indutivo *)
 - simpl. (* tira 1 da divisão *)
   rewrite (Nat.add_comm n (S (n + m))). (* coloca sucessor na direita para poder retornar à divisão *)
   simpl.
   rewrite IHn. (* rescrever n + div2 m *)
   rewrite (Nat.add_comm n (n  + m)). (* alterar a ordem para reflexividade *)
   reflexivity.
Qed.

Lemma somat_aux :
forall (n:nat), (plus n (somat n)) = (div2 (plus n (plus n (plus n (mult n n))))).
Proof.
induction n.

(* Caso Base *)
 - simpl.
   reflexivity.

(* Caso Indutivo *)
 - simpl. (* tira 1 da divisão *)
    + rewrite <- (Nat.add_comm (S (n + S (n + S (n + n * S n)))) n). (* Remover os sucessores de dentro da divisão *)
      rewrite <- (Nat.add_comm (S (n + S (n + n * S n))) n).
      rewrite <- (Nat.add_comm (S (n + n * S n)) n).
      rewrite <- (Nat.mul_comm (S n) n).
      rewrite <- (Nat.add_comm (S n * n) n).
      simpl. (* Volta a por a divisão e retira os S *)

    * rewrite -> IHn. (* O que queremos igualar *)
      rewrite <- (Nat.add_comm (S (div2 (n + (n + (n + n * n))))) n). (* Troca para por o n dentro do S *)
      simpl.
      rewrite <- (Nat.add_comm  n (div2 (n + (n + (n + n * n))))). (* Troca para usar o dois div*)
      rewrite -> (dois_div n (n + (n + (n + n * n)))).
      rewrite <- (Nat.add_comm  (n + (n + (n + (n + n * n)))) n). (* Trocas para deixar ambos os termos iguais *)
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
 - simpl.
   reflexivity.

(* Caso Indutivo *)
 - simpl.
    + rewrite <- (Nat.mul_comm (S (S n)) n).
      rewrite <- (Nat.add_comm (S (S n) * n) n).
      simpl.

    * rewrite -> (somat_aux n).
      rewrite <- (Nat.add_comm (n + n * n) n).
      rewrite <- (Nat.add_comm (n + n * n + n) n).
      reflexivity.
Qed.
