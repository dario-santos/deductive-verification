Require Import Classical.

Lemma ex1 : forall a b:Prop, a \/ (a -> b).
Proof.
  intros a b.
  classical_right.
  intro H0.
  contradiction. (* temos ~a  e a *)
Qed.

Lemma ex2 : forall a b:Prop, ((a -> b) /\ ~b) -> ~a.
Proof.
  intros a b H.
  destruct H as [H1 H2].
  intro H0.
  absurd b.
  - exact H2.

  - cut a.
    exact H1. exact H0.
Qed.

Lemma ex3 : forall A:Set, forall P Q:(A -> Prop), 
forall x:A,(forall x:A, (P x) -> (Q x)) -> ((forall x:A,(P x)) -> (exists x:A,(Q x))).
Proof.
  intros A P Q X H H0.
  exists X.
  cut (P X).
  apply H. apply H0.
Qed.
