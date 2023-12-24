EXTEND_BOTTOM botsmith 4
IF ~OR(3)
      PartyHasItem("SW1H77")
      PartyHasItem("larluk5")
      PartyHasItem("rudaluk")~ THEN GOTO sprawdzenie
END

APPEND botsmith
IF ~~ THEN BEGIN sprawdzenie SAY @1
  IF ~PartyHasItem("rudaluk")
      PartyHasItem("larluk5")
      PartyHasItem("SW1H77")~ THEN GOTO komponentyluk
  IF ~OR(3)
      !PartyHasItem("SW1H77")
      !PartyHasItem("larluk5")
      !PartyHasItem("rudaluk")~ THEN GOTO PartyDoesNotHaveAllParts
END

IF ~~ THEN BEGIN PartyDoesNotHaveAllParts SAY @2
  IF ~~ THEN GOTO MovingRightAlong
END

IF ~~ THEN BEGIN komponentyluk SAY @3
  IF ~PartyGoldGT(7499)~ THEN DO ~SetGlobal("ForgeItem","GLOBAL",555)
                                  SetGlobal("ForgeStuff","GLOBAL",1)
                                  TakePartyGold(7500)
                                  DestroyGold(7500)~ REPLY @4 GOTO MovingRightAlong
  IF ~~ THEN REPLY @5 GOTO MovingRightAlong
END

IF ~~ THEN BEGIN MovingRightAlong SAY @6
  COPY_TRANS botsmith 4
END
END



