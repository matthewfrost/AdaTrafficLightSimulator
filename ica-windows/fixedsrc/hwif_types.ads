with Interfaces;

package HWIF_Types is
   
   pragma Pure;
   
   type Octet is new Interfaces.Unsigned_8 with Size => 8;
   
   -- Integer.
   type Int is new Interfaces.Unsigned_32 with Size => 32;
   
end HWIF_Types;
