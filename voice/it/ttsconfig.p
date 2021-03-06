﻿% for turbo-prolog
:- op('--', xfy, 500).
% for swi-prolog
:- op(500, xfy,'--').

version(103).
tts :- version(X), X > 99.
voice :- version(X), X < 99.

language('it').
fest_language('Italian').


% IMPLEMENTED (X) or MISSING ( ) FEATURES:
% (X) new Version 1.5 format
% (X) route calculated prompts, left/right, u-turns, roundabouts, straight/follow
% (X) arrival
% (X) other prompts: attention (without Type implementation), location lost, off_route, exceed speed limit
% (X) attention Type implementation
% (X) special grammar: onto / on / to Street fur turn and follow commands
% (X) special grammar: nominative/dativ for distance measure
% (X) special grammar: imperative/infinitive distincion for turns
% (X) distance measure: meters / feet / yard support
% (X) Street name announcement (suppress in prepare_roundabout)
% (X) Name announcement for destination / intermediate / GPX waypoint arrival
% (X) Time announcement for new and recalculated route (for recalculated suppress in appMode=car)
% (X) word order checked
% (X) Announcement of favorites, waypoints and pois along the route
% (X) Support announcement of railroad crossings and pedestrian crosswalks


% ROUTE CALCULATED
string('route_is1.ogg', 'Il percorso calcolato è ').
string('route_is2.ogg', 'lungo ').
string('route_calculate.ogg', 'Ricalcolo percorso').
string('distance.ogg', 'distanza ').


% LEFT/RIGHT
string('prepare.ogg', 'Prepararsi a ').
string('after.ogg', 'fra ').

string('left.ogg', 'girare a sinistra').
string('left_sh.ogg', 'girare stretto a sinistra').
string('left_sl.ogg', 'girare leggermente a sinistra').
string('right.ogg', 'girare a destra').
string('right_sh.ogg', 'girare stretto a destra').
string('right_sl.ogg', 'girare leggermente a destra').
string('left_keep.ogg', 'tenersi sulla sinistra').
string('right_keep.ogg', 'tenersi sulla destra').
% if needed, "left/right_bear.ogg" can be defined here also. "... (then) (bear_left/right)" is used in pre-announcements to indicate the direction of a successive turn AFTER the next turn.

% U-TURNS
string('make_uturn1.ogg', 'torna indietro ').
string('make_uturn2.ogg', 'Si prega di torna indietro ').
string('make_uturn_wp.ogg', 'Quando possibile, fare inversione a u').

% ROUNDABOUTS
string('prepare_roundabout.ogg', 'Prepararsi a entrare in una rotonda').
string('roundabout.ogg', 'entrare nella rotonda, ').
string('then.ogg', ', poi').
string('and.ogg', 'e').
string('take.ogg', 'prendere la').
string('exit.ogg', 'uscita').

string('1st.ogg', 'prima').
string('2nd.ogg', 'seconda').
string('3rd.ogg', 'terza').
string('4th.ogg', 'quarta').
string('5th.ogg', 'quinta').
string('6th.ogg', 'sesta').
string('7th.ogg', 'settima').
string('8th.ogg', 'ottava').
string('9th.ogg', 'nona').
string('10th.ogg', 'decima').
string('11th.ogg', 'undicesima').
string('12th.ogg', 'dodicesima').
string('13th.ogg', 'tredicesima').
string('14th.ogg', 'quattordicesima').
string('15th.ogg', 'quindicesima').
string('16th.ogg', 'sedicesima').
string('17th.ogg', 'diciassettesima').

% STRAIGHT/FOLLOW
string('go_ahead.ogg', 'Proseguire diritti').
string('follow.ogg', 'Seguire la strada per').

% ARRIVE
string('and_arrive_destination.ogg', 'e arriveremo a destinazione').
string('reached_destination.ogg','arrivati a destinazione').
string('and_arrive_intermediate.ogg', 'e arriveremo al punto intermedio').
string('reached_intermediate.ogg', 'arrivati al punto intermedio').
string('and_arrive_waypoint.ogg', 'e arriveremo al vostro punto GPX intermedio').
string('reached_waypoint.ogg', 'arrivati al vostro punto GPX intermedio').

%NEARBY POINTS
string('and_arrive_waypoint.ogg', 'e arriverai al punto di intermedio ').
string('reached_waypoint.ogg', 'Punto intermedio raggiunto ').
string('and_arrive_favorite.ogg', 'e arriverai al preferito ').
string('reached_favorite.ogg', 'preferito raggiunto ').
string('and_arrive_poi.ogg', 'e arriverai al P D I ').
string('reached_poi.ogg', 'P D I raggiunto').

% OTHER PROMPTS
string('attention.ogg', 'attenzione, ').
string('speed_camera.ogg', 'Autovelox ').
string('border_control.ogg', 'Dogana ').
string('railroad_crossing.ogg', 'Passaggio a livello ').
string('traffic_calming.ogg', 'Dosso rallentatore ').
string('toll_booth.ogg', 'Casello ').
string('stop.ogg', 'Stop ').
string('pedestrian_crosswalk.ogg', 'Attraversamento pedonale ').
string('location_lost.ogg', 'Segnale g p s perso').
string('location_recovered.ogg', 'Segnale g p s ripristinato ').
string('off_route.ogg', 'Avete deviato dal percorso').
string('exceed_limit.ogg', 'Limite di velocità superato').

% STREET NAME GRAMMAR
string('onto.ogg', 'su ').
string('on.ogg', 'in ').
string('to.ogg', 'fino a ').
string('with.ogg', 'su ').  % is used if you turn together with your current street, i.e. street name does not change.
string('to2.ogg', 'su ').
 
% Utility: toLowerCaseStr(OldString,NewString)
toLowerCaseStr(L1,L1):-  var(L1), !.
toLowerCaseStr([],[]):-  !.
toLowerCaseStr([H1|T1],[H2|T2]):- H1>64,H1<91, !, H2 is H1+32, toLowerCaseStr(T1,T2).
toLowerCaseStr([H1|T1],[H1|T2]):- toLowerCaseStr(T1,T2).

% Utility: toLowerCaseAto(OldString,NewString)
toLowerCaseAto(A1,A2) :- atom_codes(A1,S1),toLowerCaseStr(S1,S2),atom_codes(A2,S2).

% Utility: removeSemicolonStr(OldString,NewString)
removeSemicolonStr(L1,L1):-  var(L1), !.
removeSemicolonStr([],[]):-  !.
removeSemicolonStr([H1|T1],[H2|T2]):- H1=59, !, H2 is 32, removeSemicolonStr(T1,T2).
removeSemicolonStr([H1|T1],[H1|T2]):- removeSemicolonStr(T1,T2).

% Utility: removeSemicolonAto(OldString,NewString)
removeSemicolonAto(A1,A2) :- atom_codes(A1,S1),removeSemicolonStr(S1,S2),atom_codes(A2,S2).

% Utility: reverseStr(OldStr,[],RevStr)
reverseStr([H|T], A, R) :- reverseStr(T, [H|A], R).
reverseStr([], A, A).

% Utility: startsWithStr(String,Match)
startsWithStr([],[]).
startsWithStr([H1|T1],[]):- startsWithStr(T1,[]).
startsWithStr([H1|T1],[H1|T2]):- startsWithStr(T1,T2).

% Utility endsWithString(String, Match)
endsWithString(A1,A2) :- atom_codes(A1,S1),atom_codes(A2,S2),reverseStr(S1,[],R1),reverseStr(S2,[],R2),toLowerCaseStr(R1,RL1),startsWithStr(RL1,R2).

isMale(Street) :-  endsWithString(Street, 'via').
isMale(Street) :-  endsWithString(Street, 'rotonda').
isMale(Street) :-  endsWithString(Street, 'damm'). % da controllare e tradurre 
isMale(Street) :-  endsWithString(Street, 'piazza').
isMale(Street) :-  endsWithString(Street, 'mercato').
isMale(Street) :-  endsWithString(Street, 'marciapiede').
isMale(Street) :-  endsWithString(Street, 'sentiero').

isFemale(Street) :-  endsWithString(Street, 'strada').
isFemale(Street) :-  endsWithString(Street, 'strada').
isFemale(Street) :-  endsWithString(Street, 'autostrada').
isFemale(Street) :-  endsWithString(Street, 'chaussee'). % da tradurre
isFemale(Street) :-  endsWithString(Street, 'vicolo').
isFemale(Street) :-  endsWithString(Street, 'zeile'). % da tradurre
isFemale(Street) :-  endsWithString(Street, 'viale').
isFemale(Street) :-  endsWithString(Street, '0').
isFemale(Street) :-  endsWithString(Street, '1').
isFemale(Street) :-  endsWithString(Street, '2').
isFemale(Street) :-  endsWithString(Street, '3').
isFemale(Street) :-  endsWithString(Street, '4').
isFemale(Street) :-  endsWithString(Street, '5').
isFemale(Street) :-  endsWithString(Street, '6').
isFemale(Street) :-  endsWithString(Street, '7').
isFemale(Street) :-  endsWithString(Street, '8').
isFemale(Street) :-  endsWithString(Street, '9').

street_is_male(voice([Ref, Name, Dest],_)) :- isMale(Name).
street_is_female(voice([Ref, Name, Dest],_)) :- isFemale(Name).
street_is_female(voice([Ref, Name, Dest],_)) :- isFemale(Ref).
street_is_nothing(voice([Ref, Name, Dest],_)) :- not(isMale(Name)), not(isFemale(Name)).

% DISTANCE UNIT SUPPORT
string('meters_nominativ.ogg', 'metri ').
string('meters_dativ.ogg', 'metri ').
string('around_1_kilometer_nominativ.ogg', 'circa un chilometro ').
string('around_1_kilometer_dativ.ogg', 'circa un chilometro ').
string('around.ogg', 'circa ').
string('kilometers_nominativ.ogg', 'chilometri ').
string('kilometers_dativ.ogg', 'chilometri ').

string('feet_nominativ.ogg', 'piedi ').
string('feet_dativ.ogg', 'piedi ').
string('1_tenth_of_a_mile_nominativ.ogg', 'un decimo di miglio ').
string('1_tenth_of_a_mile_dativ.ogg', 'un decimo di miglio ').
string('tenths_of_a_mile_nominativ.ogg', 'decimi di miglio ').
string('tenths_of_a_mile_dativ.ogg', 'decimi di miglio ').
string('around_1_mile_nominativ.ogg', 'circa un miglio ').
string('around_1_mile_dativ.ogg', 'circa un miglio ').
string('miles_nominativ.ogg', 'miglia ').
string('miles_dativ.ogg', 'miglia ').

string('yards_nominativ.ogg', 'iarda ').
string('yards_dativ.ogg', 'iarda ').

% TIME SUPPORT
string('time.ogg', 'il tempo è ').
string('1_hour.ogg', 'un ora ').
string('hours.ogg', 'ore ').
string('less_a_minute.ogg', 'meno di un minuto ').
string('1_minute.ogg', 'un minuto ').
string('minutes.ogg', 'minuti ').

%% COMMAND BUILDING / WORD ORDER
turn('left', ['left.ogg']).
turn('left_sh', ['left_sh.ogg']).
turn('left_sl', ['left_sl.ogg']).
turn('right', ['right.ogg']).
turn('right_sh', ['right_sh.ogg']).
turn('right_sl', ['right_sl.ogg']).
turn('left_keep', ['left_keep.ogg']).
turn('right_keep', ['right_keep.ogg']).
bear_left(_Street) -- ['left_keep.ogg'].
bear_right(_Street) -- ['right_keep.ogg'].

% cut_part_street(voice([Ref, Name, Dest], [_CurrentRef, _CurrentName, _CurrentDest]), _).
cut_part_street(voice(['', '', Dest], _), DestClean) :- removeSemicolonAto(Dest,DestClean).
% cut_part_street(voice(['', Name, _], _), Name). % not necessary
cut_part_street(voice([Ref, Name, _], _), Concat) :- atom_concat(Name, ' ', C1), atom_concat(C1, Ref, Concat).

turn_street('', []).
turn_street(voice(['','',''],_), []).
turn_street(Street, ['to2.ogg', SName]) :- tts, Street = voice(['', '', D], _), cut_part_street(Street, SName).
turn_street(Street, ['onto.ogg', 'den ', SName]) :- tts, not(Street = voice(['', '', D], _)), street_is_male(Street), cut_part_street(Street, SName).
turn_street(Street, ['onto.ogg', 'die ', SName]) :- tts, not(Street = voice(['', '', D], _)), street_is_female(Street), cut_part_street(Street, SName).
turn_street(Street, ['onto.ogg', SName]) :- tts, not(Street = voice(['', '', D], _)), street_is_nothing(Street), cut_part_street(Street, SName).
turn_street(_Street, []) :- not(tts).

follow_street('', []).
follow_street(voice(['','',''],_), []).
follow_street(Street, ['to.ogg', SName]) :- tts, Street = voice(['', '', D], _), cut_part_street(Street, SName).
follow_street(Street, ['to.ogg', 'zum ', SName]) :- tts, not(Street = voice([R, S, _],[R, S, _])), street_is_male(Street), cut_part_street(Street, SName).
follow_street(Street, ['to.ogg', 'zur ', SName]) :- tts, not(Street = voice([R, S, _],[R, S, _])), street_is_female(Street), cut_part_street(Street, SName).
follow_street(Street, ['to.ogg', SName]) :- tts, not(Street = voice([R, S, _],[R, S, _])), street_is_nothing(Street), cut_part_street(Street, SName).
follow_street(Street, ['on.ogg', SName]) :- tts, Street = voice([R, S, _],[R, S, _]), cut_part_street(Street, SName).
follow_street(_Street, []) :- not(tts).

prepare_turn(Turn, Dist, Street) -- ['prepare.ogg', 'after.ogg', D, M | Sgen] :- distance(Dist, dativ) -- D, turn(Turn, M), turn_street(Street, Sgen).
turn(Turn, Dist, Street) -- ['after.ogg', D, M, ' '| Sgen] :- distance(Dist, dativ) -- D, turn(Turn, M), turn_street(Street, Sgen).
turn(Turn, Street) -- [M, ' '| Sgen] :- turn(Turn, M), turn_street(Street, Sgen).

prepare_make_ut(Dist, Street) -- ['prepare.ogg', 'after.ogg', D, 'make_uturn2.ogg' | Sgen] :- distance(Dist, dativ) -- D, turn_street(Street, Sgen).
make_ut(Dist, Street) --  ['after.ogg', D, 'make_uturn1.ogg' | Sgen] :- distance(Dist, dativ) -- D, turn_street(Street, Sgen).
make_ut(Street) -- ['make_uturn2.ogg' | Sgen] :- turn_street(Street, Sgen).
make_ut_wp -- ['make_uturn_wp.ogg'].

prepare_roundabout(Dist, _Exit, _Street) -- ['prepare.ogg', 'after.ogg', D, 'prepare_roundabout.ogg'] :- distance(Dist, dativ) -- D.
roundabout(Dist, _Angle, Exit, Street) -- ['after.ogg', D, 'roundabout.ogg', 'then.ogg', 'take.ogg', E, 'exit.ogg' | Sgen] :- distance(Dist, dativ) -- D, nth(Exit, E), turn_street(Street, Sgen).
roundabout(_Angle, Exit, Street) -- ['take.ogg', E, 'exit.ogg' | Sgen] :- nth(Exit, E), turn_street(Street, Sgen).

go_ahead -- ['go_ahead.ogg'].
go_ahead(Dist, Street) -- ['follow1.ogg', D, 'follow2.ogg'| Sgen]:- distance(Dist, nominativ) -- D, follow_street(Street, Sgen).

then -- ['then.ogg'].
name(D, [D]) :- tts.
name(_D, []) :- not(tts).
and_arrive_destination(D) -- ['and_arrive_destination.ogg', Ds, 'reached.ogg'] :- name(D, Ds).
reached_destination(D) -- ['reached_destination.ogg', Ds, 'reached.ogg'] :- name(D, Ds).
and_arrive_intermediate(D) -- ['and_arrive_intermediate.ogg', Ds, 'reached.ogg'] :- name(D, Ds).
reached_intermediate(D) -- ['reached_intermediate.ogg', Ds, 'reached.ogg'] :- name(D, Ds).
and_arrive_waypoint(D) -- ['and_arrive_waypoint.ogg'|Ds] :- name(D, Ds).
reached_waypoint(D) -- ['reached_waypoint.ogg'|Ds] :- name(D, Ds).
and_arrive_favorite(D) -- ['and_arrive_favorite.ogg'|Ds] :- name(D, Ds).
reached_favorite(D) -- ['reached_favorite.ogg'|Ds] :- name(D, Ds).
and_arrive_poi(D) -- ['and_arrive_poi.ogg'|Ds] :- name(D, Ds).
reached_poi(D) -- ['reached_poi.ogg'|Ds] :- name(D, Ds).
 
route_new_calc(Dist, Time) -- ['route_is1.ogg', D, 'route_is2.ogg', 'time.ogg', T] :- distance(Dist, nominativ) -- D, time(Time) -- T.
route_recalc(_Dist, _Time) -- ['route_calculate.ogg'] :- appMode('car').
route_recalc(Dist, Time) -- ['route_calculate.ogg', 'distance.ogg', D, 'time.ogg', T] :- distance(Dist, nominativ) -- D, time(Time) -- T.
 
location_lost -- ['location_lost.ogg'].
location_recovered -- ['location_recovered.ogg'].
off_route(Dist) -- ['off_route.ogg', D] :- distance(Dist, dativ) -- D.
speed_alarm -- ['exceed_limit.ogg'].
% attention(_Type) -- ['attention.ogg'].
attention(Type) -- ['attention.ogg', W] :- warning(Type, W).

% TRAFFIC WARNINGS
warning('SPEED_CAMERA', 'speed_camera.ogg').
warning('SPEED_LIMIT', '').
warning('BORDER_CONTROL', 'border_control.ogg').
warning('RAILWAY', 'railroad_crossing.ogg').
warning('TRAFFIC_CALMING', 'traffic_calming.ogg').
warning('TOLL_BOOTH', 'toll_booth.ogg').
warning('STOP', 'stop.ogg').
warning('PEDESTRIAN', 'pedestrian_crosswalk.ogg').
warning('MAXIMUM', '').
warning(Type, '') :- not(Type = 'SPEED_CAMERA'; Type = 'SPEED_LIMIT'; Type = 'BORDER_CONTROL'; Type = 'RAILWAY'; Type = 'TRAFFIC_CALMING'; Type = 'TOLL_BOOTH'; Type = 'STOP'; Type = 'PEDESTRIAN'; Type = 'MAXIMUM').

%% 
nth(1, '1st.ogg').
nth(2, '2nd.ogg').
nth(3, '3rd.ogg').
nth(4, '4th.ogg').
nth(5, '5th.ogg').
nth(6, '6th.ogg').
nth(7, '7th.ogg').
nth(8, '8th.ogg').
nth(9, '9th.ogg').
nth(10, '10th.ogg').
nth(11, '11th.ogg').
nth(12, '12th.ogg').
nth(13, '13th.ogg').
nth(14, '14th.ogg').
nth(15, '15th.ogg').
nth(16, '16th.ogg').
nth(17, '17th.ogg').


%% resolve command main method
%% if you are familar with Prolog you can input specific to the whole mechanism,
%% by adding exception cases.
flatten(X, Y) :- flatten(X, [], Y), !.
flatten([], Acc, Acc).
flatten([X|Y], Acc, Res):- flatten(Y, Acc, R), flatten(X, R, Res).
flatten(X, Acc, [X|Acc]) :- version(J), J < 100, !.
flatten(X, Acc, [Y|Acc]) :- string(X, Y), !.
flatten(X, Acc, [X|Acc]).

resolve(X, Y) :- resolve_impl(X,Z), flatten(Z, Y).
resolve_impl([],[]).
resolve_impl([X|Rest], List) :- resolve_impl(Rest, Tail), ((X -- L) -> append(L, Tail, List); List = Tail).


% handling alternatives
[X|_Y] -- T :- (X -- T),!.
[_X|Y] -- T :- (Y -- T).


pnumber(X, Y) :- tts, !, num_atom(X, Y).
pnumber(X, Ogg) :- num_atom(X, A), atom_concat(A, '.ogg', Ogg).
