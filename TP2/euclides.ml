
type 'a sig0 = 'a
  (* singleton inductive, whose constructor was exist *)



(** val euclides : int -> int -> (int*int) **)

let rec euclides a b =
  (fun fO fS n -> if n=0 then fO () else fS (n-1))
    (fun _ -> 0,0)
    (fun n ->
    let q,r = euclides n b in
    if (<) b (succ r) then (succ q),0 else q,(succ r))
    a
