start:-
diagnosis(Diseases),
write('you may have: '),
write(Diseases),
nl,
write('get well soon'),
undo.

/* list of diagnosis */
diagnosis(covid19) :- covid19, !.
diagnosis(cold) :- cold, !.
diagnosis(sore_Throat) :- sore_Throat, !.
diagnosis(foodPoisning) :- foodPoisning, !.
diagnosis(colon_Disorders) :- colon_Disorders, !.
diagnosis(flu) :- flu, !.
diagnosis(unknown). /* no diagnosis*/

/* Diseases and their symptoms*/
covid19 :-
verify(fever),
verify(cough),
verify(tiredness),
verify(loss_of_taste_or_smell),
write('Sugestions:'),
nl,
write('1:Take PCR Test'),
nl,
write('2: panadol/tab'),
nl,
write('3: Take a Rest'),
nl,
write('4: Azithromycin/tab'),
nl,
write('Please do complete bed rest and take soft Diet Because'),
nl.

cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat),
write('Sugestions:'),
nl,
write('1: Stay Rested'),
nl,
write('2: Drink Hot Liquids'),
nl,
write('3:Try a Lozenge to Soothe Your Throat'),
nl,
write('Please weare warm cloths Because'),
nl.

flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_ache),
write('Sugestions:'),
nl,
write('1: Hydrate'),
nl,
write('2: Sleep as much as possible'),
nl,
write('3: Have a spoonful of honey to soothe a cough'),
nl,
write('Please Get a flu shot'),
nl.

foodPoisning :-
verify(nausea),
verify(vomiting),
verify(watery_or_bloody_diarrhea),
verify(fever),
verify(abdominal_pain_and_cramps),
write('Sugestions:'),
nl,
write('1: Following the Diet'),
nl,
write('2: Adding Probiotics to Your Meals'),
nl,
write('3: Taking Over-the-Counter Medicines'),
nl,
write('4: Drinking Ginger or Mint Tea'),
nl,
write('Please do complete bed rest and take soft Diet Because'),
nl.

sore_Throat :-
verify(painful_throat_especially_when_Swallowing),
verify(dry_scratchy_throat),
verify(redness_in_the_back_of_your_mouth),
verify(bad_breath),
verify(mild_cough),
verify(swollen_neck_glands),
write('Sugestions:'),
nl,
write('1: Gargle with salt water'),
nl,
write('2: Fight dry air with a humidifier'),
nl,
write('3:Sip herbal teas.'),
nl,
write('4: Give your voice a rest.'),
nl,
write('Please Get rest and use more liquid Because'),
nl.


colon_Disorders :-
verify(abdominal_pain),
verify(diarrhea),
verify(constipation),
verify(gas),
verify(bloating),
verify(cramping),
write('Sugestions:'),
nl,
write('1:reduce red meat'),
nl,
write('2: reduce fried foods and coffee'),
nl,
write('3: drink more water'),
nl,
write('4:increase fibers in your diet'),
nl,
write('Please do not sleep in open air and cover your full skin Because'),
nl.

/* diagnosing the symptoms */
ask(Question) :-
write('Do you have following symptom:'),
write(Question),
write('? '),
   read(Answer),
nl,
( (Answer == yes ; Answer == y)
->
asserta(yes(Question)) ;
    (Answer == no ; Answer == n)
->
assertz(no(Question)),fail;
    write('\nInvalid Input!!!\n'),nl).

:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.