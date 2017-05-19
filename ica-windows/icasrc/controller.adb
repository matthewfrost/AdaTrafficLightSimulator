with HWIF; use HWIF;
with HWIF_Types; use HWIF_Types;
with Ada.Calendar; use Ada.Calendar;
procedure Controller is

   NS_LastRan : Time;
   EW_LastRan : Time;
   Ped_Last : Time := Clock;
   priorityDuration : constant Duration := 20.0;

   LastRan : Direction := East;

   procedure delayTask(time : Duration) is
      number : Integer;
      remainder : Duration;
   begin
      if(Pedestrian_Wait(North) = 1 or Pedestrian_Light(North) = 1) then
         delay until Clock + time;
      else
         number := Integer(time / 0.1);
         remainder := time;
      delay_loop:
         for I in Integer range 0 .. number loop
            exit when Pedestrian_Wait(North) = 1;
         if Pedestrian_Button(North) = 1 and Pedestrian_Light(North) /= 1 then
            Pedestrian_Wait := (North => 1, East => 1, South => 1, West => 1);
         end if;
         if Pedestrian_Button(East) = 1 and Pedestrian_Light(East) /= 1 then
            Pedestrian_Wait := (North => 1, East => 1, South => 1, West => 1);
         end if;
         if Pedestrian_Button(South) = 1 and Pedestrian_Light(South) /= 1 then
            Pedestrian_Wait := (North => 1, East => 1, South => 1, West => 1);
         end if;
         if Pedestrian_Button(West) = 1 and Pedestrian_Light(West) /= 1 then
            Pedestrian_Wait := (North => 1, East => 1, South => 1, West => 1);
         end if;
            delay 0.1;
            remainder := remainder - 0.1;
         end loop delay_loop;
         if(remainder > 0.0) then
            delay remainder;
            end if;
      end if;
   end;

   procedure checkEmergency(Direction1: Direction; Direction2 : Direction) is
   begin
      if((Emergency_Vehicle_Sensor(Direction1) = 1) or (Emergency_Vehicle_Sensor(Direction2) = 1)) then
         EmergencyLoop:
         while((Emergency_Vehicle_Sensor(Direction1) = 1) or (Emergency_Vehicle_Sensor(Direction2) = 1)) loop
            delayTask(0.5);
         end loop EmergencyLoop;
         delayTask(10.0);
      else
         delayTask(5.0);
      end if;
   end checkEmergency;



   procedure test (Direction1 : Direction; Direction2 : Direction) is
   begin
      delayTask(1.0);
      Traffic_Light(Direction1) := 6;
      Traffic_Light(Direction2) := 6;
      delayTask(0.5);
      Traffic_Light(Direction1) := 1;
      Traffic_Light(Direction2) := 1;
      checkEmergency(Direction1, Direction2);
      Traffic_Light(Direction1):= 2;
      Traffic_Light(Direction2) := 2;
      delayTask(5.0);
      Traffic_Light(Direction1) := 4;
      Traffic_Light(Direction2) := 4;

      if(Direction1 = North) then
         NS_LastRan := Clock;
      else
         EW_LastRan := Clock;
      end if;

      if(Emergency_Vehicle_Sensor(North) = 1 or Emergency_Vehicle_Sensor(South) = 1) then
         Traffic_Light(North) := 4;
         Traffic_Light(South) := 4;
         delayTask(1.0);
         Traffic_Light(North) := 6;
         Traffic_Light(South) := 6;
         delayTask(0.5);
         Traffic_Light(North) := 1;
         Traffic_Light(South) := 1;
         DelayLoopNS:
         while (Emergency_Vehicle_Sensor(North) = 1 or Emergency_Vehicle_Sensor(South) = 1)loop
            delayTask(1.0);
         end loop DelayLoopNS;
         delayTask(10.0);
         Traffic_Light(North) := 2;
         Traffic_Light(South) := 2;
         delayTask(5.0);
         Traffic_Light(North) := 4;
         Traffic_Light(South) := 4;
         NS_LastRan := Clock;
      end if;
      if(Emergency_Vehicle_Sensor(East) = 1 or Emergency_Vehicle_Sensor(West) = 1) then
         Traffic_Light(East) := 4;
         Traffic_Light(West) := 4;
         delayTask(1.0);
         Traffic_Light(East) := 6;
         Traffic_Light(West) := 6;
	delayTask(0.5);
         Traffic_Light(East) := 1;
         Traffic_Light(West) := 1;
         DelayLoopEW:
         while (Emergency_Vehicle_Sensor(East) = 1 or Emergency_Vehicle_Sensor(West) = 1)loop
            delayTask(1.0);
         end loop DelayLoopEW;
         delayTask(10.0);
         Traffic_Light(East) := 2;
         Traffic_Light(West) := 2;
         delayTask(5.0);
         Traffic_Light(East) := 4;
         Traffic_Light(West) := 4;
         EW_LastRan := Clock;
      end if;
   end test;


   procedure priorities is
      NS_diff : Duration;
      EW_diff : Duration;
   begin
      NS_diff := Clock - NS_LastRan;
      EW_diff  := Clock - EW_LastRan;
      if((Clock - Ped_Last > priorityDuration) and (Pedestrian_Wait(North) = 1 or Pedestrian_Wait(East) = 1 or Pedestrian_Wait(South) = 1 or Pedestrian_Wait(West) = 1)) then
         Pedestrian_Wait := (North => 2, East => 2, West => 2, South => 2);
	 Pedestrian_Light := (North => 1, East => 1, West => 1, South => 1);
         --delay until Clock + seven_wait;
         delayTask(7.0);
	    Pedestrian_Light := (North => 2, East => 2, South => 2, West => 2);
         Ped_Last := Clock;
      elsif(NS_diff > priorityDuration and (NS_diff > EW_diff)) then
         test(North, South);
         LastRan := North;
      elsif(EW_diff > priorityDuration) then
         test(East, West);
         LastRan:= East;

      elsif LastRan = North then
         test(East, West);
         LastRan := East;
      else
         test(North, South);
         LastRan := North;
      end if;

   end priorities;

   procedure standardLoop is
   begin
      endlessLoop :
      loop

         if(Emergency_Vehicle_Sensor(North) = 1 or Emergency_Vehicle_Sensor(South) = 1)then --prioritise emergency vehicles first
            test(North, South);
            LastRan := North;
         end if;
         if(Emergency_Vehicle_Sensor(East) = 1 or Emergency_Vehicle_Sensor(West) = 1)then --prioritise emergency vehicles first
            test(East, West);
            LastRan := East;
         end if;

         priorities;

      end loop endlessloop;
   end standardLoop;
begin
   standardLoop;
end Controller;

