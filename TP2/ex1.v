(*Lemma ex1 : forall a b:Prop, a \/ (a -> b).
Proof.
intros a b.*)


Lemma ex2 : forall a b:Prop, ((a -> b) /\ ~b) -> ~a.
Proof.
intros a b H.
intro H0.
absurd b.
destruct H as [H1 H2].
exact H2.
cut a.
destruct H as [H1 H2].
exact H1.
exact H0.
Qed.

Lemma ex3 : forall A:Set, forall P Q:(A -> Prop), 
forall x:A,(forall x:A, (P x) -> (Q x)) -> ((forall x:A,(P x)) -> (exists x:A,(Q x))).
Proof.
intros A P Q X.
intros H.
intros H0.
exists X. (* is this right? *)
cut (P X).
apply H.
apply H0.
Qed.