
-- Lumen.Window -- Create and destroy native windows and associated OpenGL
-- rendering contexts
--
-- Chip Richards, NiEstu, Phoenix AZ, Spring 2010

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

-- The declarations below include a minimal Xlib binding, adapted from code by
-- Hans-Frieder Vogt and Vadim Godunko.  Their code was GPLv2, but I've raped
-- it so badly, and they haven't touched it in so long, that I feel okay about
-- including its derivation here.  Also included is a minimal binding to GLX,
-- adapted from another bit of abandonware originally by David Holm.  His
-- license was a different one still, and the above excuse also applies to it.


-- Environment
with Ada.Calendar;
with Ada.Command_Line;
with Ada.Directories;
with System;

with GNAT.Case_Util;

with GL;

-- This is really "part of" this package, just packaged separately so it can
-- be used in Events
with Lumen.Internal;
use  Lumen.Internal;

package body Lumen.Window is

   ---------------------------------------------------------------------------

   -- Xlib stuff needed by more than one of the routines below
   type Data_Format_Type is (Invalid, Bits_8, Bits_16, Bits_32);
   for  Data_Format_Type use (Invalid => 0, Bits_8 => 8, Bits_16 => 16, Bits_32 => 32);

   String_Encoding : String := "STRING" & ASCII.NUL;

   type X_Class_Hint is record
      Instance_Name : System.Address;
      Class_Name    : System.Address;
   end record;

   type X_Text_Property is record
      Value    : System.Address;
      Encoding : Atom;
      Format   : Data_Format_Type;
      NItems   : Long_Integer;
   end record;

   function X_Intern_Atom (Display        : Display_Pointer;
                           Name           : System.Address;
                           Only_If_Exists : Natural)
   return Atom;
   pragma Import (C, X_Intern_Atom, "XInternAtom");

   procedure X_Set_Class_Hint (Display : in Display_Pointer;
                               Window  : in Window_ID;
                               Hint    : in X_Class_Hint);
   pragma Import (C, X_Set_Class_Hint, "XSetClassHint");

   procedure X_Set_Icon_Name (Display : in Display_Pointer;
                              Window  : in Window_ID;
                              Name    : in System.Address);
   pragma Import (C, X_Set_Icon_Name, "XSetIconName");

   procedure X_Set_WM_Icon_Name (Display   : in Display_Pointer;
                                 Window    : in Window_ID;
                                 Text_Prop : in System.Address);
   pragma Import (C, X_Set_WM_Icon_Name, "XSetWMIconName");

   procedure X_Set_WM_Name (Display   : in Display_Pointer;
                            Window    : in Window_ID;
                            Text_Prop : in System.Address);
   pragma Import (C, X_Set_WM_Name, "XSetWMName");

   ---------------------------------------------------------------------------

   -- GLX stuff needed by more than one of the routines below
   function GLX_Create_Context (Display    : Display_Pointer;
                                Visual     : X_Visual_Info_Pointer;
                                Share_List : GLX_Context;
                                Direct     : GL.GLboolean)
   return GLX_Context;
   pragma Import (C, GLX_Create_Context, "glXCreateContext");

   function GLX_Make_Current (Display  : Display_Pointer;
                              Drawable : Window_ID;
                              Context  : GLX_Context)
   return GL.GLboolean;
   pragma Import (C, GLX_Make_Current, "glXMakeCurrent");

   ---------------------------------------------------------------------------

   -- Create a native window
   function Create (Parent        : Handle           := No_Window;
                    Width         : Natural          := 400;
                    Height        : Natural          := 400;
                    Events        : Wanted_Event_Set := Want_No_Events;
                    Name          : String           := "";
                    Icon_Name     : String           := "";
                    Class_Name    : String           := "";
                    Instance_Name : String           := "";
                    Context       : Context_Handle   := No_Context;
                    Depth         : Color_Depth      := True_Color;
                    Animated      : Boolean          := True)
   return Handle is

      -- Xlib types needed only by Create
      type Alloc_Mode               is (Alloc_None, Alloc_All);
      type Atom_Array               is array (Positive range <>) of Atom;
      type Colormap_ID              is new Long_Integer;
      type X_Window_Attributes_Mask is mod 2 ** Integer'Size;
      type Window_Class             is (Copy_From_Parent, Input_Output, Input_Only);
      type X_Event_Mask             is mod 2 ** Long_Integer'Size;

      subtype Dimension is Short_Integer;
      subtype Pixel     is Long_Integer;
      subtype Position  is Short_Integer;

      -- An extremely abbreviated version of the XMapEvent structure.
      type Map_Event_Data is record
         Event_Type : Integer;
         Pad        : Padding;
      end record;

      -- An extremely abbreviated version of the XSetWindowAttributes
      -- structure, containing only the fields we care about.
      --
      -- NOTE: offset multiplier values are for 64-bit systems; values for
      -- 32-bit systems are 10 and 13, since long size equals int size and the
      -- record has no padding.
      Long_Bytes : constant := Long_Integer'Size / 8;
      Long_Bits  : constant := Long_Integer'Size - 1;
      type X_Set_Window_Attributes is record
         Event_Mask  : X_Event_Mask := 0;
         Colormap    : Colormap_ID  := 0;
      end record;
      for X_Set_Window_Attributes use record
         Event_Mask  at Long_Bytes *  9 range 0 .. Long_Bits;
         Colormap    at Long_Bytes * 12 range 0 .. Long_Bits;
      end record;

      -- Xlib functions needed only by Create
      function X_Create_Colormap (Display : Display_Pointer;
                                  Window  : Window_ID;
                                  Visual  : System.Address;
                                  Alloc   : Alloc_Mode)
      return Colormap_ID;
      pragma Import (C, X_Create_Colormap, "XCreateColormap");

      function X_Create_Window (Display      : Display_Pointer;
                                Parent       : Window_ID;
                                X            : Position;
                                Y            : Position;
                                Width        : Dimension;
                                Height       : Dimension;
                                Border_Width : Natural;
                                Depth        : Screen_Depth;
                                Class        : Window_Class;
                                Visual       : System.Address;
                                Valuemask    : X_Window_Attributes_Mask;
                                Attributes   : System.Address)
      return Window_ID;
      pragma Import (C, X_Create_Window, "XCreateWindow");

      function X_Default_Screen (Display : Display_Pointer) return Screen_Number;
      pragma Import (C, X_Default_Screen, "XDefaultScreen");

      procedure X_Map_Window (Display : in Display_Pointer;   Window : in Window_ID);
      pragma Import (C, X_Map_Window, "XMapWindow");

      function X_Open_Display (Display_Name : System.Address := System.Null_Address) return Display_Pointer;
      pragma Import (C, X_Open_Display, "XOpenDisplay");

      function X_Root_Window (Display : Display_Pointer;   Screen_Num : Screen_Number) return Window_ID;
      pragma Import (C, X_Root_Window, "XRootWindow");

      procedure X_Set_WM_Protocols (Display   : in Display_Pointer;
                                    Window    : in Window_ID;
                                    Protocols : in System.Address;
                                    Count     : in Integer);
      pragma Import (C, X_Set_WM_Protocols, "XSetWMProtocols");

      -- Xlib constants needed only by Create
      Configure_Event_Mask : constant X_Window_Attributes_Mask := 2#00_1000_0000_0000#;  -- 11th bit
      Configure_Colormap   : constant X_Window_Attributes_Mask := 2#10_0000_0000_0000#;  -- 13th bit
      X_Map_Notify         : constant := 19;  -- the one event we look for here

      -- Atom names
      WM_Del          : String := "WM_DELETE_WINDOW" & ASCII.NUL;

      ------------------------------------------------------------------------

      -- GLX types needed only by Create
      Max_GLX_Attributes : constant := 3;
      type GLX_Attribute_List     is array (1 .. Max_GLX_Attributes) of Integer;
      type GLX_Attribute_List_Ptr is new System.Address;

      -- GLX functions needed only by Create
      function GLX_Choose_Visual (Display        : Display_Pointer;
                                  Screen         : Screen_Number;
                                  Attribute_List : GLX_Attribute_List_Ptr)
      return X_Visual_Info_Pointer;
      pragma Import (C, GLX_Choose_Visual, "glXChooseVisual");

      -- GLX constants needed only by Create
      GLX_None            : constant := 0;
      GLX_RGBA            : constant := 4;
      GLX_Double_Buffered : constant := 5;

      ------------------------------------------------------------------------

      -- Event masks
      type Event_Mask_Table is array (Wanted_Event) of X_Event_Mask;
      Event_Masks : constant Event_Mask_Table :=
         (Want_Key_Press       => 2#0000_0000_0000_0000_0000_0001#,
          Want_Key_Release     => 2#0000_0000_0000_0000_0000_0010#,
          Want_Button_Press    => 2#0000_0000_0000_0000_0000_0100#,
          Want_Button_Release  => 2#0000_0000_0000_0000_0000_1000#,
          Want_Window_Enter    => 2#0000_0000_0000_0000_0001_0000#,
          Want_Window_Leave    => 2#0000_0000_0000_0000_0010_0000#,
          Want_Pointer_Move    => 2#0000_0000_0000_0000_0100_0000#,
          Want_Pointer_Drag    => 2#0000_0000_0010_0000_0000_0000#,
          Want_Exposure        => 2#0000_0000_1000_0000_0000_0000#,
          Want_Focus_Change    => 2#0010_0000_0000_0000_0000_0000#
         );
      Structure_Notify_Mask : constant X_Event_Mask := 2#0000_0010_0000_0000_0000_0000#;  -- 17th bit, always want this one

      -- Variables used in Create
      Con_Attributes : GLX_Attribute_List := (others => GLX_None);
      Con_Attr_Index : Positive := Con_Attributes'First;
      Our_Context    : GLX_Context;
      Did            : GL.GLboolean;
      Display        : Display_Pointer;
      Mapped         : Map_Event_Data;
      Our_Parent     : Window_ID;
      Visual         : X_Visual_Info_Pointer;
      Win_Attributes : X_Set_Window_Attributes;
      Window         : Window_ID;

      ------------------------------------------------------------------------

   begin  -- Create

      -- Connect to the X server
      Display := X_Open_Display;
      if Display = Null_Display_Pointer then
         raise Connection_Failed;
      end if;

      -- Get an appropriate visual
      if Depth = True_Color then
         Con_Attributes (Con_Attr_Index) := GLX_RGBA;
         Con_Attr_Index := Con_Attr_Index + 1;
      end if;
      if Animated then
         Con_Attributes (Con_Attr_Index) := GLX_Double_Buffered;
         Con_Attr_Index := Con_Attr_Index + 1;
      end if;
      Visual := GLX_Choose_Visual (Display, X_Default_Screen (Display), GLX_Attribute_List_Ptr (Con_Attributes'Address));

      -- Pick the parent window to use
      if Parent = No_Window then
         Our_Parent := X_Root_Window (Display, Visual.Screen);
      else
         Our_Parent := Parent.Window;
      end if;

      -- Build the event mask as requested by the caller
      Win_Attributes.Event_Mask := Structure_Notify_Mask;
      for E in Wanted_Event loop
         if Events (E) then
            Win_Attributes.Event_Mask := Win_Attributes.Event_Mask or Event_Masks (E);
         end if;
      end loop;

      -- Create the window and map it
      Win_Attributes.Colormap   := X_Create_Colormap (Display, Our_Parent, Visual.Visual, Alloc_None);
      Window := X_Create_Window (Display, Our_Parent, 0, 0, Dimension (Width), Dimension (Height), 0,
                                 Visual.Depth, Input_Output, Visual.Visual,
                                 Configure_Colormap or Configure_Event_Mask, Win_Attributes'Address);
      X_Map_Window (Display, Window);

      -- Wait for the window to be mapped
      loop
         X_Next_Event (Display, Mapped'Address);
         exit when Mapped.Event_Type = X_Map_Notify;
      end loop;

      -- Tell the window manager that we want the close button sent to us
      Delete_Window_Atom := X_Intern_Atom (Display, WM_Del'Address, 0);
      X_Set_WM_Protocols (Display, Window, Delete_Window_Atom'Address, 1);

      -- Figure out what we want to call the new window
      declare
         Application_Name : String := Ada.Directories.Simple_Name (Ada.Command_Line.Command_Name);
         App_Class_Name   : String := Application_Name;  -- converted to mixed case shortly
         Class_String     : System.Address;
         Instance_String  : System.Address;
         Name_Property    : X_Text_Property;
      begin
         GNAT.Case_Util.To_Mixed (App_Class_Name);

         -- Set the window name
         if Name'Length < 1 then
            Name_Property := (Application_Name'Address,
                              X_Intern_Atom (Display, String_Encoding'Address, 0),
                              Bits_8,
                              Application_Name'Length);
         else
            Name_Property := (Name'Address,
                              X_Intern_Atom (Display, String_Encoding'Address, 0),
                              Bits_8,
                              Name'Length);
         end if;
         X_Set_WM_Name (Display, Window, Name_Property'Address);

         -- Set the icon name
         if Icon_Name'Length < 1 then
            Name_Property := (Application_Name'Address,
                              X_Intern_Atom (Display, String_Encoding'Address, 0),
                              Bits_8,
                              Application_Name'Length);
            X_Set_Icon_Name (Display, Window, Application_Name'Address);
         else
            Name_Property := (Icon_Name'Address,
                              X_Intern_Atom (Display, String_Encoding'Address, 0),
                              Bits_8,
                              Name'Length);
            X_Set_Icon_Name (Display, Window, Icon_Name'Address);
         end if;
         X_Set_WM_Icon_Name (Display, Window, Name_Property'Address);

         -- Set the class and instance names
         if Class_Name'Length < 1 then
            Class_String := App_Class_Name'Address;
         else
            Class_String := Class_Name'Address;
         end if;
         if Instance_Name'Length < 1 then
            Instance_String := Application_Name'Address;
         else
            Instance_String := Instance_Name'Address;
         end if;
         X_Set_Class_Hint (Display, Window, (Class_String, Instance_String));
      end;

      -- Connect the OpenGL context to the new X window
      if Context = No_Context then
         Our_Context := GLX_Create_Context (Display, Visual, GLX_Context (System.Null_Address), GL.GL_TRUE);
      else
         Our_Context := Context;
      end if;
      Did := GLX_Make_Current (Display, Window, Our_Context);
      declare
         use GL;
      begin
         if Did /= GL_TRUE then
            raise Context_Failed;
         end if;
      end;

      -- Return the results
      return Window_Info'(Display     => Display,
                          Window      => Window,
                          Visual      => Visual,
                          Width       => Width,
                          Height      => Height,
                          Prior_Frame => Never,
                          App_Start   => Ada.Calendar.Clock,
                          Last_Start  => Ada.Calendar.Clock,
                          App_Frames  => 0,
                          Last_Frames => 0,
                          Context     => Our_Context);
   end Create;

   ---------------------------------------------------------------------------

   -- Destroy a native window, including its current rendering context.
   procedure Destroy (Win : in out Handle) is

      procedure X_Destroy_Window (Display : in Display_Pointer;   Window : in Window_ID);
      pragma Import (C, X_Destroy_Window, "XDestroyWindow");

   begin  -- Destroy
      X_Destroy_Window (Win.Display, Win.Window);
      Win := No_Window;
   end Destroy;

   ---------------------------------------------------------------------------

   -- Set various textual names associated with a window.  Null string means
   -- leave the current value unchanged.  In the case of class and instance
   -- names, both must be given to change either one.
   procedure Set_Names (Win           : in Handle;
                        Name          : in String           := "";
                        Icon_Name     : in String           := "";
                        Class_Name    : in String           := "";
                        Instance_Name : in String           := "") is

      Name_Property : X_Text_Property;

   begin  -- Set_Names

      -- Set the window name if one was given
      if Name'Length >= 1 then
         Name_Property := (Name'Address,
                           X_Intern_Atom (Win.Display, String_Encoding'Address, 0),
                           Bits_8,
                           Name'Length);
         X_Set_WM_Name (Win.Display, Win.Window, Name_Property'Address);
      end if;

      -- Set the icon name if one was given
      if Icon_Name'Length >= 1 then
         X_Set_Icon_Name (Win.Display, Win.Window, Icon_Name'Address);
         Name_Property := (Icon_Name'Address,
                           X_Intern_Atom (Win.Display, String_Encoding'Address, 0),
                           Bits_8,
                           Name'Length);
         X_Set_WM_Icon_Name (Win.Display, Win.Window, Name_Property'Address);
      end if;

      -- Set the class and instance names if they were both given
      if Class_Name'Length >= 1 and Instance_Name'Length >= 1 then
         X_Set_Class_Hint (Win.Display, Win.Window, (Class_Name'Address, Instance_Name'Address));
      end if;
   end Set_Names;

   ---------------------------------------------------------------------------

   -- Create an OpenGL rendering context; needed only when you want a second
   -- or subsequent context for a window, since Create makes one to start
   -- with
   function Create_Context (Win : Handle) return Context_Handle is
   begin  -- Create_Context
      return GLX_Create_Context (Win.Display, Win.Visual, GLX_Context (System.Null_Address), GL.GL_TRUE);
   end Create_Context;

   ---------------------------------------------------------------------------

   -- Destroy an OpenGL rendering context
   procedure Destroy_Context (Win : in out Handle) is

      procedure GLX_Destroy_Context (Display : in Display_Pointer;
                                     Context : GLX_Context);
      pragma Import (C, GLX_Destroy_Context, "glXDestroyContext");

   begin  -- Destroy_Context
      GLX_Destroy_Context (Win.Display, Win.Context);
      Win.Context := No_Context;
   end Destroy_Context;

   ---------------------------------------------------------------------------

   -- Make a rendering context the current one for a window
   procedure Make_Current (Win     : in out Handle;
                           Context : in     Context_Handle) is

      use GL;

   begin  -- Make_Current
      if GLX_Make_Current (Win.Display, Win.Window, Context) = GL_TRUE then
         Win.Context := Context;
      else
         raise Context_Failed;
      end if;
   end Make_Current;

   ---------------------------------------------------------------------------

   -- Promotes the back buffer to front; only valid if the window is double
   -- buffered, meaning Animated was true when the window was created.  Useful
   -- for smooth animation.
   procedure Swap (Win : in Handle) is

      procedure GLX_Swap_Buffers (Display : in Display_Pointer;   Window : in Window_ID);
      pragma Import (C, GLX_Swap_Buffers, "glXSwapBuffers");

   begin  -- Swap
      GLX_Swap_Buffers (Win.Display, Win.Window);
   end Swap;

   ---------------------------------------------------------------------------

end Lumen.Window;
