
-- Lumen.Program -- Helper routines fr working with shader programs.
--
-- darkestkhan, Winter 2014

-- This code is covered by the ISC License:
--
-- Copyright © 2014, darkestkhan
--
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted, provided that the above
-- copyright notice and this permission notice appear in all copies.
--
-- The software is provided "as is" and the author disclaims all warranties
-- with regard to this software including all implied warranties of
-- merchantability and fitness. In no event shall the author be liable for any
-- special, direct, indirect, or consequential damages or any damages
-- whatsoever resulting from loss of use, data or profits, whether in an
-- action of contract, negligence or other tortious action, arising out of or
-- in connection with the use or performance of this software.

with Lumen.GL;

package Lumen.Program is

   -- Fetch info log for given shader program.
   function Get_Info_Log (Program: in GL.UInt) return String;

end Lumen.Program;