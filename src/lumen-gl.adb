
-- Lumen.GL -- Lumen's own thin OpenGL bindings
--
-- Chip Richards, NiEstu, Phoenix AZ, Summer 2010

-- This code is covered by the ISC License:
--
-- Copyright © 2010, NiEstu
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


package body Lumen.GL is

   ---------------------------------------------------------------------------

   -- Transformations
   procedure Rotate (Angle : in Double;
                     X     : in Double;
                     Y     : in Double;
                     Z     : in Double) is
      procedure glRotated (Angle : in Double;
                           X     : in Double;
                           Y     : in Double;
                           Z     : in Double);
      pragma Import (C, glRotated, "glRotated");
   begin  -- Rotate
      glRotated (Angle, X, Y, Z);
   end Rotate;

   procedure Rotate (Angle : in Float;
                     X     : in Float;
                     Y     : in Float;
                     Z     : in Float) is
      procedure glRotatef (Angle : in Float;
                           X     : in Float;
                           Y     : in Float;
                           Z     : in Float);
      pragma Import (C, glRotatef, "glRotatef");
   begin  -- Rotate
      glRotatef (Angle, X, Y, Z);
   end Rotate;

   procedure Scale (X : in Double;
                    Y : in Double;
                    Z : in Double) is
      procedure glScaled (X : in Double;
                          Y : in Double;
                          Z : in Double);
      pragma Import (C, glScaled, "glScaled");
   begin  -- Scale
      glScaled (X, Y, Z);
   end Scale;

   procedure Scale (X : in Float;
                    Y : in Float;
                    Z : in Float) is
      procedure glScalef (X : in Float;
                          Y : in Float;
                          Z : in Float);
      pragma Import (C, glScalef, "glScalef");
   begin  -- Scale
      glScalef (X, Y, Z);
   end Scale;

   procedure Translate (X : in Double;
                        Y : in Double;
                        Z : in Double) is
      procedure glTranslated (X : in Double;
                              Y : in Double;
                              Z : in Double);
      pragma Import (C, glTranslated, "glTranslated");
   begin  -- Translate
      glTranslated (X, Y, Z);
   end Translate;

   procedure Translate (X : in Float;
                        Y : in Float;
                        Z : in Float) is
      procedure glTranslatef (X : in Float;
                              Y : in Float;
                              Z : in Float);
      pragma Import (C, glTranslatef, "glTranslatef");
   begin  -- Translate
      glTranslatef (X, Y, Z);
   end Translate;

   ---------------------------------------------------------------------------

   -- Matrix operations
   procedure Load_Matrix (M : in Float_Matrix) is
      procedure glLoadMatrixf (M : in System.Address);
      pragma Import (C, glLoadMatrixf, "glLoadMatrixf");
   begin  -- LoadMatrix
      glLoadMatrixf (M'Address);
   end Load_Matrix;

   procedure Load_Matrix (M : in Double_Matrix) is
      procedure glLoadMatrixd (M : in System.Address);
      pragma Import (C, glLoadMatrixd, "glLoadMatrixd");
   begin  -- LoadMatrix
      glLoadMatrixd (M'Address);
   end Load_Matrix;

   procedure Mult_Matrix (M : in Float_Matrix) is
      procedure glMultMatrixf (M : in System.Address);
      pragma Import (C, glMultMatrixf, "glMultMatrixf");
   begin  -- MultMatrix
      glMultMatrixf (M'Address);
   end Mult_Matrix;

   procedure Mult_Matrix (M : in Double_Matrix) is
      procedure glMultMatrixd (M : in System.Address);
      pragma Import (C, glMultMatrixd, "glMultMatrixd");
   begin  -- MultMatrix
      glMultMatrixd (M'Address);
   end Mult_Matrix;

   ---------------------------------------------------------------------------

   -- Component color
   procedure Color (Red   : in Byte;
                    Green : in Byte;
                    Blue  : in Byte) is
      procedure glColor3b (Red   : in Byte;
                           Green : in Byte;
                           Blue  : in Byte);
      pragma Import (C, glColor3b, "glColor3b");
   begin  -- Color
      glColor3b (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in Short;
                    Green : in Short;
                    Blue  : in Short) is
      procedure glColor3s (Red   : in Short;
                           Green : in Short;
                           Blue  : in Short);
      pragma Import (C, glColor3s, "glColor3s");
   begin  -- Color
      glColor3s (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in Int;
                    Green : in Int;
                    Blue  : in Int) is
      procedure glColor3i (Red   : in Int;
                           Green : in Int;
                           Blue  : in Int);
      pragma Import (C, glColor3i, "glColor3i");
   begin  -- Color
      glColor3i (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in Float;
                    Green : in Float;
                    Blue  : in Float) is
      procedure glColor3f (Red   : in Float;
                           Green : in Float;
                           Blue  : in Float);
      pragma Import (C, glColor3f, "glColor3f");
   begin  -- Color
      glColor3f (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in Double;
                    Green : in Double;
                    Blue  : in Double) is
      procedure glColor3d (Red   : in Double;
                           Green : in Double;
                           Blue  : in Double);
      pragma Import (C, glColor3d, "glColor3d");
   begin  -- Color
      glColor3d (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in UByte;
                    Green : in UByte;
                    Blue  : in UByte) is
      procedure glColor3ub (Red   : in UByte;
                            Green : in UByte;
                            Blue  : in UByte);
      pragma Import (C, glColor3ub, "glColor3ub");
   begin  -- Color
      glColor3ub (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in UShort;
                    Green : in UShort;
                    Blue  : in UShort) is
      procedure glColor3us (Red   : in UShort;
                            Green : in UShort;
                            Blue  : in UShort);
      pragma Import (C, glColor3us, "glColor3us");
   begin  -- Color
      glColor3us (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in UInt;
                    Green : in UInt;
                    Blue  : in UInt) is
      procedure glColor3ui (Red   : in UInt;
                            Green : in UInt;
                            Blue  : in UInt);
      pragma Import (C, glColor3ui, "glColor3ui");
   begin  -- Color
      glColor3ui (Red, Green, Blue);
   end Color;

   procedure Color (Red   : in Byte;
                    Green : in Byte;
                    Blue  : in Byte;
                    Alpha : in Byte) is
      procedure glColor4b (Red   : in Byte;
                           Green : in Byte;
                           Blue  : in Byte;
                           Alpha : in Byte);
      pragma Import (C, glColor4b, "glColor4b");
   begin  -- Color
      glColor4b (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in Short;
                    Green : in Short;
                    Blue  : in Short;
                    Alpha : in Short) is
      procedure glColor4s (Red   : in Short;
                           Green : in Short;
                           Blue  : in Short;
                           Alpha : in Short);
      pragma Import (C, glColor4s, "glColor4s");
   begin  -- Color
      glColor4s (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in Int;
                    Green : in Int;
                    Blue  : in Int;
                    Alpha : in Int) is
      procedure glColor4i (Red   : in Int;
                           Green : in Int;
                           Blue  : in Int;
                           Alpha : in Int);
      pragma Import (C, glColor4i, "glColor4i");
   begin  -- Color
      glColor4i (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in Float;
                    Green : in Float;
                    Blue  : in Float;
                    Alpha : in Float) is
      procedure glColor4f (Red   : in Float;
                           Green : in Float;
                           Blue  : in Float;
                           Alpha : in Float);
      pragma Import (C, glColor4f, "glColor4f");
   begin  -- Color
      glColor4f (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in Double;
                    Green : in Double;
                    Blue  : in Double;
                    Alpha : in Double) is
      procedure glColor4d (Red   : in Double;
                           Green : in Double;
                           Blue  : in Double;
                           Alpha : in Double);
      pragma Import (C, glColor4d, "glColor4d");
   begin  -- Color
      glColor4d (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in UByte;
                    Green : in UByte;
                    Blue  : in UByte;
                    Alpha : in UByte) is
      procedure glColor4ub (Red   : in UByte;
                            Green : in UByte;
                            Blue  : in UByte;
                            Alpha : in UByte);
      pragma Import (C, glColor4ub, "glColor4ub");
   begin  -- Color
      glColor4ub (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in UShort;
                    Green : in UShort;
                    Blue  : in UShort;
                    Alpha : in UShort) is
      procedure glColor4us (Red   : in UShort;
                            Green : in UShort;
                            Blue  : in UShort;
                            Alpha : in UShort);
      pragma Import (C, glColor4us, "glColor4us");
   begin  -- Color
      glColor4us (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (Red   : in UInt;
                    Green : in UInt;
                    Blue  : in UInt;
                    Alpha : in UInt) is
      procedure glColor4ui (Red   : in UInt;
                            Green : in UInt;
                            Blue  : in UInt;
                            Alpha : in UInt);
      pragma Import (C, glColor4ui, "glColor4ui");
   begin  -- Color
      glColor4ui (Red, Green, Blue, Alpha);
   end Color;

   procedure Color (V : in Bytes_3) is
      procedure glColor3bv (V : in Bytes_3);
      pragma Import (C, glColor3bv, "glColor3bv");
   begin  -- Color
      glColor3bv (V);
   end Color;

   procedure Color (V : in Bytes_4) is
      procedure glColor4bv (V : in Bytes_4);
      pragma Import (C, glColor4bv, "glColor4bv");
   begin  -- Color
      glColor4bv (V);
   end Color;

   procedure Color (V : in Shorts_3) is
      procedure glColor3sv (V : in Shorts_3);
      pragma Import (C, glColor3sv, "glColor3sv");
   begin  -- Color
      glColor3sv (V);
   end Color;

   procedure Color (V : in Shorts_4) is
      procedure glColor4sv (V : in Shorts_4);
      pragma Import (C, glColor4sv, "glColor4sv");
   begin  -- Color
      glColor4sv (V);
   end Color;

   procedure Color (V : in Ints_3) is
      procedure glColor3iv (V : in Ints_3);
      pragma Import (C, glColor3iv, "glColor3iv");
   begin  -- Color
      glColor3iv (V);
   end Color;

   procedure Color (V : in Ints_4) is
      procedure glColor4iv (V : in Ints_4);
      pragma Import (C, glColor4iv, "glColor4iv");
   begin  -- Color
      glColor4iv (V);
   end Color;

   procedure Color (V : in Floats_3) is
      procedure glColor3fv (V : in Floats_3);
      pragma Import (C, glColor3fv, "glColor3fv");
   begin  -- Color
      glColor3fv (V);
   end Color;

   procedure Color (V : in Floats_4) is
      procedure glColor4fv (V : in Floats_4);
      pragma Import (C, glColor4fv, "glColor4fv");
   begin  -- Color
      glColor4fv (V);
   end Color;

   procedure Color (V : in Doubles_3) is
      procedure glColor3dv (V : in Doubles_3);
      pragma Import (C, glColor3dv, "glColor3dv");
   begin  -- Color
      glColor3dv (V);
   end Color;

   procedure Color (V : in Doubles_4) is
      procedure glColor4dv (V : in Doubles_4);
      pragma Import (C, glColor4dv, "glColor4dv");
   begin  -- Color
      glColor4dv (V);
   end Color;

   procedure Color (V : in UBytes_3) is
      procedure glColor3ubv (V : in UBytes_3);
      pragma Import (C, glColor3ubv, "glColor3ubv");
   begin  -- Color
      glColor3ubv (V);
   end Color;

   procedure Color (V : in UBytes_4) is
      procedure glColor4ubv (V : in UBytes_4);
      pragma Import (C, glColor4ubv, "glColor4ubv");
   begin  -- Color
      glColor4ubv (V);
   end Color;

   procedure Color (V : in UShorts_3) is
      procedure glColor3usv (V : in UShorts_3);
      pragma Import (C, glColor3usv, "glColor3usv");
   begin  -- Color
      glColor3usv (V);
   end Color;

   procedure Color (V : in UShorts_4) is
      procedure glColor4usv (V : in UShorts_4);
      pragma Import (C, glColor4usv, "glColor4usv");
   begin  -- Color
      glColor4usv (V);
   end Color;

   procedure Color (V : in UInts_3) is
      procedure glColor3uiv (V : in UInts_3);
      pragma Import (C, glColor3uiv, "glColor3uiv");
   begin  -- Color
      glColor3uiv (V);
   end Color;

   procedure Color (V : in UInts_4) is
      procedure glColor4uiv (V : in UInts_4);
      pragma Import (C, glColor4uiv, "glColor4uiv");
   begin  -- Color
      glColor4uiv (V);
   end Color;

   ---------------------------------------------------------------------------

   -- Lighting and materials
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Int_Params) is
      procedure glLightiv (Light  : in Enum;
                           PName  : in Enum;
                           Params : in System.Address);
      pragma Import (C, glLightiv, "glLightiv");
   begin  -- Light
      glLightiv (Light, PName, Params (Params'First)'Address);
   end Light;

   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Float_Params) is
      procedure glLightfv (Light  : in Enum;
                           PName  : in Enum;
                           Params : in System.Address);
      pragma Import (C, glLightfv, "glLightfv");
   begin  -- Light
      glLightfv (Light, PName, Params (Params'First)'Address);
   end Light;

   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Int_Params) is
      procedure glMaterialiv (Face   : in Enum;
                              PName  : in Enum;
                              Params : in System.Address);
      pragma Import (C, glMaterialiv, "glMaterialiv");
   begin  -- Material
      glMaterialiv (Face, PName, Params (Params'First)'Address);
   end Material;

   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Float_Params) is
      procedure glMaterialfv (Face   : in Enum;
                              PName  : in Enum;
                              Params : in System.Address);
      pragma Import (C, glMaterialfv, "glMaterialfv");
   begin  -- Material
      glMaterialfv (Face, PName, Params (Params'First)'Address);
   end Material;

   ---------------------------------------------------------------------------

   -- Lighting
   procedure Light (Light : in Enum; P_Name : in Enum; Param : in Float) is
      procedure glLightf (Light : in Enum;
                          P_Name : in Enum;
                          Param  : in Float);
      pragma Import (C, glLightf, "glLightf");
   begin  -- Light
      glLightf (Light, P_Name, Param);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Params : Floats_1) is
      procedure glLightfv (Light : in Enum;
                          P_Name : in Enum;
                          Params : in Floats_1);
      pragma Import (C, glLightfv, "glLightfv");
   begin  -- Light
      glLightfv (Light, P_Name, Params);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Params : Floats_3) is
      procedure glLightfv (Light : in Enum;
                          P_Name : in Enum;
                          Params : in Floats_3);
      pragma Import (C, glLightfv, "glLightfv");
   begin  -- Light
      glLightfv (Light, P_Name, Params);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Params : Floats_4) is
      procedure glLightfv (Light : in Enum;
                          P_Name : in Enum;
                          Params : in Floats_4);
      pragma Import (C, glLightfv, "glLightfv");
   begin  -- Light
      glLightfv (Light, P_Name, Params);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Param : Int) is
      procedure glLighti (Light : in Enum;
                          P_Name : in Enum;
                          Param  : in Int);
      pragma Import (C, glLighti, "glLighti");
   begin  -- Light
      glLighti (Light, P_Name, Param);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Params : Ints_1) is
      procedure glLightiv (Light  : in Enum;
                           P_Name : in Enum;
                           Params : in Ints_1);
      pragma Import (C, glLightiv, "glLightiv");
   begin  -- Light
      glLightiv (Light, P_Name, Params);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Params : Ints_3) is
      procedure glLightiv (Light : in Enum;
                          P_Name : in Enum;
                          Params : in Ints_3);
      pragma Import (C, glLightiv, "glLightiv");
   begin  -- Light
      glLightiv (Light, P_Name, Params);
   end Light;

   procedure Light (Light : Enum; P_Name : Enum; Params : Ints_4) is
      procedure glLightiv (Light : in Enum;
                          P_Name : in Enum;
                          Params : in Ints_4);
      pragma Import (C, glLightiv, "glLightiv");
   begin  -- Light
      glLightiv (Light, P_Name, Params);
   end Light;

   -- Normal Vector
   procedure Normal (X, Y, Z : Byte) is
      procedure glNormal3b (X, Y, Z : Byte);
      pragma Import (C, glNormal3b, "glNormal3b");
   begin  -- Normal
      glNormal3b (X, Y, Z);
   end Normal;

   procedure Normal (X, Y, Z : Double) is
      procedure glNormal3d (X, Y, Z : Double);
      pragma Import (C, glNormal3d, "glNormal3d");
   begin  -- Normal
      glNormal3d (X, Y, Z);
   end Normal;

   procedure Normal (X, Y, Z : Float) is
      procedure glNormal3f (X, Y, Z : Float);
      pragma Import (C, glNormal3f, "glNormal3f");
   begin  -- Normal
      glNormal3f (X, Y, Z);
   end Normal;

   procedure Normal (X, Y, Z : Int) is
      procedure glNormal3i (X, Y, Z : Int);
      pragma Import (C, glNormal3i, "glNormal3i");
   begin  -- Normal
      glNormal3i (X, Y, Z);
   end Normal;

   procedure Normal (X, Y, Z : Short) is
      procedure glNormal3s (X, Y, Z : Short);
      pragma Import (C, glNormal3s, "glNormal3s");
   begin  -- Normal
      glNormal3s (X, Y, Z);
   end Normal;

   procedure Normal (V : Bytes_3) is
      procedure glNormal3bv (V : Bytes_3);
      pragma Import (C, glNormal3bv, "glNormal3bv");
   begin  -- Normal
      glNormal3bv (V);
   end Normal;

   procedure Normal (V : Doubles_3) is
      procedure glNormal3dv (V : Doubles_3);
      pragma Import (C, glNormal3dv, "glNormal3dv");
   begin  -- Normal
      glNormal3dv (V);
   end Normal;

   procedure Normal (V : Floats_3) is
      procedure glNormal3fv (V : Floats_3);
      pragma Import (C, glNormal3fv, "glNormal3fv");
   begin  -- Normal
      glNormal3fv (V);
   end Normal;

   procedure Normal (V : Ints_3) is
      procedure glNormal3iv (V : Ints_3);
      pragma Import (C, glNormal3iv, "glNormal3iv");
   begin  -- Normal
      glNormal3iv (V);
   end Normal;

   procedure Normal (V : Shorts_3) is
      procedure glNormal3sv (V : Shorts_3);
      pragma Import (C, glNormal3sv, "glNormal3sv");
   begin  -- Normal
      glNormal3sv (V);
   end Normal;

   -- Texturing
   -- 1D
   procedure Multi_Tex_Coord (Target : in Enum;
                            S      : in Double) is
      procedure glMultiTexCoord1d (Target : in Enum;
                                   S      : in Double);
      pragma Import(C, glMultiTexCoord1d, "glMultiTexCoord1d");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1d (Target, S);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Doubles_1) is
      procedure glMultiTexCoord1dv (Target : in Enum;
                                    V      : in Doubles_1);
      pragma Import(C, glMultiTexCoord1dv, "glMultiTexCoord1dv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1dv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            S      : in Float) is
      procedure glMultiTexCoord1f (Target : in Enum;
                                   S      : in Float);
      pragma Import(C, glMultiTexCoord1f, "glMultiTexCoord1f");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1f (Target, S);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Floats_1) is
      procedure glMultiTexCoord1fv (Target : in Enum;
                                    V      : in Floats_1);
      pragma Import(C, glMultiTexCoord1fv, "glMultiTexCoord1fv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1fv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            S      : in Int) is
      procedure glMultiTexCoord1i (Target : in Enum;
                                   S      : in Int);
      pragma Import(C, glMultiTexCoord1i, "glMultiTexCoord1i");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1i (Target, S);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Ints_1) is
      procedure glMultiTexCoord1iv (Target : in Enum;
                                    V      : in Ints_1);
      pragma Import(C, glMultiTexCoord1iv, "glMultiTexCoord1iv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1iv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            S      : in Short) is
      procedure glMultiTexCoord1s (Target : in Enum;
                                   S      : in Short);
      pragma Import(C, glMultiTexCoord1s, "glMultiTexCoord1s");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1s (Target, S);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Shorts_1) is
      procedure glMultiTexCoord1sv (Target : in Enum;
                                    V      : in Shorts_1);
      pragma Import(C, glMultiTexCoord1sv, "glMultiTexCoord1sv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord1sv (Target, V);
   end Multi_Tex_Coord;

   -- 2D
   procedure Multi_Tex_Coord (Target : in Enum;
                            S, T   : in Double) is
      procedure glMultiTexCoord2d (Target : in Enum;
                                   S, T   : in Double);
      pragma Import(C, glMultiTexCoord2d, "glMultiTexCoord2d");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2d (Target, S, T);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Doubles_2) is
      procedure glMultiTexCoord2dv (Target : in Enum;
                                    V      : in Doubles_2);
      pragma Import(C, glMultiTexCoord2dv, "glMultiTexCoord2dv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2dv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            S, T   : in Float) is
      procedure glMultiTexCoord2f (Target : in Enum;
                                   S, T   : in Float);
      pragma Import(C, GlMultiTexCoord2f, "glMultiTexCoord2f");
   begin  -- Multi_Tex_Coord
      GlMultiTexCoord2f (Target, S, T);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Floats_2) is
      procedure glMultiTexCoord2fv (Target : in Enum;
                                    V      : in Floats_2);
      pragma Import(C, glMultiTexCoord2fv, "glMultiTexCoord2fv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2fv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            S, T   : in Int) is
      procedure glMultiTexCoord2i (Target : in Enum;
                                   S, T   : in Int);
      pragma Import(C, glMultiTexCoord2i, "glMultiTexCoord2i");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2i (Target, S, T);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Ints_2) is
      procedure glMultiTexCoord2iv (Target : in Enum;
                                    V      : in Ints_2);
      pragma Import(C, glMultiTexCoord2iv, "glMultiTexCoord2iv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2iv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            S, T   : in Short) is
      procedure glMultiTexCoord2s (Target : in Enum;
                                   S, T   : in Short);
      pragma Import(C, glMultiTexCoord2s, "glMultiTexCoord2s");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2s (Target, S, T);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Shorts_2) is
      procedure glMultiTexCoord2sv (Target : in Enum;
                                    V      : in Shorts_2);
      pragma Import(C, glMultiTexCoord2sv, "glMultiTexCoord2sv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord2sv (Target, V);
   end Multi_Tex_Coord;

   -- 3D
   procedure Multi_Tex_Coord (Target  : in Enum;
                            S, T, R : in Double) is
      procedure glMultiTexCoord3d (Target  : in Enum;
                                   S, T, R : in Double);
      pragma Import(C, glMultiTexCoord3d, "glMultiTexCoord3d");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3d (Target, S, T, R);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Doubles_3) is
      procedure glMultiTexCoord3dv (Target : in Enum;
                                    V      : in Doubles_3);
      pragma Import(C, glMultiTexCoord3dv, "glMultiTexCoord3dv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3dv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target  : in Enum;
                            S, T, R : in Float) is
      procedure glMultiTexCoord3f (Target  : in Enum;
                                   S, T, R : in Float);
      pragma Import(C, glMultiTexCoord3f, "glMultiTexCoord3f");
   begin  -- Multi_Tex_Coord
      GlMultiTexCoord3f (Target, S, T, R);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Floats_3) is
      procedure glMultiTexCoord3fv (Target : in Enum;
                                    V      : in Floats_3);
      pragma Import(C, glMultiTexCoord3fv, "glMultiTexCoord3fv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3fv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target  : in Enum;
                            S, T, R : in Int) is
      procedure glMultiTexCoord3i (Target  : in Enum;
                                   S, T, R : in Int);
      pragma Import(C, glMultiTexCoord3i, "glMultiTexCoord3i");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3i (Target, S, T, R);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Ints_3) is
      procedure glMultiTexCoord3iv (Target : in Enum;
                                    V      : in Ints_3);
      pragma Import(C, glMultiTexCoord3iv, "glMultiTexCoord3iv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3iv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target  : in Enum;
                            S, T, R : in Short) is
      procedure glMultiTexCoord3s (Target  : in Enum;
                                   S, T, R : in Short);
      pragma Import(C, glMultiTexCoord3s, "glMultiTexCoord3s");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3s (Target, S, T, R);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Shorts_3) is
      procedure glMultiTexCoord3sv (Target : in Enum;
                                    V      : in Shorts_3);
      pragma Import(C, glMultiTexCoord3sv, "glMultiTexCoord3sv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord3sv (Target, V);
   end Multi_Tex_Coord;

   -- 4D
   procedure Multi_Tex_Coord (Target     : in Enum;
                            S, T, R, Q : in Double) is
      procedure glMultiTexCoord4d (Target     : in Enum;
                                   S, T, R, Q : in Double);
      pragma Import(C, glMultiTexCoord4d, "glMultiTexCoord4d");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4d (Target, S, T, R, Q);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Doubles_4) is
      procedure glMultiTexCoord4dv (Target : in Enum;
                                    V      : in Doubles_4);
      pragma Import(C, glMultiTexCoord4dv, "glMultiTexCoord4dv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4dv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target     : in Enum;
                            S, T, R, Q : in Float) is
      procedure glMultiTexCoord4f (Target     : in Enum;
                                   S, T, R, Q : in Float);
      pragma Import(C, glMultiTexCoord4f, "glMultiTexCoord4f");
   begin  -- Multi_Tex_Coord
      GlMultiTexCoord4f (Target, S, T, R, Q);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Floats_4) is
      procedure glMultiTexCoord4fv (Target : in Enum;
                                    V      : in Floats_4);
      pragma Import(C, glMultiTexCoord4fv, "glMultiTexCoord4fv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4fv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target     : in Enum;
                            S, T, R, Q : in Int) is
      procedure glMultiTexCoord4i (Target     : in Enum;
                                   S, T, R, Q : in Int);
      pragma Import(C, glMultiTexCoord4i, "glMultiTexCoord4i");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4i (Target, S, T, R, Q);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Ints_4) is
      procedure glMultiTexCoord4iv (Target : in Enum;
                                    V      : in Ints_4);
      pragma Import(C, glMultiTexCoord4iv, "glMultiTexCoord4iv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4iv (Target, V);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target     : in Enum;
                            S, T, R, Q : in Short) is
      procedure glMultiTexCoord4s (Target     : in Enum;
                                   S, T, R, Q : in Short);
      pragma Import(C, glMultiTexCoord4s, "glMultiTexCoord4s");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4s (Target, S, T, R, Q);
   end Multi_Tex_Coord;

   procedure Multi_Tex_Coord (Target : in Enum;
                            V      : in Shorts_4) is
      procedure glMultiTexCoord4sv (Target : in Enum;
                                    V      : in Shorts_4);
      pragma Import(C, glMultiTexCoord4sv, "glMultiTexCoord4sv");
   begin  -- Multi_Tex_Coord
      glMultiTexCoord4sv (Target, V);
   end Multi_Tex_Coord;

   procedure Tex_Parameter (Target : in Enum;
                           PName  : in Enum;
                           Param  : in Enum) is
      procedure glTexParameteri (Target : in Enum;
                                 PName  : in Enum;
                                 Param  : in Enum);
      pragma Import (C, glTexParameteri, "glTexParameteri");
   begin  -- TexParameter
      glTexParameteri (Target, PName, Param);
   end Tex_Parameter;

   procedure Tex_Parameter (Target : in Enum;
                           PName  : in Enum;
                           Param  : in Int) is
      procedure glTexParameteri (Target : in Enum;
                                 PName  : in Enum;
                                 Param  : in Int);
      pragma Import (C, glTexParameteri, "glTexParameteri");
   begin  -- TexParameter
      glTexParameteri (Target, PName, Param);
   end Tex_Parameter;

   procedure Tex_Parameter (Target : in Enum;
                           PName  : in Enum;
                           Param  : in Float) is
      procedure glTexParameterf (Target : in Enum;
                                 PName  : in Enum;
                                 Param  : in Float);
      pragma Import (C, glTexParameterf, "glTexParameterf");
   begin  -- TexParameter
      glTexParameterf (Target, PName, Param);
   end Tex_Parameter;

   -- Texture images
   procedure Tex_Image (Target          : in Enum;
                       Level           : in Int;
                       Internal_Format : in Enum;
                       Width           : in SizeI;
                       Border          : in Int;
                       Format          : in Enum;
                       Pixel_Type      : in Enum;
                       Pixels          : in System.Address) is
      procedure glTexImage1D (Target          : in Enum;
                              Level           : in Int;
                              Internal_Format : in Enum;
                              Width           : in SizeI;
                              Border          : in Int;
                              Format          : in Enum;
                              Pixel_Type      : in Enum;
                              Pixels          : in System.Address);
      pragma Import (C, glTexImage1D, "glTexImage1D");
   begin  -- TexImage
      glTexImage1D (Target, Level, Internal_Format, Width, Border, Format, Pixel_Type, Pixels);
   end Tex_Image;

   procedure Tex_Image (Target          : in Enum;
                       Level           : in Int;
                       Internal_Format : in Enum;
                       Width           : in SizeI;
                       Height          : in SizeI;
                       Border          : in Int;
                       Format          : in Enum;
                       Pixel_Type      : in Enum;
                       Pixels          : in System.Address) is
      procedure glTexImage2D (Target          : in Enum;
                              Level           : in Int;
                              Internal_Format : in Enum;
                              Width           : in SizeI;
                              Height          : in SizeI;
                              Border          : in Int;
                              Format          : in Enum;
                              Pixel_Type      : in Enum;
                              Pixels          : in System.Address);
      pragma Import (C, glTexImage2D, "glTexImage2D");
   begin  -- TexImage
      glTexImage2D (Target, Level, Internal_Format, Width, Height, Border, Format, Pixel_Type, Pixels);
   end Tex_Image;

   procedure Tex_Image (Target          : in Enum;
                       Level           : in Int;
                       Internal_Format : in Enum;
                       Width           : in SizeI;
                       Height          : in SizeI;
                       Depth           : in SizeI;
                       Border          : in Int;
                       Format          : in Enum;
                       Pixel_Type      : in Enum;
                       Pixels          : in System.Address) is
      procedure glTexImage3D (Target          : in Enum;
                              Level           : in Int;
                              Internal_Format : in Enum;
                              Width           : in SizeI;
                              Height          : in SizeI;
                              Depth           : in SizeI;
                              Border          : in Int;
                              Format          : in Enum;
                              Pixel_Type      : in Enum;
                              Pixels          : in System.Address);
      pragma Import (C, glTexImage3D, "glTexImage3D");
   begin  -- TexImage
      glTexImage3D (Target, Level, Internal_Format, Width, Height, Depth, Border, Format, Pixel_Type, Pixels);
   end Tex_Image;

   -- Texture coordinates
   procedure Tex_Coord (S : in Short) is
      procedure glTexCoord1s (S : in Short);
      pragma Import (C, glTexCoord1s, "glTexCoord1s");
   begin  -- Tex_Coord
      glTexCoord1s (S);
   end Tex_Coord;

   procedure Tex_Coord (S : in Int) is
      procedure glTexCoord1i (S : in Int);
      pragma Import (C, glTexCoord1i, "glTexCoord1i");
   begin  -- Tex_Coord
      glTexCoord1i (S);
   end Tex_Coord;

   procedure Tex_Coord (S : in Float) is
      procedure glTexCoord1f (S : in Float);
      pragma Import (C, glTexCoord1f, "glTexCoord1f");
   begin  -- Tex_Coord
      glTexCoord1f (S);
   end Tex_Coord;

   procedure Tex_Coord (S : in Double) is
      procedure glTexCoord1d (S : in Double);
      pragma Import (C, glTexCoord1d, "glTexCoord1d");
   begin  -- Tex_Coord
      glTexCoord1d (S);
   end Tex_Coord;

   procedure Tex_Coord (S : in Short;
                       T : in Short) is
      procedure glTexCoord2s (S : in Short;
                              T : in Short);
      pragma Import (C, glTexCoord2s, "glTexCoord2s");
   begin  -- Tex_Coord
      glTexCoord2s (S, T);
   end Tex_Coord;

   procedure Tex_Coord (S : in Int;
                       T : in Int) is
      procedure glTexCoord2i (S : in Int;
                              T : in Int);
      pragma Import (C, glTexCoord2i, "glTexCoord2i");
   begin  -- Tex_Coord
      glTexCoord2i (S, T);
   end Tex_Coord;

   procedure Tex_Coord (S : in Float;
                       T : in Float) is
      procedure glTexCoord2f (S : in Float;
                              T : in Float);
      pragma Import (C, glTexCoord2f, "glTexCoord2f");
   begin  -- Tex_Coord
      glTexCoord2f (S, T);
   end Tex_Coord;

   procedure Tex_Coord (S : in Double;
                       T : in Double) is
      procedure glTexCoord2d (S : in Double;
                              T : in Double);
      pragma Import (C, glTexCoord2d, "glTexCoord2d");
   begin  -- Tex_Coord
      glTexCoord2d (S, T);
   end Tex_Coord;

   procedure Tex_Coord (S : in Short;
                       T : in Short;
                       R : in Short) is
      procedure glTexCoord3s (S : in Short;
                              T : in Short;
                              R : in Short);
      pragma Import (C, glTexCoord3s, "glTexCoord3s");
   begin  -- Tex_Coord
      glTexCoord3s (S, T, R);
   end Tex_Coord;

   procedure Tex_Coord (S : in Int;
                       T : in Int;
                       R : in Int) is
      procedure glTexCoord3i (S : in Int;
                              T : in Int;
                              R : in Int);
      pragma Import (C, glTexCoord3i, "glTexCoord3i");
   begin  -- Tex_Coord
      glTexCoord3i (S, T, R);
   end Tex_Coord;

   procedure Tex_Coord (S : in Float;
                       T : in Float;
                       R : in Float) is
      procedure glTexCoord3f (S : in Float;
                              T : in Float;
                              R : in Float);
      pragma Import (C, glTexCoord3f, "glTexCoord3f");
   begin  -- Tex_Coord
      glTexCoord3f (S, T, R);
   end Tex_Coord;

   procedure Tex_Coord (S : in Double;
                       T : in Double;
                       R : in Double) is
      procedure glTexCoord3d (S : in Double;
                              T : in Double;
                              R : in Double);
      pragma Import (C, glTexCoord3d, "glTexCoord3d");
   begin  -- Tex_Coord
      glTexCoord3d (S, T, R);
   end Tex_Coord;

   procedure Tex_Coord (S : in Short;
                       T : in Short;
                       R : in Short;
                       Q : in Short) is
      procedure glTexCoord4s (S : in Short;
                              T : in Short;
                              R : in Short;
                              Q : in Short);
      pragma Import (C, glTexCoord4s, "glTexCoord4s");
   begin  -- Tex_Coord
      glTexCoord4s (S, T, R, Q);
   end Tex_Coord;

   procedure Tex_Coord (S : in Int;
                       T : in Int;
                       R : in Int;
                       Q : in Int) is
      procedure glTexCoord4i (S : in Int;
                              T : in Int;
                              R : in Int;
                              Q : in Int);
      pragma Import (C, glTexCoord4i, "glTexCoord4i");
   begin  -- Tex_Coord
      glTexCoord4i (S, T, R, Q);
   end Tex_Coord;

   procedure Tex_Coord (S : in Float;
                       T : in Float;
                       R : in Float;
                       Q : in Float) is
      procedure glTexCoord4f (S : in Float;
                              T : in Float;
                              R : in Float;
                              Q : in Float);
      pragma Import (C, glTexCoord4f, "glTexCoord4f");
   begin  -- Tex_Coord
      glTexCoord4f (S, T, R, Q);
   end Tex_Coord;

   procedure Tex_Coord (S : in Double;
                       T : in Double;
                       R : in Double;
                       Q : in Double) is
      procedure glTexCoord4d (S : in Double;
                              T : in Double;
                              R : in Double;
                              Q : in Double);
      pragma Import (C, glTexCoord4d, "glTexCoord4d");
   begin  -- Tex_Coord
      glTexCoord4d (S, T, R, Q);
   end Tex_Coord;

   procedure Tex_Coord (V : in Shorts_1) is
      procedure glTexCoord1sv (S : in Shorts_1);
      pragma Import (C, glTexCoord1sv, "glTexCoord1sv");
   begin  -- Tex_Coord
      glTexCoord1sv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Shorts_2) is
      procedure glTexCoord2sv (S : in Shorts_2);
      pragma Import (C, glTexCoord2sv, "glTexCoord2sv");
   begin  -- Tex_Coord
      glTexCoord2sv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Shorts_3) is
      procedure glTexCoord3sv (S : in Shorts_3);
      pragma Import (C, glTexCoord3sv, "glTexCoord3sv");
   begin  -- Tex_Coord
      glTexCoord3sv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Shorts_4) is
      procedure glTexCoord4sv (S : in Shorts_4);
      pragma Import (C, glTexCoord4sv, "glTexCoord4sv");
   begin  -- Tex_Coord
      glTexCoord4sv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Ints_1) is
      procedure glTexCoord1iv (S : in Ints_1);
      pragma Import (C, glTexCoord1iv, "glTexCoord1iv");
   begin  -- Tex_Coord
      glTexCoord1iv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Ints_2) is
      procedure glTexCoord2iv (S : in Ints_2);
      pragma Import (C, glTexCoord2iv, "glTexCoord2iv");
   begin  -- Tex_Coord
      glTexCoord2iv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Ints_3) is
      procedure glTexCoord3iv (S : in Ints_3);
      pragma Import (C, glTexCoord3iv, "glTexCoord3iv");
   begin  -- Tex_Coord
      glTexCoord3iv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Ints_4) is
      procedure glTexCoord4iv (S : in Ints_4);
      pragma Import (C, glTexCoord4iv, "glTexCoord4iv");
   begin  -- Tex_Coord
      glTexCoord4iv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Floats_1) is
      procedure glTexCoord1fv (S : in Floats_1);
      pragma Import (C, glTexCoord1fv, "glTexCoord1fv");
   begin  -- Tex_Coord
      glTexCoord1fv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Floats_2) is
      procedure glTexCoord2fv (S : in Floats_2);
      pragma Import (C, glTexCoord2fv, "glTexCoord2fv");
   begin  -- Tex_Coord
      glTexCoord2fv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Floats_3) is
      procedure glTexCoord3fv (S : in Floats_3);
      pragma Import (C, glTexCoord3fv, "glTexCoord3fv");
   begin  -- Tex_Coord
      glTexCoord3fv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Floats_4) is
      procedure glTexCoord4fv (S : in Floats_4);
      pragma Import (C, glTexCoord4fv, "glTexCoord4fv");
   begin  -- Tex_Coord
      glTexCoord4fv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Doubles_1) is
      procedure glTexCoord1dv (S : in Doubles_1);
      pragma Import (C, glTexCoord1dv, "glTexCoord1dv");
   begin  -- Tex_Coord
      glTexCoord1dv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Doubles_2) is
      procedure glTexCoord2dv (S : in Doubles_2);
      pragma Import (C, glTexCoord2dv, "glTexCoord2dv");
   begin  -- Tex_Coord
      glTexCoord2dv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Doubles_3) is
      procedure glTexCoord3dv (S : in Doubles_3);
      pragma Import (C, glTexCoord3dv, "glTexCoord3dv");
   begin  -- Tex_Coord
      glTexCoord3dv (V);
   end Tex_Coord;

   procedure Tex_Coord (V : in Doubles_4) is
      procedure glTexCoord4dv (S : in Doubles_4);
      pragma Import (C, glTexCoord4dv, "glTexCoord4dv");
   begin  -- Tex_Coord
      glTexCoord4dv (V);
   end Tex_Coord;

   ---------------------------------------------------------------------------

   procedure Vertex (X : in Short;
                     Y : in Short) is
      procedure glVertex2s (X : in Short;
                            Y : in Short);
      pragma Import (C, glVertex2s, "glVertex2s");
   begin  -- Vertex
      glVertex2s (X, Y);
   end Vertex;

   procedure Vertex (X : in Int;
                     Y : in Int) is
      procedure glVertex2i (X : in Int;
                            Y : in Int);
      pragma Import (C, glVertex2i, "glVertex2i");
   begin  -- Vertex
      glVertex2i (X, Y);
   end Vertex;

   procedure Vertex (X : in Float;
                     Y : in Float) is
      procedure glVertex2f (X : in Float;
                            Y : in Float);
      pragma Import (C, glVertex2f, "glVertex2f");
   begin  -- Vertex
      glVertex2f (X, Y);
   end Vertex;

   procedure Vertex (X : in Double;
                     Y : in Double) is
      procedure glVertex2d (X : in Double;
                            Y : in Double);
      pragma Import (C, glVertex2d, "glVertex2d");
   begin  -- Vertex
      glVertex2d (X, Y);
   end Vertex;

   procedure Vertex (X : in Short;
                     Y : in Short;
                     Z : in Short) is
      procedure glVertex3s (X : in Short;
                            Y : in Short;
                            Z : in Short);
      pragma Import (C, glVertex3s, "glVertex3s");
   begin  -- Vertex
      glVertex3s (X, Y, Z);
   end Vertex;

   procedure Vertex (X : in Int;
                     Y : in Int;
                     Z : in Int) is
      procedure glVertex3i (X : in Int;
                            Y : in Int;
                            Z : in Int);
      pragma Import (C, glVertex3i, "glVertex3i");
   begin  -- Vertex
      glVertex3i (X, Y, Z);
   end Vertex;

   procedure Vertex (X : in Float;
                     Y : in Float;
                     Z : in Float) is
      procedure glVertex3f (X : in Float;
                            Y : in Float;
                            Z : in Float);
      pragma Import (C, glVertex3f, "glVertex3f");
   begin  -- Vertex
      glVertex3f (X, Y, Z);
   end Vertex;

   procedure Vertex (X : in Double;
                     Y : in Double;
                     Z : in Double) is
      procedure glVertex3d (X : in Double;
                            Y : in Double;
                            Z : in Double);
      pragma Import (C, glVertex3d, "glVertex3d");
   begin  -- Vertex
      glVertex3d (X, Y, Z);
   end Vertex;

   procedure Vertex (X : in Short;
                     Y : in Short;
                     Z : in Short;
                     W : in Short) is
      procedure glVertex4s (X : in Short;
                            Y : in Short;
                            Z : in Short;
                            W : in Short);
      pragma Import (C, glVertex4s, "glVertex4s");
   begin  -- Vertex
      glVertex4s (X, Y, Z, W);
   end Vertex;

   procedure Vertex (X : in Int;
                     Y : in Int;
                     Z : in Int;
                     W : in Int) is
      procedure glVertex4i (X : in Int;
                            Y : in Int;
                            Z : in Int;
                            W : in Int);
      pragma Import (C, glVertex4i, "glVertex4i");
   begin  -- Vertex
      glVertex4i (X, Y, Z, W);
   end Vertex;

   procedure Vertex (X : in Float;
                     Y : in Float;
                     Z : in Float;
                     W : in Float) is
      procedure glVertex4f (X : in Float;
                            Y : in Float;
                            Z : in Float;
                            W : in Float);
      pragma Import (C, glVertex4f, "glVertex4f");
   begin  -- Vertex
      glVertex4f (X, Y, Z, W);
   end Vertex;

   procedure Vertex (X : in Double;
                     Y : in Double;
                     Z : in Double;
                     W : in Double) is
      procedure glVertex4d (X : in Double;
                            Y : in Double;
                            Z : in Double;
                            W : in Double);
      pragma Import (C, glVertex4d, "glVertex4d");
   begin  -- Vertex
      glVertex4d (X, Y, Z, W);
   end Vertex;

   procedure Vertex (V : in Shorts_2) is
      procedure glVertex2sv (V : in Shorts_2);
      pragma Import (C, glVertex2sv, "glVertex2sv");
   begin  -- Vertex
      glVertex2sv (V);
   end Vertex;

   procedure Vertex (V : in Shorts_3) is
      procedure glVertex3sv (V : in Shorts_3);
      pragma Import (C, glVertex3sv, "glVertex3sv");
   begin  -- Vertex
      glVertex3sv (V);
   end Vertex;

   procedure Vertex (V : in Shorts_4) is
      procedure glVertex4sv (V : in Shorts_4);
      pragma Import (C, glVertex4sv, "glVertex4sv");
   begin  -- Vertex
      glVertex4sv (V);
   end Vertex;

   procedure Vertex (V : in Ints_2) is
      procedure glVertex2iv (V : in Ints_2);
      pragma Import (C, glVertex2iv, "glVertex2iv");
   begin  -- Vertex
      glVertex2iv (V);
   end Vertex;

   procedure Vertex (V : in Ints_3) is
      procedure glVertex3iv (V : in Ints_3);
      pragma Import (C, glVertex3iv, "glVertex3iv");
   begin  -- Vertex
      glVertex3iv (V);
   end Vertex;

   procedure Vertex (V : in Ints_4) is
      procedure glVertex4iv (V : in Ints_4);
      pragma Import (C, glVertex4iv, "glVertex4iv");
   begin  -- Vertex
      glVertex4iv (V);
   end Vertex;

   procedure Vertex (V : in Floats_2) is
      procedure glVertex2fv (V : in Floats_2);
      pragma Import (C, glVertex2fv, "glVertex2fv");
   begin  -- Vertex
      glVertex2fv (V);
   end Vertex;

   procedure Vertex (V : in Floats_3) is
      procedure glVertex3fv (V : in Floats_3);
      pragma Import (C, glVertex3fv, "glVertex3fv");
   begin  -- Vertex
      glVertex3fv (V);
   end Vertex;

   procedure Vertex (V : in Floats_4) is
      procedure glVertex4fv (V : in Floats_4);
      pragma Import (C, glVertex4fv, "glVertex4fv");
   begin  -- Vertex
      glVertex4fv (V);
   end Vertex;

   procedure Vertex (V : in Doubles_2) is
      procedure glVertex2dv (V : in Doubles_2);
      pragma Import (C, glVertex2dv, "glVertex2dv");
   begin  -- Vertex
      glVertex2dv (V);
   end Vertex;

   procedure Vertex (V : in Doubles_3) is
      procedure glVertex3dv (V : in Doubles_3);
      pragma Import (C, glVertex3dv, "glVertex3dv");
   begin  -- Vertex
      glVertex3dv (V);
   end Vertex;

   procedure Vertex (V : in Doubles_4) is
      procedure glVertex4dv (V : in Doubles_4);
      pragma Import (C, glVertex4dv, "glVertex4dv");
   begin  -- Vertex
      glVertex4dv (V);
   end Vertex;

   ---------------------------------------------------------------------------

   procedure Vertex_Pointer (Size : in SizeI;
                             Element_Type : in Enum;
                             Stride : in SizeI;
                             Data_Pointer : in Pointer) is
      procedure glVertexPointer (Size : in SizeI;
                                 Element_Type : in Enum;
                                 Stride : in SizeI;
                                 Data_Pointer : in System.Address);
      pragma Import (C, glVertexPointer, "glVertexPointer");
   begin
      glVertexPointer (Size, Element_Type, Stride, Data_Pointer);
   end Vertex_Pointer;

   procedure Vertex_Pointer (Size : in SizeI;
                             Element_Type : in Enum;
                             Stride : in SizeI;
                             Offset : in SizeI) is
      procedure glVertexPointer (Size : in SizeI;
                                 Element_Type : in Enum;
                                 Stride : in SizeI;
                                 Offset : in SizeI);
      pragma Import (C, glVertexPointer, "glVertexPointer");
   begin
      glVertexPointer (Size, Element_Type, Stride, Offset);
   end Vertex_Pointer;
end Lumen.GL;
